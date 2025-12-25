#!/bin/bash

# Test for _config.yml
if [ ! -f "_config.yml" ]; then
  echo "FAIL: _config.yml not found"
  exit 1
fi

# Test for Gemfile
if [ ! -f "Gemfile" ]; then
  echo "FAIL: Gemfile not found"
  exit 1
fi

# Test for directories
for dir in "_layouts" "_includes" "_posts" "assets/css"; do
  if [ ! -d "$dir" ]; then
    echo "FAIL: Directory $dir not found"
    exit 1
  fi
done

# Test for absence of theme
if grep -q "theme:" _config.yml; then
  echo "FAIL: Theme should be removed from _config.yml"
  exit 1
fi

# Test for absence of plugins
if grep -q "plugins:" _config.yml; then
  echo "FAIL: Plugins section should be removed from _config.yml"
  exit 1
fi

echo "PASS: Jekyll structure verified"
exit 0