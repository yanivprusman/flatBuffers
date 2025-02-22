NAME_SPACE=MRD
if [ -n "$BASH_SOURCE" ]; then
    SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
fi
FLAT_BUFFERS_DIR=$SCRIPT_DIR/..
OUT_PUT_DIR=$FLAT_BUFFERS_DIR/output
SOURCE_DIR=$FLAT_BUFFERS_DIR/fbs/$NAME_SPACE
SOURCE_FILES=$SOURCE_DIR/*.fbs
JS_BUILDER_DIR=$FLAT_BUFFERS_DIR/jsEsCommonBuilderFromTs
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
    if [ $ARG_WITHOUT_DASHES == ts ]; then
        MERGED="$OUT_PUT_DIR/merged_${NAME_SPACE_LOWER_CASE}.ts"
        COUNTER=0
        for file in $SOURCE_DIR/*.fbs; do
            flatc $1 -o $OUT_PUT_DIR $file
            NAME_SPACE_LOWER_CASE=${NAME_SPACE,,}
            mv $OUT_PUT_DIR/$NAME_SPACE_LOWER_CASE.ts $OUT_PUT_DIR/$NAME_SPACE_LOWER_CASE$COUNTER.ts
            let "COUNTER++"
        done
        {
            grep "^export" "$OUT_PUT_DIR"/${NAME_SPACE_LOWER_CASE}*.ts | 
                sed 's/.*\:export/export/' | 
                sort -u
        } > $MERGED
        find $OUT_PUT_DIR  -maxdepth 1 -type f -name "*.ts" ! -name "$(basename "$MERGED")" -delete
        cp -r $OUT_PUT_DIR $JS_BUILDER_DIR
        npm run build --prefix $JS_BUILDER_DIR
        cp $JS_BUILDER_DIR/js/merged_${NAME_SPACE_LOWER_CASE}.min.js $OUT_PUT_DIR/
    else
        flatc $1 -o $OUT_PUT_DIR $SOURCE_FILES
    fi
else
    echo params missing
fi

