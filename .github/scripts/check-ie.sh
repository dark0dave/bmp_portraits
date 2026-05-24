#!/usr/bin/env bash
set -euo pipefail

function checkIE() {
  declare -i badfiles=0

  for file in $(find ./bmpp/ -iname "*.${1}" ); do
    [[ $( basename "${file}" | cut -f1 -d '.' | wc | awk '{ print $3}' ) -gt 9 ]] && echo "Error found: ${file} which is larger than 8 characters" && badfiles+=1;
  done

  if [[ "${badfiles}" -gt 0 ]]; then
    echo "Failed found bad files";
    exit 1;
  fi
}

function checkPathsInTp2() {
  for file in $(find ./bmpp -type f -iname "*.tp2" | sort | uniq ); do
    for fileToMove in $(grep -E "COPY\W~%MOD_FOLDER%.*${1}~\W" "${file}" | sed -E "s/^.*~%MOD_FOLDER%(.*)~\W~.*$/bmpp\1/g"); do
      if [[ ! -f "${fileToMove}" ]]; then
        echo "${fileToMove} is not a file";
        exit 1;
      fi
    done
  done
}

main() {
  checkIE "bmp"
  checkPathsInTp2 "bmp"
}

main
