#!/usr/bin/env bash
set -euo pipefail

main() {
  for file in $(find . -type f \( -iname "*.png" -o -iname "*.jp*g" \)); do
    echo "Converting ${file}";
    convert.sh "${file}"
  done
}

main
