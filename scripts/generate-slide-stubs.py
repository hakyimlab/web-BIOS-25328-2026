#!/usr/bin/env python3
"""Generate stub .qmd pages for each lecture slide deck so they appear in the site listing."""

import glob
import os
import re
import sys


def extract_field(frontmatter: str, key: str) -> str:
    """Extract a simple scalar value from YAML frontmatter."""
    pattern = rf'^{key}:\s*["\']?(.+?)["\']?\s*$'
    m = re.search(pattern, frontmatter, re.MULTILINE)
    return m.group(1) if m else ""


def process_slide(slide_path: str) -> None:
    dir_name = os.path.dirname(slide_path)
    base = os.path.splitext(os.path.basename(slide_path))[0]
    stub_path = os.path.join(dir_name, f"page-{base}.qmd")

    text = open(slide_path).read()
    m = re.match(r"^---\n(.*?)\n---", text, re.DOTALL)
    if not m:
        print(f"  Warning: no frontmatter in {slide_path}, skipping", file=sys.stderr)
        return

    fm = m.group(1)
    title = extract_field(fm, "title")
    subtitle = extract_field(fm, "subtitle")
    author = extract_field(fm, "author")
    date = extract_field(fm, "date")
    desc = subtitle if subtitle else "Lecture slides"

    # Extract lecture number from folder name (e.g. L5-Population-Structure → "5")
    num_match = re.match(r"L(\d+)-", os.path.basename(dir_name))
    num_prefix = f"L{num_match.group(1)} · " if num_match else ""

    content = f"""---
title: "{num_prefix}{title}"
date: '{date}'
author: "{author}"
description: "{desc}"
categories: [slides]
---

[Open slide deck]({base}.html){{.btn .btn-primary .btn-lg}}
"""
    with open(stub_path, "w") as f:
        f.write(content)
    print(f"  -> {stub_path}")


def main():
    # Match L<N>-<name>/L<N>-<name>.qmd pattern
    slides = sorted(glob.glob("L*/*.qmd", recursive=False))
    # Exclude already-generated stubs
    slides = [s for s in slides if not os.path.basename(s).startswith("page-")]
    if not slides:
        print("  No slide decks found.")
        return
    for s in slides:
        process_slide(s)


if __name__ == "__main__":
    main()
