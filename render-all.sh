#!/bin/bash
# Render the full site + slide decks, copying slide outputs to docs/

set -e

# 0. Generate stub pages for each slide deck so they appear in the site listing
echo "=== Generating slide stub pages ==="
python3 scripts/generate-slide-stubs.py

# 1. Render the website (index + stub pages — excludes slide QMDs via _quarto.yml)
echo "=== Rendering site ==="
quarto render

# 2. Render each slide deck and copy output to docs/
for slide in L*/*.qmd; do
  # Skip stub pages (generated above)
  [[ "$(basename "$slide")" == page-* ]] && continue

  echo "=== Rendering slide: $slide ==="

  dir=$(dirname "$slide")
  base=$(basename "$slide" .qmd)

  # Clean old artifacts before rendering
  rm -f "$dir/$base.html"
  rm -rf "$dir/${base}_files"

  quarto render "$slide" --to revealjs

  # Derive destination path under docs/
  dest="docs/$dir"
  mkdir -p "$dest"

  # Copy HTML and supporting files
  cp "$dir/$base.html" "$dest/"
  if [ -d "$dir/${base}_files" ]; then
    cp -r "$dir/${base}_files" "$dest/"
  fi

  # Copy images referenced by the slides
  for ext in jpeg jpg png gif svg; do
    for img in "$dir"/*."$ext"; do
      [ -f "$img" ] && cp "$img" "$dest/"
    done
  done

  # Clean up generated artifacts from source directory
  rm -f "$dir/$base.html"
  rm -rf "$dir/${base}_files"

  echo "  -> copied to $dest/"
done

echo "=== Done ==="
