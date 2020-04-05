#!/bin/bash

source $(git rev-parse --show-toplevel)/scripts/sourceme.sh
# set -x
ORIG_DIR=$(pwd)
cd $READING_DIR

if (( 2 <= $# )) && [[ "-a" == "$1" ]]; then
    # Show all
    for FILE in $(eval "grep -riIsl \"${@:2}\""); do
        readlink -f $FILE
    done
    exit 0
elif [[ 1 == $# && -f $ORIG_DIR/$1 ]]; then
    # Show a file based on relative path
    FILE=$ORIG_DIR/$1
elif [[ 1 == $# && -f $1 ]]; then
    # Show a file based on absolute path
    FILE=$1
elif [[ 1 == $# ]] && $(grep -riIsq "@*{$1,"); then
    # Show a file based on bibtex ref
    FILE="$(grep -riIsl "@*{$1," . | head -1)"
    FILE="$(readlink -f "$FILE")"
else
    # Show the file with the most string matches
    FILE_W_NUM=$(eval "grep -riIsc \"$@\" . | sort -t: -n -k2 | tail -1")
    NUM="$(echo $FILE_W_NUM | cut -d: -f2)"
    if (( $NUM == 0 )); then
        echo "No matches"
        exit 1
    fi
    FILE="$(echo $FILE_W_NUM | cut -d: -f1)"
    FILE="$(readlink -f "$FILE")"
fi

if [[ ! -f "$FILE" ]]; then
    echo "Sorry, file \"$FILE\" not found."
    exit 1
fi

NAME="$(cat "$FILE" | head -1 | sed 's/# //')"
AUTHOR="$(cat "$FILE" | grep -A1 "\sauthor =" | tr '\n' ' ' | cut -d{ -f2 | cut -d} -f1)"
REF="$(cat "$FILE" | grep -A1 "\`bib" | tr '\n' ' ' | cut -d{ -f2 | cut -d, -f1)"
URL=$(cat "$FILE" | grep -A1 "\surl =" | tr '\n' ' ' | cut -d{ -f2 | cut -d} -f1)
CIT_COUNT=$($SCRIPTS_DIR/count-citations.sh -n $REF)
CIT_MESSAGE=""
if ((0 < CIT_COUNT)); then
    CIT_MESSAGE="(cited in $CIT_COUNT place$(((1 == CIT_COUNT)) || echo s))"
fi

echo
echo -e "$LIGHT_CYAN$NAME$NO_COLOR"
echo -e "by $YELLOW$AUTHOR$NO_COLOR"
echo
echo -e "$BLUE$URL$NO_COLOR"
echo -e "$FILE"
echo
echo -e "cite as $LIGHT_GREEN$REF$NO_COLOR $CIT_MESSAGE"
echo
