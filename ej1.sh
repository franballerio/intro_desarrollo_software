#!/bin/bash

export FILENAME=alumnos

cd /home

sudo mkdir EPNro1 EPNro1/entrada EPNro1/salida EPNro1/procesado

sudo echo > /home/EPNro1/consolidar.sh <<EOF
#!/bin/bash

directorio="/home/EPnro1"
entrada="${directorio}/entrada"
file_name="${directorio}/salida/${FILENAME}.txt"
procesado="${directorio}/procesado"

while true; do
    find ${entrada} -type f -exec cat {} >> ${file_name} \; -exec echo >> ${file_name} \; -exec mv {} ${procesado}/ \;
done
EOF







