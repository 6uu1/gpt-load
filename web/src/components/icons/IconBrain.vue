<script setup lang="ts">
// Brain/AI icon - Neural style
// Replaces emoji: 🧠
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
      d="M12 5C12 5 10 3 7 4C4 5 3 8 4 11C5 14 8 16 12 16"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
      fill="none"
    />
    <path
      d="M12 5C12 5 14 3 17 4C20 5 21 8 20 11C19 14 16 16 12 16"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
      fill="none"
    />
    <path d="M12 16V20" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
    <path d="M8 20H16" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
    <circle cx="9" cy="9" r="1" fill="currentColor" />
    <circle cx="15" cy="9" r="1" fill="currentColor" />
  </svg>
</template>
