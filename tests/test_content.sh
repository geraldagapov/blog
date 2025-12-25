#!/bin/bash

# Test for index.md
if [ ! -f "index.md" ]; then
  echo "FAIL: index.md not found"
  exit 1
fi
if ! grep -q "layout: default" "index.md"; then
  echo "FAIL: index.md missing default layout"
  exit 1
fi
if ! grep -q "{% for post in site.posts %}" "index.md"; then
  echo "FAIL: index.md missing post loop"
  exit 1
fi

# Test for about.md
if [ ! -f "about.md" ]; then
  echo "FAIL: about.md not found"
  exit 1
fi
if ! grep -q "layout: default" "about.md"; then
  echo "FAIL: about.md missing default layout"
  exit 1
fi
if ! grep -q "About" "about.md"; then
  echo "FAIL: about.md missing 'About' content"
  exit 1
fi

echo "PASS: Content pages verified"
exit 0