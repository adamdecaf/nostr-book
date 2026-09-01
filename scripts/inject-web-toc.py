#!/usr/bin/env python3
"""Copy the book TOC from index.html into every chunked page."""

from pathlib import Path
import re
import sys

book = Path(__file__).resolve().parent.parent / "docs" / "book"
index = book / "index.html"
text = index.read_text()
match = re.search(r'<nav id="TOC".*?</nav>', text, re.S)
if not match:
    sys.exit("error: no TOC found in docs/book/index.html")
toc = match.group(0)

needle = '<div class="layout">\n    <div class="main">'
insert = '<div class="layout">\n    ' + toc + '\n    <div class="main">'

for path in sorted(book.glob("*.html")):
    page = path.read_text()
    if 'id="TOC"' in page:
        continue
    if needle not in page:
        sys.exit(f"error: layout marker missing in {path.name}")
    path.write_text(page.replace(needle, insert, 1))
