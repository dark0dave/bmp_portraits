#!/usr/bin/env bash
set -euo pipefail

main() {
  filename="$1"
  base_name="${filename%.*}"
  extension="${filename##*.}"
  name="${base_name}.bmp"
  ffmpeg -i "${base_name}.${extension}" "${name}" >/dev/null || exit 1
  convert "${name}" -type truecolor "${name}" || exit 1
  [[ "${extension}" != "bmp" ]] && rm -f "${1}" || true
  echo "removed ${1}"
}

main "$1"
