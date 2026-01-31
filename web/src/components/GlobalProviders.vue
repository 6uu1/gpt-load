<script setup lang="ts">
import { getLocale } from "@/locales";
import { appState } from "@/utils/app-state";
import { actualTheme } from "@/utils/theme";
import {
  darkTheme,
  dateEnUS,
  dateJaJP,
  dateZhCN,
  enUS,
  jaJP,
  NConfigProvider,
  NDialogProvider,
  NLoadingBarProvider,
  NMessageProvider,
  useLoadingBar,
  useMessage,
  zhCN,
  type GlobalTheme,
  type GlobalThemeOverrides,
} from "naive-ui";
import { computed, defineComponent, watch } from "vue";

// 自定义主题配置 - 根据主题动态调整
const themeOverrides = computed<GlobalThemeOverrides>(() => {
  const baseOverrides: GlobalThemeOverrides = {
    common: {
      primaryColor: "#007AFF",
      primaryColorHover: "#0056CC",
      primaryColorPressed: "#004499",
      primaryColorSuppl: "#5AC8FA",
      borderRadius: "10px",
      borderRadiusSmall: "8px",
      fontFamily: "'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif",
    },
    Card: {
      paddingMedium: "24px",
    },
    Button: {
      fontWeight: "600",
      heightMedium: "40px",
      heightLarge: "48px",
    },
    Input: {
      heightMedium: "40px",
      heightLarge: "48px",
    },
    Menu: {
      itemHeight: "42px",
    },
    LoadingBar: {
      colorLoading: "#007AFF",
      colorError: "#FF3B30",
      height: "3px",
    },
  };

  // 暗黑模式下的特殊覆盖
  if (actualTheme.value === "dark") {
    return {
      ...baseOverrides,
      common: {
        ...baseOverrides.common,
        // 深色模式：更接近 Vercel/Linear 的层次
        bodyColor: "#0b0c0f",
        cardColor: "#0f1115",
        modalColor: "#0f1115",
        popoverColor: "#0f1115",
        tableColor: "#0f1115",
        inputColor: "#111317",
        actionColor: "#111317",
        textColorBase: "#f1f5f9",
        textColor1: "#f1f5f9",
        textColor2: "#cbd5e1",
        textColor3: "#94a3b8",
        borderColor: "rgba(255, 255, 255, 0.08)",
        dividerColor: "rgba(255, 255, 255, 0.06)",
      },
      Card: {
        ...baseOverrides.Card,
        color: "#0f1115",
        textColor: "#f1f5f9",
        borderColor: "rgba(255, 255, 255, 0.08)",
      },
      Input: {
        ...baseOverrides.Input,
        color: "#111317",
        textColor: "#f1f5f9",
        colorFocus: "#111317",
        borderHover: "rgba(0, 122, 255, 0.5)",
        borderFocus: "rgba(0, 122, 255, 0.8)",
        placeholderColor: "#666666",
      },
      Select: {
        peers: {
          InternalSelection: {
            textColor: "#f1f5f9",
            color: "#111317",
            placeholderColor: "#666666",
          },
        },
      },
      DataTable: {
        tdColor: "#0f1115",
        thColor: "#111317",
        thTextColor: "#f1f5f9",
        tdTextColor: "#f1f5f9",
        borderColor: "rgba(255, 255, 255, 0.08)",
      },
      Tag: {
        textColor: "#f1f5f9",
      },
      Pagination: {
        itemTextColor: "#cbd5e1",
        itemTextColorActive: "#f1f5f9",
        itemColor: "#111317",
        itemColorActive: "#161a21",
      },
      DatePicker: {
        itemTextColor: "#f1f5f9",
        itemColorActive: "#111317",
        panelColor: "#0f1115",
      },
      Message: {
        color: "#111317",
        textColor: "#f1f5f9",
        iconColor: "#f1f5f9",
        borderRadius: "8px",
        colorInfo: "#111317",
        colorSuccess: "#111317",
        colorWarning: "#111317",
        colorError: "#111317",
        colorLoading: "#111317",
      },
      LoadingBar: {
        ...baseOverrides.LoadingBar,
      },
      Notification: {
        color: "#111317",
        textColor: "#f1f5f9",
        titleTextColor: "#f1f5f9",
        descriptionTextColor: "#cbd5e1",
        borderRadius: "8px",
      },
    };
  }

  return baseOverrides;
});

// 根据当前主题动态返回主题对象
const theme = computed<GlobalTheme | undefined>(() => {
  return actualTheme.value === "dark" ? darkTheme : undefined;
});

// 根据当前语言返回对应的 locale 配置
const locale = computed(() => {
  const currentLocale = getLocale();
  switch (currentLocale) {
    case "zh-CN":
      return zhCN;
    case "en-US":
      return enUS;
    case "ja-JP":
      return jaJP;
    default:
      return zhCN;
  }
});

// 根据当前语言返回对应的日期 locale 配置
const dateLocale = computed(() => {
  const currentLocale = getLocale();
  switch (currentLocale) {
    case "zh-CN":
      return dateZhCN;
    case "en-US":
      return dateEnUS;
    case "ja-JP":
      return dateJaJP;
    default:
      return dateZhCN;
  }
});

function useGlobalMessage() {
  window.$message = useMessage();
}

const LoadingBar = defineComponent({
  setup() {
    const loadingBar = useLoadingBar();
    watch(
      () => appState.loading,
      loading => {
        if (loading) {
          loadingBar.start();
        } else {
          loadingBar.finish();
        }
      }
    );
    return () => null;
  },
});

const Message = defineComponent({
  setup() {
    useGlobalMessage();
    return () => null;
  },
});
</script>

<template>
  <n-config-provider
    :theme="theme"
    :theme-overrides="themeOverrides"
    :locale="locale"
    :date-locale="dateLocale"
  >
    <n-loading-bar-provider>
      <n-message-provider placement="top-right">
        <n-dialog-provider>
          <slot />
          <loading-bar />
          <message />
        </n-dialog-provider>
      </n-message-provider>
    </n-loading-bar-provider>
  </n-config-provider>
</template>
