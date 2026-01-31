<script setup lang="ts">
// Tool/Wrench icon - Tool style
// Replaces emoji: 🔧
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
      d="M14.7 6.3C15.6 7.2 15.6 8.6 14.7 9.5L9.5 14.7C8.6 15.6 7.2 15.6 6.3 14.7C5.4 13.8 5.4 12.4 6.3 11.5L11.5 6.3C12.4 5.4 13.8 5.4 14.7 6.3Z"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
      stroke-linejoin="round"
      fill="none"
    />
    <path
      d="M8 21L12 17"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
    />
    <path
      d="M16 3L20 7"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
    />
  </svg>
</template>
