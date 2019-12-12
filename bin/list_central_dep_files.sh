#!/usr/bin/env bash

set -ev

for glob in $@; do
    echo "$glob"
    curl "https://searchfox.org/mozilla-central/search?q=&case=true&regexp=false&path=${glob}" \
	 --silent \
	 --show-error \
	 -H 'Accept: application/json' \
	 -H 'Pragma: no-cache' \
	 -H 'Cache-Control: no-cache' \
	 --compressed \
	| jq '.normal.Files[].path' | tr -d '"' | sed 's|^|https://raw.githubusercontent.com/mozilla/gecko-dev/master/|g' >> "manifest_urls.txt"
done
