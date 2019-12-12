#!/usr/bin/env bash

set -e

url=$1
local_filepath=$(echo "$url" | sed 's|https://raw.githubusercontent.com/mozilla/gecko-dev/||g')
# shouldn't make a parent dir
echo -n "$local_filepath" | grep -v '\.\.'

local_dir=$(dirname "$local_filepath")
echo "$local_dir"
mkdir -p "$local_dir"
curl "$url" \
     --silent \
     --show-error \
     --compressed > "$local_filepath"
