<script setup lang="ts">
import AppFooter from "@/components/AppFooter.vue";
import GlobalTaskProgressBar from "@/components/GlobalTaskProgressBar.vue";
import Sidebar from "@/components/layout/Sidebar.vue";
import TopBar from "@/components/layout/TopBar.vue";
import { useSidebar } from "@/composables/useSidebar";
import { useMediaQuery } from "@vueuse/core";
import { AnimatePresence, motion } from "motion-v";
import { onMounted, onUnmounted, watch } from "vue";

const isMobile = useMediaQuery("(max-width: 768px)");
const { collapsed, mobileOpen, closeMobile, toggleMobile, toggleCollapsed } = useSidebar();

watch(isMobile, value => {
  if (!value) {
    closeMobile();
  }
});

const handleKeydown = (e: KeyboardEvent) => {
  if (e.key !== "[") return;
  if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;

  const target = e.target as HTMLElement | null;
  const tag = target?.tagName?.toLowerCase();
  if (tag === "input" || tag === "textarea") return;
  if ((target as HTMLElement | null)?.isContentEditable) return;

  toggleCollapsed();
};

onMounted(() => {
  window.addEventListener("keydown", handleKeydown);
});

onUnmounted(() => {
  window.removeEventListener("keydown", handleKeydown);
});
</script>

<template>
  <div class="app-shell">
    <div
      v-if="!isMobile"
      class="app-sider"
      :class="{ 'is-collapsed': collapsed }"
      :style="{ width: collapsed ? '72px' : '260px' }"
    >
      <sidebar :collapsed="collapsed" @toggle-collapse="toggleCollapsed" />
    </div>

    <div class="app-main">
      <top-bar
        :is-mobile="!!isMobile"
        :sidebar-collapsed="collapsed"
        @toggle-mobile="toggleMobile"
        @toggle-collapse="toggleCollapsed"
      />

      <main class="app-content">
        <div class="content-inner">
          <router-view v-slot="{ Component, route }">
            <animate-presence>
              <motion.div
                :key="route.fullPath"
                class="page-motion"
                :initial="{ opacity: 0, y: 10 }"
                :animate="{ opacity: 1, y: 0 }"
                :exit="{ opacity: 0, y: -8 }"
                :transition="{
                  duration: 0.18,
                  ease: [0.22, 1, 0.36, 1],
                }"
              >
                <component :is="Component" />
              </motion.div>
            </animate-presence>
          </router-view>
        </div>
      </main>

      <app-footer />
    </div>
  </div>

  <!-- Mobile drawer -->
  <n-drawer v-model:show="mobileOpen" :width="280" placement="left" :auto-focus="false">
    <n-drawer-content body-content-style="padding: 0; height: 100%;">
      <sidebar :collapsed="false" :auto-close="true" @close="closeMobile" />
    </n-drawer-content>
  </n-drawer>

  <!-- 全局任务进度条 -->
  <global-task-progress-bar />
</template>

<style scoped>
.app-shell {
  height: 100vh;
  display: flex;
  background: transparent;
}

.app-sider {
  flex: 0 0 auto;
  height: 100%;
  position: sticky;
  top: 0;
  background: var(--card-bg-solid);
  border-right: 1px solid var(--border-color-light);
  transition: width 0.22s cubic-bezier(0.2, 0.8, 0.2, 1);
  overflow: hidden;
}

.app-main {
  flex: 1;
  min-width: 0;
  height: 100%;
  display: flex;
  flex-direction: column;
}

.app-content {
  flex: 1;
  min-height: 0;
  overflow: auto;
  background: transparent;
}

.content-inner {
  width: 100%;
  max-width: 1280px;
  margin: 0 auto;
  padding: 20px 20px 28px;
}

.page-motion {
  width: 100%;
}

@media (max-width: 768px) {
  .content-inner {
    padding: 16px;
  }
}
</style>
