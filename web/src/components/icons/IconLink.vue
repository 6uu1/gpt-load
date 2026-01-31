<script setup lang="ts">
// Link/Chain icon - Link style
// Replaces emoji: 🔗
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
      d="M10 13C10.4295 13.5741 10.9774 14.0492 11.6066 14.3929C12.2357 14.7366 12.9315 14.9411 13.6467 14.9923C14.3618 15.0435 15.0796 14.9393 15.7513 14.6868C16.4231 14.4342 17.0331 14.0391 17.54 13.53L20.54 10.53C21.4508 9.59699 21.9548 8.33397 21.9445 7.02297C21.9342 5.71198 21.4104 4.45745 20.4857 3.53863C19.561 2.61982 18.3044 2.10091 16.9935 2.09435C15.6825 2.08779 14.4205 2.59408 13.486 3.50398L11.766 5.22398"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
      stroke-linejoin="round"
      fill="none"
    />
    <path
      d="M14 11C13.5705 10.4259 13.0226 9.9508 12.3934 9.6071C11.7643 9.2634 11.0685 9.0589 10.3533 9.0077C9.6382 8.9565 8.9204 9.0607 8.2487 9.3132C7.5769 9.5658 6.9669 9.9609 6.46 10.47L3.46 13.47C2.5492 14.403 2.0452 15.666 2.0555 16.977C2.0658 18.288 2.5896 19.5425 3.5143 20.4613C4.439 21.3802 5.6956 21.8991 7.0065 21.9056C8.3175 21.9122 9.5795 21.4059 10.514 20.496L12.234 18.776"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
      stroke-linejoin="round"
      fill="none"
    />
  </svg>
</template>
