<script setup lang="ts">
import {
  IconDashboard,
  IconKeys,
  IconLogs,
  IconSettings,
} from "@/components/icons";
import { type MenuOption, NIcon } from "naive-ui";
import { computed, h, watch } from "vue";
import { useI18n } from "vue-i18n";
import { RouterLink, useRoute } from "vue-router";

const { t } = useI18n();

const props = defineProps({
  mode: {
    type: String,
    default: "horizontal",
  },
});

const emit = defineEmits(["close"]);

// 图标映射
const iconComponents: Record<string, any> = {
  dashboard: IconDashboard,
  keys: IconKeys,
  logs: IconLogs,
  settings: IconSettings,
};

const menuOptions = computed<MenuOption[]>(() => {
  const options: MenuOption[] = [
    renderMenuItem("dashboard", t("nav.dashboard")),
    renderMenuItem("keys", t("nav.keys")),
    renderMenuItem("logs", t("nav.logs")),
    renderMenuItem("settings", t("nav.settings")),
  ];

  return options;
});

const route = useRoute();
const activeMenu = computed(() => route.name);

watch(activeMenu, () => {
  if (props.mode === "vertical") {
    emit("close");
  }
});

function renderMenuItem(key: string, label: string): MenuOption {
  const iconComponent = iconComponents[key];
  return {
    label: () =>
      h(
        RouterLink,
        {
          to: {
            name: key,
          },
          class: "nav-menu-item",
        },
        {
          default: () => [
            h(
              "span",
              { class: "nav-item-icon" },
              h(NIcon, { component: iconComponent, size: 18 })
            ),
            h("span", { class: "nav-item-text" }, label),
          ],
        }
      ),
    key,
  };
}
</script>

<template>
  <div>
    <n-menu :mode="mode" :options="menuOptions" :value="activeMenu" class="modern-menu" />
  </div>
</template>

<style scoped>
:deep(.nav-menu-item) {
  display: flex;
  align-items: center;
  gap: 8px;
  text-decoration: none;
  color: inherit;
  padding: 8px;
  border-radius: var(--border-radius-md);
  transition: all 0.2s ease;
  font-weight: 500;
}

:deep(.n-menu-item) {
  border-radius: var(--border-radius-md);
}

:deep(.n-menu--vertical .n-menu-item-content) {
  justify-content: center;
}

:deep(.n-menu--vertical .n-menu-item) {
  margin: 4px 8px;
}

:deep(.n-menu-item:hover) {
  background: rgba(0, 122, 255, 0.1);
  transform: translateY(-1px);
  border-radius: var(--border-radius-md);
}

:deep(.n-menu-item--selected) {
  background: var(--primary-gradient);
  color: white;
  font-weight: 600;
  box-shadow: var(--shadow-md);
  border-radius: var(--border-radius-md);
}

:deep(.n-menu-item--selected:hover) {
  background: linear-gradient(135deg, #0056CC 0%, #4AA8E0 100%);
  transform: translateY(-1px);
}
</style>
