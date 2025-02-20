NAME_SPACE=MRD
if [ -n "$BASH_SOURCE" ]; then
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
else
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
fi
FIRST_OUT_PUT_DIR=$SCRIPT_DIR/../output
SOURCE_DIR=$SCRIPT_DIR/../fbs/$NAME_SPACE
SOURCE_FILES=$SOURCE_DIR/*.fbs
if [ $1 ]; then
    if [ -d "${SOURCE_DIR}" ] && compgen -G $SOURCE_FILES > /dev/null; then
        :
    else
        echo "No .fbs files found in ${SOURCE_DIR}"
        return
    fi
    flatc $1 -o $FIRST_OUT_PUT_DIR $SOURCE_FILES
    ARG_WITHOUT_DASHES=$(echo $1 | sed 's/^-*//')
    EXTENSION=$ARG_WITHOUT_DASHES
    if [ $ARG_WITHOUT_DASHES == cpp ]; then
        EXTENSION=h
        OUT_PUT_DIR=$FIRST_OUT_PUT_DIR/$NAME_SPACE/$EXTENSION
        mkdir -p $OUT_PUT_DIR
        mv $FIRST_OUT_PUT_DIR/*.$EXTENSION $OUT_PUT_DIR
    elif [ $ARG_WITHOUT_DASHES == jsonschema ]; then
        EXTENSION=schema.json
        OUT_PUT_DIR=$FIRST_OUT_PUT_DIR/$NAME_SPACE/$EXTENSION
        mkdir -p $OUT_PUT_DIR
        for file in $FIRST_OUT_PUT_DIR/*.$EXTENSION ; do
            base_name=$(basename "$file" .$EXTENSION)
            mv "$file" "$OUT_PUT_DIR/${base_name}.$NAME_SPACE.schema.json"
        done
    elif [ $ARG_WITHOUT_DASHES == ts ]; then
        OUT_PUT_DIR=$FIRST_OUT_PUT_DIR/$NAME_SPACE/$EXTENSION
        mkdir -p $OUT_PUT_DIR
        mv $FIRST_OUT_PUT_DIR/*.$EXTENSION $OUT_PUT_DIR
        LOWER_CASE_NAME_SPACE=${NAME_SPACE,,}
        mv $FIRST_OUT_PUT_DIR/$LOWER_CASE_NAME_SPACE $OUT_PUT_DIR
    else 
        OUT_PUT_DIR=$FIRST_OUT_PUT_DIR/$NAME_SPACE/$EXTENSION
        mkdir -p $OUT_PUT_DIR
        mv $FIRST_OUT_PUT_DIR/$NAME_SPACE/*.$EXTENSION $OUT_PUT_DIR
    fi
else
    echo params missing
fi

