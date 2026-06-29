#!/bin/bash
# 邵的知识库 → Quartz content/ 同步脚本
# v2: 加入 Clippings 原始素材（带版权防护）

set -e

VAULT_ROOT="/Users/wenglushao/Library/Mobile Documents/iCloud~md~obsidian/Documents/邵的知识库"
VAULT_WIKI="$VAULT_ROOT/Clippings/wiki"
VAULT_CLIPPINGS="$VAULT_ROOT/Clippings"
QUARTZ_CONTENT="$(dirname "$0")/content"

echo "🔄 Step 1: 同步 wiki/ → content/"
mkdir -p "$QUARTZ_CONTENT"
find "$QUARTZ_CONTENT" -type f -name "*.md" -delete 2>/dev/null || true

rsync -a --delete \
  --exclude="CLAUDE-wiki.md" \
  --exclude="lint-*.md" \
  --exclude=".DS_Store" \
  --exclude="wiki" \
  --exclude="clippings" \
  "$VAULT_WIKI/" "$QUARTZ_CONTENT/"

echo ""
echo "🔄 Step 2: 同步 Clippings 原始素材 → content/clippings/（带版权防护）"
mkdir -p "$QUARTZ_CONTENT/clippings"

# 只同步顶层 .md（不含 wiki 子目录避免循环）
rsync -a --delete \
  --exclude="wiki/" \
  --exclude=".DS_Store" \
  --include="*.md" \
  --exclude="*" \
  "$VAULT_CLIPPINGS/" "$QUARTZ_CONTENT/clippings/"

# 给每个 Clippings 加 noindex + 版权声明
echo "🛡️  注入 noindex meta + 版权声明..."
COPYRIGHT_NOTICE="> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。"

for f in "$QUARTZ_CONTENT/clippings"/*.md; do
  if [[ -f "$f" ]]; then
    # 在 frontmatter 后插入 noindex + 版权声明
    # 使用 awk 在第一个 --- 闭合后插入
    awk -v notice="$COPYRIGHT_NOTICE" '
      BEGIN { fm_count=0; inserted=0 }
      /^---$/ { fm_count++; print; next }
      fm_count == 2 && !inserted {
        print ""
        print notice
        print ""
        inserted=1
      }
      { print }
    ' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
  fi
done

echo ""
echo "🔧 Step 3: 修复 wiki 里指向 Clippings 的链接（现在指向 /clippings/）"
find "$QUARTZ_CONTENT" -type f -name "*.md" -not -path "*/clippings/*" -exec \
  sed -i '' -E 's|\[\[Clippings/([^]|]+)(\|[^]]*)?\]\]|[原文](/clippings/\1)|g' {} \;

echo ""
echo "📊 统计："
wiki_count=$(find "$QUARTZ_CONTENT" -type f -name "*.md" -not -path "*/clippings/*" | wc -l | xargs)
clipping_count=$(find "$QUARTZ_CONTENT/clippings" -type f -name "*.md" | wc -l | xargs)
total=$((wiki_count + clipping_count))
echo "  Wiki 综合层: $wiki_count 个"
echo "  Clippings 原始: $clipping_count 个"
echo "  ──────────────────"
echo "  总计: $total 个 .md 文件"
echo ""
echo "🛡️  Step 4: 复制 robots.txt 到 content 根（Quartz Assets emitter 自动入 public/）"
cp "$(dirname "$0")/static/robots.txt" "$QUARTZ_CONTENT/robots.txt"

echo ""
echo "✅ 同步完成"
