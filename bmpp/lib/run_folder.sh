#!/usr/bin/env bash
set -euo pipefail

index=${2:-100}
for file in $(ls $1/*bmp);
do
  lib/process.sh $file $((index++))
done
