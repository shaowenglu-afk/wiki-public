import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

/**
 * 邵的知识库 - Quartz v4 配置
 * Midnight Executive 配色 + 中文支持
 */
const config: QuartzConfig = {
  configuration: {
    pageTitle: "邵的知识库",
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
        header: "Noto Serif SC", // 中文衬线
        body: "Noto Sans SC", // 中文无衬线
        code: "JetBrains Mono",
      },
      colors: {
        lightMode: {
          light: "#faf8f8",
          lightgray: "#e5e5e5",
          gray: "#b8b8b8",
          darkgray: "#4e4e4e",
          dark: "#1E2761", // Midnight Executive Navy
          secondary: "#1E2761",
          tertiary: "#D4AF37", // Gold
          highlight: "rgba(212, 175, 55, 0.15)",
          textHighlight: "#D4AF3766",
        },
        darkMode: {
          light: "#0F1437", // Dark navy
          lightgray: "#1E2761",
          gray: "#646464",
          darkgray: "#CADCFC", // Ice blue
          dark: "#FFFFFF",
          secondary: "#CADCFC",
          tertiary: "#D4AF37", // Gold
          highlight: "rgba(212, 175, 55, 0.15)",
          textHighlight: "#D4AF3766",
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
