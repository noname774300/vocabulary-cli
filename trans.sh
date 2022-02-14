#!/bin/bash

dirpath="./logs"
mkdir -p ${dirpath}

filename="$(echo ${@} | awk '{ gsub(/[^A-Za-z0-9]/, "_"); print }').txt"
filepath="${dirpath}/${filename}"
if [ ! -e ${filepath} ] || [[ ${filepath} =~ _{3,} ]]; then
trans ${@} > ${filepath} 2>&1
fi
less -R ${filepath}
