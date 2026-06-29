#!/bin/bash
# 邵的知识库 → Quartz content/ 同步脚本
set -e
VAULT_WIKI="/Users/wenglushao/Library/Mobile Documents/iCloud~md~obsidian/Documents/邵的知识库/Clippings/wiki"
QUARTZ_CONTENT="$(dirname "$0")/content"
echo "🔄 同步 wiki/ → content/"
mkdir -p "$QUARTZ_CONTENT"
find "$QUARTZ_CONTENT" -type f -name "*.md" -delete 2>/dev/null || true
rsync -a --delete \
  --exclude="CLAUDE-wiki.md" \
  --exclude="lint-*.md" \
  --exclude=".DS_Store" \
  "$VAULT_WIKI/" "$QUARTZ_CONTENT/"
echo "🔧 修复 Clippings 链接（指向不会发布的原始素材）..."
find "$QUARTZ_CONTENT" -type f -name "*.md" -exec \
  sed -i '' -E 's/\[\[Clippings\/([^]|]+)(\|[^]]*)?\]\]/`\1`（原始素材，仅本地可见）/g' {} \;
total=$(find "$QUARTZ_CONTENT" -type f -name "*.md" | wc -l | xargs)
echo "✅ 同步完成：$total 个 .md 文件"
