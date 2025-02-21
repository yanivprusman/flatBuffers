NAME_SPACE=MRD
if [ -n "$BASH_SOURCE" ]; then
    SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
fi
OUT_PUT_DIR=$SCRIPT_DIR/../output
SOURCE_DIR=$SCRIPT_DIR/../fbs/$NAME_SPACE
SOURCE_FILES=$SOURCE_DIR/*.fbs
if [ $1 ]; then
    if [ -d "${SOURCE_DIR}" ] && compgen -G "${SOURCE_DIR}" >/dev/null; then
        :
    else
        echo "No .fbs files found in ${SOURCE_DIR}"
        return
    fi
    ARG_WITHOUT_DASHES=$(echo $1 | sed 's/^-*//')
    EXTENSION=$ARG_WITHOUT_DASHES
    OUT_PUT_DIR=$OUT_PUT_DIR/$NAME_SPACE/$EXTENSION
    mkdir -p $OUT_PUT_DIR
    flatc $1 -o $OUT_PUT_DIR $SOURCE_FILES
else
    echo params missing
fi

