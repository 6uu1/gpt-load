<script setup lang="ts">
// Warning/Alert icon - Triangle style
// Replaces emoji: ⚠️
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
      d="M12 2L2 22H22L12 2Z"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
      stroke-linejoin="round"
      fill="none"
    />
    <path d="M12 9V14" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
    <circle cx="12" cy="18" r="0.5" fill="currentColor" />
  </svg>
</template>
