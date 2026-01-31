<script setup lang="ts">
// Logs icon - Document/List style
// Replaces emoji: 📋
defineProps<{
  size?: number | string;
  color?: string;
}>();
</script>

<template>
  <svg
    :width="size || 20"
    :height="size || 20"
    viewBox="0 0 24 24"
    fill="none"
    xmlns="http://www.w3.org/2000/svg"
  >
    <rect x="4" y="3" width="16" height="18" rx="2" stroke="currentColor" stroke-width="2" fill="none" />
    <line x1="8" y1="8" x2="16" y2="8" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
    <line x1="8" y1="12" x2="16" y2="12" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
    <line x1="8" y1="16" x2="12" y2="16" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
  </svg>
</template>
