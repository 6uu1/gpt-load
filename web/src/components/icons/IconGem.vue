<script setup lang="ts">
// Gem/Diamond icon - Diamond style
// Replaces emoji: 💎
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
    <path
      d="M6 3H18L22 9L12 22L2 9L6 3Z"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
      stroke-linejoin="round"
      fill="none"
    />
    <path d="M12 22V9" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
    <path d="M12 9L2 9" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
    <path d="M12 9L22 9" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
    <path d="M6 3L12 9" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
    <path d="M18 3L12 9" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
  </svg>
</template>
