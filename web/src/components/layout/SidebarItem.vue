<script setup lang="ts">
import { motion } from "motion-v";
import type { Component } from "vue";

defineProps<{
  icon: Component;
  label: string;
  collapsed?: boolean;
  disabled?: boolean;
}>();

defineEmits<{
  (e: "click"): void;
}>();
</script>

<template>
  <motion.button
    class="sidebar-item"
    type="button"
    :disabled="disabled"
    :title="collapsed ? label : undefined"
    :while-hover="disabled ? undefined : { y: -1 }"
    :while-press="disabled ? undefined : { scale: 0.98 }"
    :transition="{ type: 'spring', stiffness: 520, damping: 34, mass: 0.6 }"
    @click="$emit('click')"
  >
    <component :is="icon" class="sidebar-item__icon" :size="18" :stroke-width="1.75" />
    <span v-if="!collapsed" class="sidebar-item__label">
      {{ label }}
    </span>
  </motion.button>
</template>

<style scoped>
.sidebar-item {
  height: 36px;
  width: 100%;
  display: inline-flex;
  align-items: center;
  gap: 10px;
  padding: 0 10px;
  border-radius: 10px;
  border: 1px solid transparent;
  background: transparent;
  color: var(--text-secondary);
  cursor: pointer;
  transition:
    background 0.18s ease,
    border-color 0.18s ease;
}

.sidebar-item:hover {
  background: rgba(0, 0, 0, 0.04);
  border-color: var(--border-color-light);
}

:global(.dark) .sidebar-item:hover {
  background: rgba(255, 255, 255, 0.06);
}

.sidebar-item:disabled {
  opacity: 0.5;
  cursor: not-allowed;
  transform: none;
}

.sidebar-item__icon {
  flex: 0 0 auto;
}

.sidebar-item__label {
  flex: 1;
  text-align: left;
  font-size: 13px;
  font-weight: 600;
  letter-spacing: -0.1px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>

