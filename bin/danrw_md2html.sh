#!/bin/bash

if [ "$1" != '' ]
  then 
    URL=$1
  else
    echo "Please provide URL as argument"
    exit 1
  fi

TIMESUFFIX=`date +%d-%b-%Y-T-%H-%M-%S`
mkdir $TIMESUFFIX
cd $TIMESUFFIX
wget -q $URL;
FILE=`find ! -type d -name "*.md" -printf "%f\n"`
FILE_STEM=$(echo $FILE | cut -d'.' -f 1)
echo "Transform $FILE_STEM to $FILE_STEM.html"
markdown $FILE -o $FILE.html
cat ../static/header.html $FILE.html ../static/footer.html > $FILE_STEM.html
