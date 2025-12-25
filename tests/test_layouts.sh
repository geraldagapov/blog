#!/bin/bash

# Test for header.html
if [ ! -f "_includes/header.html" ]; then
  echo "FAIL: _includes/header.html not found"
  exit 1
fi
if ! grep -q "<nav>" "_includes/header.html"; then
  echo "FAIL: _includes/header.html missing <nav>"
  exit 1
fi

# Test for footer.html
if [ ! -f "_includes/footer.html" ]; then
  echo "FAIL: _includes/footer.html not found"
  exit 1
fi
if ! grep -q "</footer>" "_includes/footer.html"; then
  echo "FAIL: _includes/footer.html missing <footer>"
  exit 1
fi

# Test for default.html
if [ ! -f "_layouts/default.html" ]; then
  echo "FAIL: _layouts/default.html not found"
  exit 1
fi
if ! grep -q "{% include header.html %}" "_layouts/default.html"; then
  echo "FAIL: _layouts/default.html missing header include"
  exit 1
fi
if ! grep -q "{% include footer.html %}" "_layouts/default.html"; then
  echo "FAIL: _layouts/default.html missing footer include"
  exit 1
fi
if ! grep -q "{{ content }}" "_layouts/default.html"; then
  echo "FAIL: _layouts/default.html missing content injection"
  exit 1
fi

# Minimalist Refactor Checks for default.html
if grep -q "{% seo %}" "_layouts/default.html"; then
  echo "FAIL: _layouts/default.html should not use jekyll-seo-tag"
  exit 1
fi

if ! grep -q "<title>.*{{ site.title }}.*</title>" "_layouts/default.html"; then
  echo "FAIL: _layouts/default.html missing manual title tag"
  exit 1
fi

if ! grep -q "<meta name=\"description\"" "_layouts/default.html"; then
  echo "FAIL: _layouts/default.html missing manual description tag"
  exit 1
fi

if ! grep -q "assets/css/style.css" "_layouts/default.html"; then
  echo "FAIL: _layouts/default.html missing link to style.css"
  exit 1
fi

# Test for post.html
if [ ! -f "_layouts/post.html" ]; then
  echo "FAIL: _layouts/post.html not found"
  exit 1
fi
if ! grep -q "layout: default" "_layouts/post.html"; then
  echo "FAIL: _layouts/post.html missing default layout"
  exit 1
fi
if ! grep -q "{{ page.title }}" "_layouts/post.html"; then
  echo "FAIL: _layouts/post.html missing page title"
  exit 1
fi
if ! grep -q "{{ page.date" "_layouts/post.html"; then
  echo "FAIL: _layouts/post.html missing page date"
  exit 1
fi
if ! grep -q "{{ content }}" "_layouts/post.html"; then
  echo "FAIL: _layouts/post.html missing content"
  exit 1
fi
if ! grep -q "<article>" "_layouts/post.html"; then
  echo "FAIL: _layouts/post.html should use <article>"
  exit 1
fi

# Test for style.css
if [ ! -f "assets/css/style.css" ]; then
  echo "FAIL: assets/css/style.css not found"
  exit 1
fi

echo "PASS: Layouts and Includes verified"
exit 0
