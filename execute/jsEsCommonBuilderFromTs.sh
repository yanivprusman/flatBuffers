NAME_SPACE=MRD
if [ -n "$BASH_SOURCE" ]; then
    SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
else
    SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
fi
FLAT_BUFFERS_DIR=$SCRIPT_DIR/..
TS_FROM_DIR=$FLAT_BUFFERS_DIR/output/$NAME_SPACE/ts
JS_ES_COMMON_BUILDER_FROM_TS_DIR=$FLAT_BUFFERS_DIR/jsEsCommonBuilderFromTs
rsync -a --delete $TS_FROM_DIR $JS_ES_COMMON_BUILDER_FROM_TS_DIR
npm --prefix $JS_ES_COMMON_BUILDER_FROM_TS_DIR run build


