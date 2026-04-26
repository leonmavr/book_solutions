#!/usr/bin/env bash
set -euo pipefail

pandoc solutions.md \
  --from markdown+fenced_divs \
  --lua-filter=pandoc/filter/problem.lua \
  --pdf-engine=lualatex \
  --include-in-header=pandoc/header.tex \
  -V geometry:margin=2cm \
  -o solutions.pdf && \
echo "=== Built solutions.pdf ==="
