if [ $# -ne 2 ]; then
    echo "Usage: flatBuffersBuild.sh <namespace> <--format>"
    echo "Example: flatBuffersBuild.sh MRD ts"
    return
fi
NAME_SPACE=$1
FORMAT=$2
if [ -n "$BASH_SOURCE" ]; then
    SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
fi
FLAT_BUFFERS_DIR=$SCRIPT_DIR/..
OUT_PUT_DIR=$FLAT_BUFFERS_DIR/output
SOURCE_DIR=$FLAT_BUFFERS_DIR/fbs/$NAME_SPACE
SOURCE_FILES=$SOURCE_DIR/*.fbs
JS_BUILDER_DIR=$FLAT_BUFFERS_DIR/jsEsCommonBuilderFromTs
if [ -d "${SOURCE_DIR}" ] && compgen -G "${SOURCE_DIR}" >/dev/null; then
    :
else
    echo "No .fbs files found in $(realpath $SOURCE_DIR)"
    return
fi
FORMAT_WITHOUT_DASHES=$(echo $FORMAT | sed 's/^-*//')
EXTENSION=$FORMAT_WITHOUT_DASHES
OUT_PUT_DIR=$OUT_PUT_DIR/$NAME_SPACE/$EXTENSION
mkdir -p $OUT_PUT_DIR
flatc $FORMAT -o $OUT_PUT_DIR $SOURCE_FILES
if [ $FORMAT_WITHOUT_DASHES = ts ]; then
    rm -rf "$JS_BUILDER_DIR/ts"
    cp -r $OUT_PUT_DIR $JS_BUILDER_DIR
    . $SCRIPT_DIR/packageJsonConfig.sh $NAME_SPACE
    npm run build --prefix $JS_BUILDER_DIR
    cp $JS_BUILDER_DIR/js/*.min.js $OUT_PUT_DIR/
    DOCS_DIR=$FLAT_BUFFERS_DIR/docs
    cp $JS_BUILDER_DIR/js/*.min.js $DOCS_DIR/
fi
