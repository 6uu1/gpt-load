<script setup lang="ts">
// Robot/AI icon - Bot style
// Replaces emoji: 🤖
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
    <rect x="4" y="8" width="16" height="12" rx="2" stroke="currentColor" stroke-width="2" fill="none" />
    <path d="M9 4V8" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
    <path d="M15 4V8" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
    <circle cx="9" cy="13" r="1.5" fill="currentColor" />
    <circle cx="15" cy="13" r="1.5" fill="currentColor" />
    <path d="M9 17H15" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
  </svg>
</template>
