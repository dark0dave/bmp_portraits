#!/usr/bin/env bash
set -euo pipefail

weidu --nogame --untraify-tra languages/english/weidu.tra --untraify-d setup-bmpp.tp2
sed -i 's/ \/\*.*\*\///g' setup-bmpp.tp2
weidu --nogame --traify-comment --traify-old-tra languages/english/weidu.tra --traify setup-bmpp.tp2
mv setup-bmpp.tra languages/english/weidu.tra
