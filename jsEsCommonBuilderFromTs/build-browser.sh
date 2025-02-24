#!/bin/bash
NAMESPACE=$1
npx esbuild js/*.js --bundle --minify --global-name=$NAMESPACE --outfile=js/$NAMESPACE.min.js
