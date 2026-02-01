<script setup lang="ts">
import LanguageSelector from "@/components/LanguageSelector.vue";
import Logout from "@/components/Logout.vue";
import ThemeToggle from "@/components/ThemeToggle.vue";
import { ChevronsLeft, ChevronsRight, Menu } from "lucide-vue-next";
import { computed } from "vue";
import { useRoute } from "vue-router";
import { useI18n } from "vue-i18n";

const props = defineProps<{
  isMobile: boolean;
  sidebarCollapsed: boolean;
}>();

const emit = defineEmits<{
  (e: "toggle-mobile"): void;
  (e: "toggle-collapse"): void;
}>();

const route = useRoute();
const { t } = useI18n();

const pageTitle = computed(() => {
  switch (route.name) {
    case "dashboard":
      return t("nav.dashboard");
    case "keys":
      return t("nav.keys");
    case "logs":
      return t("nav.logs");
    case "settings":
      return t("nav.settings");
    default:
      return "GPT Load";
  }
});

const desktopToggleIcon = computed(() => (props.sidebarCollapsed ? ChevronsRight : ChevronsLeft));
</script>

<template>
  <header class="topbar">
    <div class="topbar__left">
      <n-button
        quaternary
        circle
        class="topbar__toggle"
        @click="props.isMobile ? emit('toggle-mobile') : emit('toggle-collapse')"
      >
        <template #icon>
          <component
            :is="props.isMobile ? Menu : desktopToggleIcon"
            :size="18"
            :stroke-width="1.75"
          />
        </template>
      </n-button>

      <div class="topbar__title">
        {{ pageTitle }}
      </div>
    </div>

    <div class="topbar__right">
      <language-selector />
      <theme-toggle />
      <logout />
    </div>
  </header>
</template>

<style scoped>
.topbar {
  height: 56px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 16px;
  background: var(--header-bg);
  border-bottom: 1px solid var(--border-color-light);
  backdrop-filter: blur(18px);
}

.topbar__left {
  display: flex;
  align-items: center;
  gap: 10px;
  min-width: 0;
}

.topbar__title {
  font-size: 14px;
  font-weight: 700;
  letter-spacing: -0.2px;
  color: var(--text-primary);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.topbar__right {
  display: flex;
  align-items: center;
  gap: 8px;
}

/* 小屏时缩短一些内容，避免拥挤 */
@media (max-width: 420px) {
  .topbar__right :deep(.logout-button) {
    display: none;
  }

  .topbar {
    padding: 0 10px;
  }
}
</style>

