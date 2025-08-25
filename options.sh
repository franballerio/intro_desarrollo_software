#!/bin/bash

op1() {
    export FILENAME="alumnos.txt"

    cd /home

    mkdir EPNro1 EPNro1/entrada EPNro1/salida EPNro1/procesado
    touch EPNro1/salida/${filename}


    cat << 'EOF' > /home/EPNro1/consolidar.sh
        #!/bin/bash

        directorio="/home/EPNro1"
        entrada="${directorio}/entrada"
        file_name="${directorio}/salida/${FILENAME}"
        procesado="${directorio}/procesado"

        while true; do
        find ${entrada} -type f -exec cat {} >> ${file_name} \; -exec echo >> ${file_name} \; -exec mv {} ${procesado}/ \;
        done
EOF

    echo -e "Entorno creado correctamente"
}

op2() {
    bash /home/EPNro1/consolidar.sh &
}

op3() {
    if [ -f "/home/lauta/Escritorio/so/salida/${FILENAME}" ]; then
    cat "/home/lauta/Escritorio/so/salida/${FILENAME}" | sort -k1 -n
    fi    
}

op4() {
    if [ -f "/home/lauta/Escritorio/so/salida/${FILENAME}" ]; then
    cat "/home/lauta/Escritorio/so/salida/${FILENAME}" | sort -k5 -rn
    fi

    #definir alumno.txt en una variable para simplificar, y q este en el home
    # preguntar al profesor por que dice q el txt es de 4 columnas, agrupando nombre y apellido, y en realidad no es asi    
}

op5() {
    echo ingrese numero de padron

    read x

    while read -r c1 c2 c3 c4 c5; do
    if [[ $c1 -eq $x ]]; then
        echo "$c1 $c2 $c3 $c4 $c5"
    fi
    done < "/home/lauta/Escritorio/so/salida/${FILENAME}"
    # simplicar alumnos .txt

    # ver implementacion con grep
    }