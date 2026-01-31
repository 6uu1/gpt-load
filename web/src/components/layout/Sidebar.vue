<script setup lang="ts">
import NavBar from "@/components/NavBar.vue";
import SidebarItem from "@/components/layout/SidebarItem.vue";
import { ChevronsLeft, ChevronsRight } from "lucide-vue-next";
import { computed } from "vue";

const props = withDefaults(
  defineProps<{
    collapsed?: boolean;
    autoClose?: boolean;
  }>(),
  {
    collapsed: false,
    autoClose: false,
  }
);

const emit = defineEmits<{
  (e: "toggle-collapse"): void;
  (e: "close"): void;
}>();

const collapseIcon = computed(() => (props.collapsed ? ChevronsRight : ChevronsLeft));
</script>

<template>
  <aside class="sidebar" :class="{ 'is-collapsed': collapsed }">
    <div class="sidebar__brand">
      <div class="sidebar__logo">
        <img src="@/assets/logo.png" alt="GPT Load" />
      </div>
      <div v-if="!collapsed" class="sidebar__brandText">
        <div class="sidebar__brandName">GPT Load</div>
        <div class="sidebar__brandSub">Dashboard</div>
      </div>
    </div>

    <div class="sidebar__nav">
      <nav-bar mode="vertical" :collapsed="collapsed" :auto-close="autoClose" @close="emit('close')" />
    </div>

    <div class="sidebar__footer">
      <sidebar-item
        :icon="collapseIcon"
        :collapsed="collapsed"
        :label="collapsed ? 'Expand' : 'Collapse'"
        @click="emit('toggle-collapse')"
      />
    </div>
  </aside>
</template>

<style scoped>
.sidebar {
  height: 100%;
  display: flex;
  flex-direction: column;
  padding: 14px 10px 12px;
  gap: 10px;
}

.sidebar__brand {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 10px 10px 6px;
  user-select: none;
}

.sidebar__logo {
  width: 34px;
  height: 34px;
  border-radius: 10px;
  display: grid;
  place-items: center;
  background: var(--card-bg);
  border: 1px solid var(--border-color-light);
  box-shadow: var(--shadow-sm);
  overflow: hidden;
}

.sidebar__logo img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.sidebar__brandText {
  display: flex;
  flex-direction: column;
  line-height: 1.1;
  min-width: 0;
}

.sidebar__brandName {
  font-size: 14px;
  font-weight: 800;
  letter-spacing: -0.2px;
  color: var(--text-primary);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.sidebar__brandSub {
  margin-top: 2px;
  font-size: 12px;
  font-weight: 600;
  color: var(--text-tertiary);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.sidebar__nav {
  flex: 1;
  min-height: 0;
  padding: 0 4px;
}

.sidebar__footer {
  padding: 8px 4px 0;
  border-top: 1px solid var(--border-color-light);
}

/* 深色模式下 hover 的底色更柔和一些 */
:global(.dark) .sidebar :deep(.sidebar-item:hover) {
  background: rgba(255, 255, 255, 0.06);
}
</style>

