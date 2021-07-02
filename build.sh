#!/bin/bash

# https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
SOURCE_FOLDER=$(dirname "$(readlink -f "$0")")

HOST_FOLDER=$SOURCE_FOLDER/build_host
PICO_FOLDER=$SOURCE_FOLDER/build_pico

case $1 in
    clean) :
        echo "Cleaning everything"
        rm -rf ${HOST_FOLDER}
        rm -rf ${PICO_FOLDER}
        exit 0
        ;;
    *) :
        echo "Continuing with normal build"
        ;;
esac

if [ ! -d ${HOST_FOLDER} ]; then
    mkdir ${HOST_FOLDER}
    cd ${HOST_FOLDER}
    cmake .. -DCMAKE_BUILD_TYPE=Debug -DPICO_PLATFORM=host
    cd - > /dev/null
fi

if [ ! -d ${PICO_FOLDER} ]; then
    mkdir ${PICO_FOLDER}
    cd $PICO_FOLDER
    cmake .. -DCMAKE_BUILD_TYPE=Debug
    cd - > /dev/null
fi

cd ${HOST_FOLDER}
make -j48
cd - > /dev/null

cd ${PICO_FOLDER}
make -j48
cd - > /dev/null
