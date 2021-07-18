#!/bin/sh

export PATH=$PATH:/usr/local/bin

echo "" >> ~/trash-jpg.log
echo "## DRYRUN DEBUG $(date) ###################################" >> ~/trash-jpg.log
echo "Dir: "$1 >> ~/trash-jpg.log
echo "Whoami: "$(whoami) >> ~/trash-jpg.log
echo "Trash binary: "$(which trash) >> ~/trash-jpg.log
cd "$1"
echo "PWD: $(pwd)" >> ~/trash-jpg.log
echo "JPGs trashed: " >> ~/trash-jpg.log
find . -type f -iname "*.jpg" -maxdepth 1 >> ~/trash-jpg.log