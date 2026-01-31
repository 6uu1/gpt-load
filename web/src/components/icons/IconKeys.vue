<script setup lang="ts">
// Keys icon - Key/Security style
// Replaces emoji: 🔑
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
    <circle cx="9" cy="9" r="5" stroke="currentColor" stroke-width="2" fill="none" />
    <path
      d="M13 13L21 21"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
    />
    <path
      d="M16 18L18 16"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
    />
    <circle cx="9" cy="9" r="2" fill="currentColor" />
  </svg>
</template>
