#!/bin/bash

# directorio="/home/franb/EPNro1"
# entrada="${directorio}/entrada"
# file_name="${directorio}/salida/${FILENAME}"
# procesado="${directorio}/procesado"
ejemplos="./ejemplos"

#find ${entrada} -type f -exec mv {} ${procesado} \; -exec cat ./procesado/{} >> ${file_name} \; -exec echo >> ${file_name} \; 
for archivo in "${ejemplos}"/*.txt; do
    if [[ -f "$archivo" ]]; then
        cat "$archivo"
    fi
done
sleep 3
