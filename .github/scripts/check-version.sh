#!/usr/bin/env bash
set -euo pipefail

function version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }

function main() {
  local tag_version=$(git describe --tags --abbrev=0);
  echo "Git tag version: ${tag_version}"
  local current_version=$(grep -i version */*.tp2 | awk -F 'v' '{print $NF}' | sed -E "s/[^0-9.]+//g")
  echo "mod version: ${current_version}"
  if [ "${tag_version}" == "${current_version}" ]; then
    echo "Versions are the same"
    exit 0;
  fi

  if version_gt "${current_version}" "${tag_version}"; then
    echo "Current version greater than tag version"
    exit 0;
  fi

  echo "Failed, tag version: ${tag_version} is greater than mod version: ${current_version}"
  exit 1;
}

main
