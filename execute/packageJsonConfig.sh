if [ $# -ne 1 ]; then
    echo "Usage: packageJsonConfig.sh <namespace>"
    echo "Example: packageJsonConfig.sh MRD"
    return
fi
NAME_SPACE=$1;
ORIGINAL_DIR="$(pwd)" 
SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
FLAT_BUFFERS_DIR="$SCRIPT_DIR/.."
JS_ES_COMMON_BUILD_FROM_Ts_DIR="$FLAT_BUFFERS_DIR"/jsEsCommonBuilderFromTs
PACKAGE_JSON=$JS_ES_COMMON_BUILD_FROM_Ts_DIR/package.json
KEBAB_CASE_NAME=$(echo "$NAME_SPACE" | sed 's/\([A-Z]\)/-\L\1/g' | sed 's/^-//')
GLOBAL_NAME=$(echo "$NAME_SPACE" | sed 's/[^a-zA-Z0-9]//g')
cat > "$PACKAGE_JSON" << EOF
{
  "name": "flatbuffers-${KEBAB_CASE_NAME}",
  "version": "1.0.0",
  "description": "FlatBuffers Implementation for ${KEBAB_CASE_NAME}",
  "files": [
    "${JS_ES_COMMON_BUILD_FROM_Ts_DIR}/js/**/*.js",
    "${JS_ES_COMMON_BUILD_FROM_Ts_DIR}/js/**/*.d.ts",
    "${JS_ES_COMMON_BUILD_FROM_Ts_DIR}/mjs/**/*.js",
    "${JS_ES_COMMON_BUILD_FROM_Ts_DIR}/mjs/**/*.d.ts",
    "${JS_ES_COMMON_BUILD_FROM_Ts_DIR}/ts/**/*.ts"
  ],
  "main": "./js/index.js",
  "module": "./mjs/index.js",
  "types": "./js/index.d.ts",
  "scripts": {
    "clean": "rimraf js mjs",
    "lint": "eslint ts",
    "build:cjs": "tsc",
    "build:esm": "tsc -p tsconfig.mjs.json",
    "build:browser": "npx esbuild ${JS_ES_COMMON_BUILD_FROM_Ts_DIR}/js/${KEBAB_CASE_NAME}.js --bundle --minify --global-name=${GLOBAL_NAME} --outfile=${JS_ES_COMMON_BUILD_FROM_Ts_DIR}js/${KEBAB_CASE_NAME}.min.js",
    "build": "npm run clean && npm run build:cjs && npm run build:esm && npm run build:browser",
    "prepublishOnly": "npm run build"
  },
  "dependencies": {
    "flatbuffers": "^25.2.10"
  },
  "devDependencies": {
    "@types/node": "^20.10.4",
    "@typescript-eslint/eslint-plugin": "^6.13.2",
    "@typescript-eslint/parser": "^6.13.2",
    "esbuild": "^0.19.8",
    "eslint": "^8.55.0",
    "rimraf": "^5.0.5",
    "typescript": "5.3.3"
  }
}
EOF
cat > "$(dirname "$PACKAGE_JSON")/tsconfig.json" << EOF
{
  "compilerOptions": {
    "target": "es2015",
    "module": "commonjs",
    "moduleResolution": "node",
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true,
    "outDir": "./js",
    "rootDir": "./ts",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true
  },
  "include": ["ts/**/*"],
  "exclude": ["node_modules"]
}
EOF
cat > "$(dirname "$PACKAGE_JSON")/tsconfig.mjs.json" << EOF
{
  "extends": "./tsconfig.json",
  "compilerOptions": {
    "module": "es2015",
    "outDir": "./mjs"
  }
}
EOF
cd "$(dirname "$PACKAGE_JSON")"
if [ ! -d "node_modules" ]; then
    npm install
fi
echo "Build configuration updated for namespace: $KEBAB_CASE_NAME"
cd "$ORIGINAL_DIR" 
