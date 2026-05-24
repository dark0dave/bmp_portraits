#!/usr/bin/env bash
set -euo pipefail

weidu --nogame --untraify-tra bmpp/languages/english/weidu.tra --untraify-d bmpp/setup-bmpp.tp2
sed -i 's/ \/\*.*\*\///g' bmpp/setup-bmpp.tp2
weidu --nogame --traify-comment --traify-old-tra bmpp/languages/english/weidu.tra --traify bmpp/setup-bmpp.tp2
mv bmpp/setup-bmpp.tra bmpp/languages/english/weidu.tra
