#!/bin/bash
# Export Quarto revealjs slides to PDF using decktape.
#
# USAGE
#   ./export-pdf.sh <lecture-folder>      # e.g.  ./export-pdf.sh L7-prs-2026
#   ./export-pdf.sh all                   # export every rendered lecture
#
# OUTPUT (placed in docs/<lecture-folder>/)
#   <lecture>.pdf              — slides only, no notes
#   <lecture>-with-notes.pdf   — each slide followed by its speaker notes
#
# PREREQUISITES
#   npm install -g decktape
#
# The slides must already be rendered to docs/ before running this script.
# If not rendered yet, run:  ./render-all.sh

set -e

DOCS_DIR="docs"

export_lecture() {
  local folder="$1"
  local html_path
  html_path=$(find "$DOCS_DIR/$folder" -maxdepth 1 -name "*.html" | head -1)

  if [ -z "$html_path" ]; then
    echo "ERROR: No HTML found in $DOCS_DIR/$folder — run ./render-all.sh first"
    return 1
  fi

  local base
  base=$(basename "$html_path" .html)
  local out_dir
  out_dir=$(dirname "$html_path")

  echo "=== Exporting $folder ==="

  echo "  -> slides only: $out_dir/$base.pdf"
  decktape reveal "$html_path" "$out_dir/$base.pdf"

  echo "  -> with notes:  $out_dir/$base-with-notes.pdf"
  decktape reveal "${html_path}?showNotes=separate-page" "$out_dir/$base-with-notes.pdf"

  echo "  done."
}

if [ $# -eq 0 ]; then
  echo "Usage: $0 <lecture-folder | all>"
  echo "  e.g. $0 L7-prs-2026"
  echo "       $0 all"
  exit 1
fi

if [ "$1" = "all" ]; then
  for dir in "$DOCS_DIR"/L*/; do
    folder=$(basename "$dir")
    export_lecture "$folder"
  done
else
  export_lecture "$1"
fi

echo "=== All done ==="
