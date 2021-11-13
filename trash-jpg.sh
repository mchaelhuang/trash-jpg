#!/bin/sh

# vars
TRASHJPG_DIR=~/.trash-jpg/
TRASH_BINARY=${TRASHJPG_DIR}bin/trash

# create dir if not exist
[ -d $TRASHJPG_DIR ] || mkdir $TRASHJPG_DIR

# write stdout & stderr into file
exec >> ${TRASHJPG_DIR}trash-jpg.log

# check binary trash is exist
if [ ! -f "$TRASH_BINARY" ]; then
    echo "\n## First Run ###############################"
    echo "Installing trash binary $TRASH_BINARY"

    # download trash binary
    curl -L https://github.com/sindresorhus/macos-trash/releases/download/v1.1.1/trash.zip > ${TMPDIR}trash.zip

    # unzip to ./bin/
    unzip ${TMPDIR}trash.zip -d ${TRASHJPG_DIR}bin/

    echo "Installing done."
fi

echo "\n## $(date) ###################################"
echo "Directory: "$1
cd "$1"

# list found
echo "JPG founds:"
find . -type f -iname "*.jpg" -maxdepth 1

# find & delete jpg files
find . -type f -iname "*.jpg" -maxdepth 1 -exec $TRASH_BINARY {} \;