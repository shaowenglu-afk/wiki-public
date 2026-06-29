#!/bin/bash
# 邵的知识库 一键发布脚本
# 用法：./publish.sh "可选的 commit 信息"
#
# 流程：
#   1. 同步 Obsidian wiki/ → content/
#   2. 本地 build 一次（捕获错误）
#   3. git add + commit + push
#   4. Cloudflare Pages 自动触发部署（~30 秒后上线）

set -e

cd "$(dirname "$0")"

MSG="${1:-update wiki $(date +'%Y-%m-%d %H:%M')}"

echo "═══════════════════════════════════════════"
echo "  📚 邵的知识库 · 一键发布"
echo "═══════════════════════════════════════════"
echo ""

echo "▶ Step 1/4: 同步 Obsidian wiki → content/"
./sync.sh
echo ""

echo "▶ Step 2/4: 本地 build 验证（捕获错误）"
npx quartz build 2>&1 | tail -5
echo ""

echo "▶ Step 3/4: git commit & push"
if [[ -z "$(git status --porcelain)" ]]; then
    echo "  ℹ️  无变化，跳过 push"
else
    git add .
    git commit -m "$MSG"
    git push 2>&1 | tail -5
fi
echo ""

echo "▶ Step 4/4: Cloudflare Pages 自动部署中..."
echo "  🌐 部署进度：https://dash.cloudflare.com → Pages → wiki-public"
echo "  🚀 ~30 秒后访问：https://shaowenglu.com"
echo ""
echo "═══════════════════════════════════════════"
echo "  ✅ 完成"
echo "═══════════════════════════════════════════"
