#!/usr/bin/env bash
set -euo pipefail

main() {
  filename="$1"
  base_name="${filename%.*}"
  extension="${filename##*.}"
  name="${base_name}.bmp"
  ffmpeg -i "${base_name}.${extension}" -vf "scale='min(iw,625)':'min(ih,1024)':force_original_aspect_ratio=decrease" -pix_fmt bgr24 "${name}" >/dev/null
  magick "${name}" -define bmp:format=bmp3 -depth 8 -type TrueColor "${name}"
  magick mogrify -strip "${name}"
  [[ "${extension}" != "bmp" ]] && rm -f "${1}" || true
  echo "removed ${1}"
}

main "$1"
