NAME_SPACE=MRD
FIRST_OUT_PUT_DIR=../output
SOURCE_FILES=../fbs/$NAME_SPACE/*.fbs
if [ $1 ]; then
    flatc $1 -o $FIRST_OUT_PUT_DIR $SOURCE_FILES
    ARG_WITHOUT_DASHES=$(echo $1 | sed 's/^-*//')
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
    else 
        EXTENSION=$ARG_WITHOUT_DASHES
        OUT_PUT_DIR=$FIRST_OUT_PUT_DIR/$NAME_SPACE/$EXTENSION
        mkdir -p $OUT_PUT_DIR
        mv $FIRST_OUT_PUT_DIR/$NAME_SPACE/*.$EXTENSION $OUT_PUT_DIR
    fi
else
    echo params missing
fi

