#!/usr/bin/env bash
set -euo pipefail

main() {
  filename="$1"
  base_name="${filename%.*}"
  tobmp.sh "${filename}"
  resize.sh "${base_name}.bmp"
}

main "$1"
