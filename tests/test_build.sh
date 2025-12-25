#!/bin/bash

# Simulated Build Verification
# Since we cannot run 'jekyll build' directly, we verify all components are in place.

echo "Running structural tests..."
./tests/test_structure.sh
if [ $? -ne 0 ]; then
  echo "FAIL: Structure test failed"
  exit 1
fi

echo "Running layout tests..."
./tests/test_layouts.sh
if [ $? -ne 0 ]; then
  echo "FAIL: Layout test failed"
  exit 1
fi

echo "Running content tests..."
./tests/test_content.sh
if [ $? -ne 0 ]; then
  echo "FAIL: Content test failed"
  exit 1
fi

echo "PASS: Site ready for build"
exit 0
