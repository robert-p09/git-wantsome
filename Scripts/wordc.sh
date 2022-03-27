#!/bin/bash

FILE=${!#}

function file {
if [[ -f $FILE ]]; then
string=$(<$FILE)
else
echo "Not a file. String?"
select yn in "Yes" "No"; do

  case $yn in
    Yes ) string=$FILE;
         break;;
    No ) exit;;
  esac
done
fi

}

while getopts ":wlc:" opt; do
  file
  case ${opt} in
    c )
      echo "Number of characters: ${#string}"
      ;;
    w )
      i=0
      for j in $string; do
      ((i++))
      done
      echo "Number of words: $i"
      ;;
     l )
      lines=`awk 'END{print NR}' $FILE`
      echo "Number of lines: $lines"
      ;;
     \? )
      echo "Invalid option: $OPTARG (accepted: w, l, c)" 1>&2
      ;;
     : )
      echo "File or st\ring missing" 1>&2
      ;;
  esac
done
