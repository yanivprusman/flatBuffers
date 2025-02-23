SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
FLAT_BUFFERS_DIR="$SCRIPT_DIR/.."
PACKAGE_JSON="$FLAT_BUFFERS_DIR/jsEsCommonBuilderFromTs/package.json"
if [ -z "$NAME_SPACE" ]; then
    echo "Error: NAME_SPACE variable not set"
    return 1
fi
if [ ! -f "$PACKAGE_JSON" ]; then
    echo "Error: Cannot find package.json at $PACKAGE_JSON"
    return 1
fi
jq --arg namespace "$NAME_SPACE" \
   '.main = "./js/**/*.js" |
    .module = "./mjs/**/*.js" |
    .types = "./js/**/*.d.ts" |
    .scripts."build:browser" = "esbuild ./js/**/*.js --minify --global-name=\($namespace) --bundle --outfile=js/\($namespace).min.js"' \
    "$PACKAGE_JSON" > "$PACKAGE_JSON.tmp" && mv "$PACKAGE_JSON.tmp" "$PACKAGE_JSON"
for config in "$(dirname "$PACKAGE_JSON")"/tsconfig*.json; do
    if [ -f "$config" ]; then
        echo "Updating $config"
        jq '.compilerOptions.outFile = null' "$config" > "$config.tmp" && mv "$config.tmp" "$config"
    fi
done
echo "Build configuration updated for namespace: $NAME_SPACE"