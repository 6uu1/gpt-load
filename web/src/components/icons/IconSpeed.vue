<script setup lang="ts">
// Speed/Time icon - Stopwatch style
// Replaces emoji: ⏱️
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
    <circle cx="12" cy="13" r="8" stroke="currentColor" stroke-width="2" fill="none" />
    <path d="M12 9V13L15 16" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
    <path d="M8 5L10 3" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
    <path d="M16 5L14 3" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
    <path d="M12 3V1" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
  </svg>
</template>
