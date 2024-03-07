#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")" || exit

gh release list | head -1 | awk '{print $1;}'
