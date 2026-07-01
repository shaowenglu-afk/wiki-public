import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

/**
 * 邵的知识库 - Quartz v4 配置
 * Midnight Executive 配色 + 中文支持
 */
const config: QuartzConfig = {
  configuration: {
    pageTitle: "邵的第二大脑",
    pageTitleSuffix: "",
    enableSPA: true,
    enablePopovers: true,
    analytics: {
      provider: "plausible",
    },
    locale: "zh-CN",
    baseUrl: "shaowenglu.com",
    ignorePatterns: [
      "private",
      "templates",
      ".obsidian",
      "Clippings", // 🛡️ 保险起见
    ],
    defaultDateType: "modified",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        // Geist（Vercel）现代克制无衬线 + Geist Mono
        header: "Geist",
        body: "Geist",
        code: "Geist Mono",
      },
      colors: {
        // 浅色：暖米白 + 暖橙 accent（Rauno / iA Writer 风）
        lightMode: {
          light: "#fafaf9",         // 暖米白背景（偏黄）
          lightgray: "#e7e5e4",     // 分隔线（暖 stone-200）
          gray: "#a8a29e",          // 次要文字（暖 stone-400）
          darkgray: "#57534e",      // 主文字次级（stone-600）
          dark: "#1c1917",          // 标题黑（stone-900 偏暖）
          secondary: "#c2410c",     // 暖橙 accent（链接）
          tertiary: "#9a3412",      // 深橙（强调）
          highlight: "rgba(194, 65, 12, 0.08)",
          textHighlight: "#fed7aa88",
        },
        // 深色：偏暖 off-black + 暖橙 accent
        darkMode: {
          light: "#0c0a09",         // 偏暖 off-black 背景
          lightgray: "#292524",     // 分隔线 / card 边框（stone-800）
          gray: "#78716c",          // 次要文字（stone-500）
          darkgray: "#d6d3d1",      // 主文字（stone-300 偏暖）
          dark: "#fafaf9",          // 标题白（stone-50 偏暖）
          secondary: "#fb923c",     // 暖橙 accent（链接，稍亮）
          tertiary: "#f97316",      // 深橙（强调）
          highlight: "rgba(251, 146, 60, 0.10)",
          textHighlight: "#fdba7488",
        },
      },
    },
  },
  plugins: {
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate({
        priority: ["frontmatter", "git", "filesystem"],
      }),
      Plugin.SyntaxHighlighting({
        theme: {
          light: "github-light",
          dark: "github-dark",
        },
        keepBackground: false,
      }),
      Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
      Plugin.GitHubFlavoredMarkdown(),
      Plugin.TableOfContents(),
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
      Plugin.Description(),
      Plugin.Latex({ renderEngine: "katex" }),
    ],
    filters: [Plugin.RemoveDrafts()],
    emitters: [
      Plugin.AliasRedirects(),
      Plugin.ComponentResources(),
      Plugin.ContentPage(),
      Plugin.FolderPage(),
      Plugin.TagPage(),
      Plugin.ContentIndex({
        enableSiteMap: true,
        enableRSS: true,
      }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.Favicon(),
      Plugin.NotFoundPage(),
      // CustomOgImages 渲染慢，先关
      // Plugin.CustomOgImages(),
    ],
  },
}

export default config
