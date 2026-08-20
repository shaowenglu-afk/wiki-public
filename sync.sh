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
  --exclude="商用车租赁" \
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
echo "🚛 Step 2.6: 同步商用车租赁专题库 → content/商用车租赁/"
VAULT_CV="$VAULT_ROOT/商用车租赁"
if [[ -d "$VAULT_CV" ]]; then
  rsync -a --delete \
    --exclude="CLAUDE-商用车租赁-wiki.md" \
    --exclude=".DS_Store" \
    "$VAULT_CV/" "$QUARTZ_CONTENT/商用车租赁/"

  # 链接限定：Quartz 用 markdownLinkResolution:"shortest"，且主库根目录已有
  # index.md / log.md、sources/ 下也有 03- 开头的文件 —— 不限定前缀会链到主库的错误页面。
  python3 << 'CVEOF'
import os, re

ROOT = "/Users/wenglushao/wiki-public/content/商用车租赁"
PREFIX = "商用车租赁/"
SUBDIRS = ("sources/", "entities/", "concepts/")

def fix_target(t):
    t = t.strip()
    if t.startswith("Clippings/wiki/"):      # 跨库链接 → 主库在 content 根
        return t[len("Clippings/wiki/"):]
    if t.startswith(SUBDIRS):                 # 本库内部链接 → 限定前缀
        return PREFIX + t
    if t == "log" or t.startswith("log#"):    # 会撞主库 log.md
        return PREFIX + t
    if t == "index" or t.startswith("index#"):
        return PREFIX + t
    return t

link_re = re.compile(r'\[\[([^\]\|#]+(?:#[^\]\|]+)?)(\|[^\]]+)?\]\]')
n_files = n_links = n_unlinked = 0

for dirpath, _, files in os.walk(ROOT):
    for fn in files:
        if not fn.endswith(".md"): continue
        fp = os.path.join(dirpath, fn)
        src = open(fp, encoding="utf-8").read()

        # schema 文件不发布，去掉指向它的链接
        out = re.sub(r'\[\[CLAUDE-商用车租赁-wiki\|([^\]]+)\]\]', r'\1（仅本地）', src)
        if out != src: n_unlinked += 1

        def repl(m):
            global n_links
            old, alias = m.group(1), m.group(2) or ""
            new = fix_target(old)
            if new != old: n_links += 1
            return f"[[{new}{alias}]]"
        out2 = link_re.sub(repl, out)

        if out2 != src:
            open(fp, "w", encoding="utf-8").write(out2)
            n_files += 1

print(f"   ✅ 链接限定：改写 {n_links} 处 wikilink，跨 {n_files} 个文件（去链 schema {n_unlinked} 处）")
CVEOF

  # 剪藏层注入版权声明（与主库 Clippings 同一处理）
  CV_CLIPS="$QUARTZ_CONTENT/商用车租赁/clippings"
  if [[ -d "$CV_CLIPS" ]]; then
    CV_NOTICE="> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档，不对外公开传播。如有侵权请联系删除。原文出处见页首 source 字段。"
    for f in "$CV_CLIPS"/*.md; do
      [[ -f "$f" ]] || continue
      grep -q "版权声明" "$f" && continue
      awk -v notice="$CV_NOTICE" '
        BEGIN { fm=0; ins=0 }
        /^---$/ { fm++; print; next }
        fm == 2 && !ins { print ""; print notice; print ""; ins=1 }
        { print }
      ' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
    done
    cv_clip_count=$(find "$CV_CLIPS" -type f -name "*.md" | wc -l | xargs)
    echo "   🛡️  剪藏层注入版权声明: $cv_clip_count 篇"
  fi

  cv_count=$(find "$QUARTZ_CONTENT/商用车租赁" -type f -name "*.md" | wc -l | xargs)
  echo "   📦 商用车租赁专题库: $cv_count 个 .md"
else
  echo "   ⏭️  未找到 $VAULT_CV，跳过"
fi

echo ""
echo "🔧 Step 3: 修复 wiki 里指向 Clippings 的链接大小写（Clippings → clippings）"
# Cloudflare (Linux) 大小写敏感，Quartz 会从 wikilink 保留大小写生成 URL。
# 用 ~ 作为 sed 分隔符（避免与 wikilink 的 | 冲突）
# 保留 wikilink 结构，只把 Clippings/ 前缀转为 clippings/
find "$QUARTZ_CONTENT" -type f -name "*.md" -not -path "*/clippings/*" -exec \
  sed -i '' -E 's~\[\[Clippings/~[[clippings/~g' {} \;

echo ""
echo "🖼️  Step 3.5: 微信图片代理重写（绕过 mmbiz 防盗链）"
# 把所有 mmbiz.qpic.cn 图片 URL 替换为 wsrv.nl 代理 URL
# wsrv.nl 不查 Referer，能拿到原图
python3 << 'PYEOF'
import os, re

QUARTZ_CONTENT = os.path.dirname(os.path.abspath(__file__)) + "/content/clippings"

count = 0
files_changed = 0
for fname in os.listdir(QUARTZ_CONTENT):
    if not fname.endswith(".md"): continue
    fpath = os.path.join(QUARTZ_CONTENT, fname)
    with open(fpath, encoding="utf-8") as f:
        content = f.read()

    # 匹配 ![](https://mmbiz.qpic.cn/...) markdown 图片
    # 替换为 wsrv.nl 代理 URL
    new_content = re.sub(
        r'!\[([^\]]*)\]\((https?://mmbiz\.qpic\.cn/[^)]+)\)',
        lambda m: f'![{m.group(1)}](https://wsrv.nl/?url={m.group(2)})',
        content
    )

    if new_content != content:
        with open(fpath, "w", encoding="utf-8") as f:
            f.write(new_content)
        files_changed += 1
        count += len(re.findall(r'!\[[^\]]*\]\(https://wsrv\.nl/', new_content))

print(f"   ✅ 重写 {count} 张图片，跨 {files_changed} 个文件")
PYEOF

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
cp "$(dirname "$0")/static/_headers" "$QUARTZ_CONTENT/_headers"
echo "   🚫 已注入 _headers（全站 X-Robots-Tag: noindex）"

echo ""
echo "✅ 同步完成"
