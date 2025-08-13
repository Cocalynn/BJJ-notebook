#!/usr/bin/env bash
set -euo pipefail

# Usage: ./gen_positions.sh [PATH_TO_bjj-notebook] [--force]
ROOT="${1:-}"
FORCE=0
[[ "${2:-}" == "--force" || "${1:-}" == "--force" ]] && FORCE=1

if [[ -z "${ROOT}" || "${ROOT}" == "--force" ]]; then
  # auto-detect common layouts
  if [[ -d "static/media/positions" && -d "content/positions" ]]; then
    ROOT="."
  elif [[ -d "bjj-notebook/static/media/positions" && -d "bjj-notebook/content/positions" ]]; then
    ROOT="bjj-notebook"
  else
    echo "❌ Could not find paths. Run: $0 <path-to-bjj-notebook> [--force]" >&2
    exit 1
  fi
fi

MEDIA_DIR="$ROOT/static/media/positions"
CONTENT_DIR="$ROOT/content/positions"

if [[ ! -d "$MEDIA_DIR" ]]; then
  echo "❌ MEDIA_DIR not found: $MEDIA_DIR" >&2
  exit 1
fi
mkdir -p "$CONTENT_DIR"

# Helpers
today() { date +%F; }
titlecase_from_slug() {
  printf '%s' "$1" | tr '-' ' ' | awk '{
    for (i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) tolower(substr($i,2)) }
    print
  }'
}

shopt -s nullglob nocaseglob

# Gather MP4s (case-insensitive)
mp4s=( "$MEDIA_DIR"/*.mp4 "$MEDIA_DIR"/*.MP4 )
if (( ${#mp4s[@]} == 0 )); then
  echo "ℹ️  No .mp4 files found under $MEDIA_DIR"
  echo "    (cwd: $(pwd))"
  exit 0
fi

created=0
skipped=0
missing_gif=0

for mp4 in "${mp4s[@]}"; do
  slug="$(basename "${mp4%.*}")"

  # find matching GIF
  gif=""
  for cand in "$MEDIA_DIR/$slug".gif "$MEDIA_DIR/$slug".GIF; do
    [[ -f "$cand" ]] && gif="$cand" && break
  done
  if [[ -z "$gif" ]]; then
    echo "skip (no GIF partner): $slug"
    ((missing_gif++))
    continue
  fi

  mp4_ext="${mp4##*.}"
  gif_ext="${gif##*.}"

  dest_dir="$CONTENT_DIR/$slug"
  index_md="$dest_dir/index.md"

  if [[ -f "$index_md" && $FORCE -eq 0 ]]; then
    echo "skip (exists): $index_md"
    ((skipped++))
    continue
  fi

  mkdir -p "$dest_dir"
  title="$(titlecase_from_slug "$slug")"

  cat > "$index_md" <<EOF
---
title: "$title"
date: $(today)
video: "/media/positions/$slug.$mp4_ext"
gif: "/media/positions/$slug.$gif_ext"
tags: []
layout: position.njk
---
### **Key Details**
- 

<br>

### **Common Mistakes**
- 

<br>

---

<br>

### **📝 Notes**

<br>
EOF

  echo "made: $index_md"
  ((created++))
done

echo "Done. created=$created skipped=$skipped missing_gif=$missing_gif (root=$ROOT)"
