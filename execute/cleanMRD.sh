NAME_SPACE=MRD
if [ -n "$BASH_SOURCE" ]; then
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
else
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
fi
SCRIPT_DIR=$SCRIPT_DIR"/"
CLEAN_OUT_PUT_DIR=$SCRIPT_DIR../output/$NAME_SPACE
if [ -d $CLEAN_OUT_PUT_DIR ]; then
    rm -r $CLEAN_OUT_PUT_DIR
fi