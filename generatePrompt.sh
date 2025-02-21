CALLER=`pwd`
SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
EXECUTE_DIR=$SCRIPT_DIR/execute
NORMAL_SCRIPT=$EXECUTE_DIR/tempNormal.sh
LOOP_SCRIPT=$EXECUTE_DIR/tempLoop.sh
CLEAN_SCRIPT=$EXECUTE_DIR/cleanMRD.sh
FLAT_BUFFERS_DIR=$SCRIPT_DIR
OUT_TXT=$SCRIPT_DIR/out.txt
OUT_PUT_DIR=$SCRIPT_DIR/output/MRD
FBS_DIR=$FLAT_BUFFERS_DIR/fbs/MRD
echo 'prompt:'> $OUT_TXT
echo 'these are my .fbs files: ' >> $OUT_TXT
cd $FBS_DIR
find . -name "*.fbs" -exec sh -c '
    echo "File: {}"
    # Remove single-line comments, then remove multi-line comments
    cat {} | \
    sed '"'"'s|//.*$||g'"'"' | \
    sed '"'"':a;N;$!ba;s|/\*.*\*/||g'"'"' | \
    # Remove empty lines that might result from comment removal
    sed '"'"'/^[[:space:]]*$/d'"'"'
    echo ""
' \; >> $OUT_TXT

echo 'this is the output i get from calling 
flatc $1 -o $OUT_PUT_DIR $SOURCE_FILES' >> $OUT_TXT
. $CLEAN_SCRIPT
SAVE_OUT_PUT_DIR=$OUT_PUT_DIR
. $NORMAL_SCRIPT --ts 
OUT_PUT_DIR=$SAVE_OUT_PUT_DIR
tree $OUT_PUT_DIR --filelimit 10 >>$OUT_TXT
cd $OUT_PUT_DIR
find . -name "*.ts" -exec sh -c '
    echo "File: {}"
    # Remove single-line comments, then remove multi-line comments
    cat {} | \
    sed '"'"'s|//.*$||g'"'"' | \
    sed '"'"':a;N;$!ba;s|/\*.*\*/||g'"'"' | \
    # Remove empty lines that might result from comment removal
    sed '"'"'/^[[:space:]]*$/d'"'"'
' \; >> $OUT_TXT
echo 'so i ran 
    COUNTER=0
    for file in $SOURCE_DIR/*.fbs; do
        THE_DIR=$OUT_PUT_DIR$COUNTER
        let "COUNTER++"
        mkdir -p $THE_DIR
        flatc $1 -o $THE_DIR "$file"
    done
instead and got:' >> $OUT_TXT
. $CLEAN_SCRIPT
SAVE_OUT_PUT_DIR=$OUT_PUT_DIR
. $LOOP_SCRIPT --ts 
OUT_PUT_DIR=$SAVE_OUT_PUT_DIR
tree $OUT_PUT_DIR --filelimit 12 >>$OUT_TXT
cd $OUT_PUT_DIR
find . -name "*.ts" -exec sh -c '
    echo "File: {}"
    # Remove single-line comments, then remove multi-line comments
    cat {} | \
    sed '"'"'s|//.*$||g'"'"' | \
    sed '"'"':a;N;$!ba;s|/\*.*\*/||g'"'"' | \
    # Remove empty lines that might result from comment removal
    sed '"'"'/^[[:space:]]*$/d'"'"'
' \; >> $OUT_TXT
cd $CALLER
code $OUT_TXT



