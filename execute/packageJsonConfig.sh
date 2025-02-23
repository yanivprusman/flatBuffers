SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
FLAT_BUFFERS_DIR="$SCRIPT_DIR/.."
PACKAGE_JSON="$FLAT_BUFFERS_DIR/jsEsCommonBuilderFromTs/package.json"
if [ -z "$NAME_SPACE" ]; then
    echo "Error: NAME_SPACE variable not set"
    exit 1
fi
if [ ! -f "$PACKAGE_JSON" ]; then
    echo "Error: Cannot find package.json at $PACKAGE_JSON"
    exit 1
fi
BUILD_SCRIPT="$(dirname "$PACKAGE_JSON")/build-browser.sh"
cat > "$BUILD_SCRIPT" << 'EOF'
#!/bin/bash
NAMESPACE=$1
FIRST_DIR=$(find js -type f -name '*.js' -exec dirname {} \; | sort -u | head -n 1)
npx esbuild $FIRST_DIR/*.js --bundle --minify --global-name=$NAMESPACE --outfile=js/$NAMESPACE.min.js
EOF
chmod +x "$BUILD_SCRIPT"
cd "$(dirname "$PACKAGE_JSON")"
npm install
cat > "$PACKAGE_JSON" << EOF
{
  "name": "flatbuffers-${NAME_SPACE,,}",
  "version": "1.0.0",
  "description": "FlatBuffers Implementation for ${NAME_SPACE}",
  "files": [
    "js/**/*.js",
    "js/**/*.d.ts",
    "mjs/**/*.js",
    "mjs/**/*.d.ts",
    "ts/**/*.ts"
  ],
  "main": "./js/index.js",
  "module": "./mjs/index.js",
  "types": "./js/index.d.ts",
  "scripts": {
    "clean": "rimraf js mjs",
    "lint": "eslint ts",
    "build:cjs": "tsc",
    "build:esm": "tsc -p tsconfig.mjs.json",
    "build:browser": "./build-browser.sh ${NAME_SPACE}",
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
echo "Build configuration updated for namespace: $NAME_SPACE"