#!/usr/bin/env bash
set -euo pipefail

main() {
  filename="$1"
  base_name="${filename%.*}"
  extension="${filename##*.}"
  name="${base_name}.bmp"
  ffmpeg -i "${base_name}.${extension}" "${name}" || true
  convert "${name}" -type truecolor "${name}"
  echo 'rm -f "${1}" || true'
}

main "$1"
