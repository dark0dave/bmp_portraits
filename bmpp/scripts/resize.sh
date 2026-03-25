#!/usr/bin/env bash
set -euo pipefail

resize() {
  base_name="${1%.*}"
  ffmpeg -y -i "${1}" -vf "scale='min(iw,625)':'min(ih,1024)':force_original_aspect_ratio=decrease" "${base_name}_resized.bmp"
  mv "${base_name}_resized.bmp" "${1}"
}

main() {
  for file in $(find . -type f -iname '*.bmp'); do
    larger=$(identify -format "%w %h %i\n" "${file}" | awk '$1>652 || $2>1024 {print $3}')
    if [ -n "${larger}" ]; then
      resize "${larger}"
    fi
  done
}

main
