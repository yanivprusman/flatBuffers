#!/bin/bash
if [ -n "$BASH_SOURCE" ]; then
    SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
else
    SCRIPT_PATH="$(readlink -f "$0")"
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
fi
NAME_SPACE=MRD
SOURCE_DIR=$SCRIPT_DIR/../fbs/$NAME_SPACE
if [ -d "${SOURCE_DIR}" ] && compgen -G $SOURCE_FILES > /dev/null; then
    :
else
    echo "No .fbs files found in ${SOURCE_DIR}"
    return
fi
. $SCRIPT_DIR/clean$NAME_SPACE.sh
. $SCRIPT_DIR/build$NAME_SPACE.sh --php
. $SCRIPT_DIR/build$NAME_SPACE.sh --cpp
if [ -d $SCRIPT_DIR/../output/$NAME_SPACE ]; then
    tree $SCRIPT_DIR/../output/$NAME_SPACE --filelimit 10
else
    echo no files where generated for $NAME_SPACE
fi