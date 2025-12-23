#!/usr/bin/env bash
set -euo pipefail

folder=${1}
index=${2:-300}
for file in $(ls ${folder}/*bmp);
do
  lib/process.sh ${folder} ${file} $((index++))
done
