#!/bin/bash
NAMESPACE=$1
FIRST_DIR=$(find js -type f -name '*.js' -exec dirname {} \; | sort -u | head -n 1)
npx esbuild $FIRST_DIR/*.js --bundle --minify --global-name=$NAMESPACE --outfile=js/$NAMESPACE.min.js
