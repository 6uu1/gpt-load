import { watch } from "vue";
import { useState } from "@/utils/state";

const STORAGE_KEY = "gpt-load.sidebar.collapsed";

export function useSidebar() {
  const collapsed = useState<boolean>("sidebar.collapsed", () => {
    try {
      return localStorage.getItem(STORAGE_KEY) === "1";
    } catch {
      return false;
    }
  });

  const mobileOpen = useState<boolean>("sidebar.mobileOpen", false);

  watch(
    collapsed,
    value => {
      try {
        localStorage.setItem(STORAGE_KEY, value ? "1" : "0");
      } catch {
        // ignore
      }
    },
    { flush: "post" }
  );

  const toggleCollapsed = () => {
    collapsed.value = !collapsed.value;
  };

  const openMobile = () => {
    mobileOpen.value = true;
  };

  const closeMobile = () => {
    mobileOpen.value = false;
  };

  const toggleMobile = () => {
    mobileOpen.value = !mobileOpen.value;
  };

  return {
    collapsed,
    mobileOpen,
    toggleCollapsed,
    openMobile,
    closeMobile,
    toggleMobile,
  };
}

