<script setup lang="ts">
// Lightning/Bolt icon - Energy style
// Replaces emoji: ⚡
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
      d="M13 2L4.09 12.11C3.89 12.35 3.78 12.65 3.78 12.96C3.78 13.61 4.31 14.14 4.96 14.14H11V22L19.91 11.89C20.11 11.65 20.22 11.35 20.22 11.04C20.22 10.39 19.69 9.86 19.04 9.86H13V2Z"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
      stroke-linejoin="round"
      fill="none"
    />
  </svg>
</template>
