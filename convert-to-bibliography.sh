#!/bin/bash

INFILE="Annotated-bibliography.md"
OUTFILE="Thesis.bib"
PRINTLN="false"

echo "% This is an auto-generated bibliography file based on $INFILE" > $OUTFILE
echo "" >> $OUTFILE

while read -r LINE; do

  if [[ "$LINE" =~ '```' ]]; then
    echo "" >> $OUTFILE
    PRINTLN="false"
  fi

  if [[ "$PRINTLN" == "true" ]]; then
    echo -E $LINE >> $OUTFILE
  fi

  if [[ "$LINE" =~ '```bib' ]]; then
    PRINTLN="true"
  fi

done < $INFILE
