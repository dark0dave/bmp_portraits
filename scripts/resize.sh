#!/usr/bin/env bash
set -euo pipefail

main() {
  base_name="${1%.*}"
  ffmpeg -i "${1}" -vf "scale='min(iw,625)':'min(ih,1024)':force_original_aspect_ratio=decrease" "${base_name}_resized.bmp"
  mv "${base_name}_resized.bmp" "${1}"
}

main $1
