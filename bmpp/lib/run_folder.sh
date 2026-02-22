#!/usr/bin/env bash
set -euo pipefail

main() {
  folder=${1}
  index=${2:-0}
  for file in $(ls ${folder}/*bmp);
  do
    lib/process.sh ${folder} ${file} $((index++))
  done
}

main "$@"
