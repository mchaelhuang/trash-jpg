#!/bin/sh

export PATH=$PATH:/usr/local/bin

echo "" >> ~/trash-jpg.log
echo "## $(date) ###################################" >> ~/trash-jpg.log
echo "Dir: "$1 >> ~/trash-jpg.log
cd "$1"
echo "JPGs trashed: " >> ~/trash-jpg.log
find . -type f -iname "*.jpg" -maxdepth 1 >> ~/trash-jpg.log
find . -type f -iname "*.jpg" -maxdepth 1 -exec trash {} \;
