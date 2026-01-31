<script setup lang="ts">
// Dashboard icon - Chart/Analytics style
// Replaces emoji: 📊
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
    <rect x="3" y="12" width="4" height="9" rx="1" fill="currentColor" :style="{ opacity: 0.6 }" />
    <rect x="10" y="5" width="4" height="16" rx="1" fill="currentColor" />
    <rect x="17" y="8" width="4" height="13" rx="1" fill="currentColor" :style="{ opacity: 0.8 }" />
  </svg>
</template>
