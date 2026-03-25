#!/usr/bin/env bash
set -euo pipefail

main() {
  filename="$1"
  base_name="${filename%.*}"
  extension="${filename##*.}"
  name="${base_name}.bmp"
  ffmpeg -i "${base_name}.${extension}" -pix_fmt bgr24 "${name}" >/dev/null
  magick "${name}" -define bmp:format=bmp3 -depth 8 -type TrueColor "${name}"
  [[ "${extension}" != "bmp" ]] && rm -f "${1}" || true
  echo "removed ${1}"
}

main "$1"
