#!/bin/bash

directorio="/home/franb/Desktop/uba/intro_soft/tp1"
entrada="${directorio}/entrada"
file_name="${directorio}/salida/${filename}.txt"
procesado="${directorio}/procesado"

while true; do
    find ${entrada} -type f -exec cat {} >> ${file_name} \; -exec echo >> ${file_name} \; -exec mv {} ${procesado}/ \;
done

# podria aplicar un sleep para controlar cada cuanto se ejecuta el while