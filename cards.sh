#!/bin/bash

dirpath="./cards"
mkdir -p ${dirpath}

cat ${@} | while read word; do
echo $word
sleep 3
filename="$(echo ${word} | awk '{ gsub(/[^A-Za-z0-9]/, "_"); print }').txt"
filepath="${dirpath}/${filename}"
if [ ! -e ${filepath} ] || [[ ${filepath} =~ _{3,} ]]; then
trans -d -j en:ja ${word} > ${filepath} 2>&1
fi
less -f -R ${filepath}
done
