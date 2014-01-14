#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VFILE=${DIR}/../Vagrantfile

MEMORY=$(expr ${1} \* 1024)

echo "Updating memory allocation to ${MEMORY} MB"

sed -i "" "s/vb.memory = 2048/vb.memory = ${MEMORY}/" ${VFILE}
