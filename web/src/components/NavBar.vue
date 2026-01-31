<script setup lang="ts">
import type { MenuOption } from "naive-ui";
import { BarChart3, FileText, KeyRound, LayoutDashboard, Settings } from "lucide-vue-next";
import { computed, h, watch } from "vue";
import { useI18n } from "vue-i18n";
import { RouterLink, useRoute } from "vue-router";

const { t } = useI18n();

const props = withDefaults(
  defineProps<{
    mode?: "vertical" | "horizontal";
    collapsed?: boolean;
    autoClose?: boolean;
  }>(),
  {
    mode: "vertical",
    collapsed: false,
    autoClose: false,
  }
);

const emit = defineEmits<{
  (e: "close"): void;
}>();

// 图标映射（Lucide）
const iconComponents: Record<string, any> = {
  dashboard: LayoutDashboard,
  keys: KeyRound,
  logs: FileText,
  settings: Settings,
  // 预留：后续如果要加“统计/分析”等页面
  analytics: BarChart3,
};

const menuOptions = computed<MenuOption[]>(() => {
  return [
    renderMenuItem("dashboard", t("nav.dashboard")),
    renderMenuItem("keys", t("nav.keys")),
    renderMenuItem("logs", t("nav.logs")),
    renderMenuItem("settings", t("nav.settings")),
  ];
});

const route = useRoute();
const activeMenu = computed<string | null>(() => (typeof route.name === "string" ? route.name : null));

watch(activeMenu, () => {
  if (props.autoClose && props.mode === "vertical") {
    emit("close");
  }
});

function renderMenuItem(key: string, label: string): MenuOption {
  const iconComponent = iconComponents[key];
  return {
    key,
    icon: () => h(iconComponent, { size: 18, strokeWidth: 1.75 }),
    label: () =>
      h(
        RouterLink,
        {
          to: { name: key },
          class: "nav-link",
        },
        { default: () => label }
      ),
  };
}
</script>

<template>
  <n-menu
    :mode="mode"
    :options="menuOptions"
    :value="activeMenu"
    :collapsed="mode === 'vertical' ? collapsed : false"
    :collapsed-width="72"
    :collapsed-icon-size="18"
    :icon-size="18"
    class="nav-menu"
  />
</template>

<style scoped>
/* 让 RouterLink 撑满整行可点击区域 */
:deep(.nav-link) {
  width: 100%;
  display: inline-flex;
  align-items: center;
  text-decoration: none;
  color: inherit;
  font-weight: 600;
  letter-spacing: -0.1px;
}

:deep(.n-menu-item) {
  margin: 4px 8px;
}

:deep(.n-menu-item-content) {
  border-radius: 12px;
  transition:
    background 0.18s ease,
    transform 0.18s ease;
}

:deep(.n-menu-item:hover .n-menu-item-content) {
  background: var(--hover-bg);
  transform: translateY(-1px);
}

:deep(.n-menu-item--selected .n-menu-item-content) {
  background: rgba(0, 122, 255, 0.14);
  color: var(--text-primary);
}

:global(.dark) :deep(.n-menu-item--selected .n-menu-item-content) {
  background: rgba(0, 122, 255, 0.22);
}

/* 折叠时让内容居中更像 Vercel */
:deep(.n-menu--vertical.n-menu--collapsed .n-menu-item-content) {
  justify-content: center;
}
</style>
