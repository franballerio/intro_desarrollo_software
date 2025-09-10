#!/bin/bash

directorio="/home/franb/EPNro1"
#entrada="${directorio}/entrada"
file_name="${directorio}/salida/${FILENAME}"
#procesado="${directorio}/procesado"

op1() {

    # agregar logica para verificar si ya fue creado el entorno

    if [[ -d ${directorio} ]]; then
        echo "El entorno ya existe"
        return
    fi

    cd /home/franb

    mkdir EPNro1 EPNro1/entrada EPNro1/salida EPNro1/procesado
    touch EPNro1/salida/"${FILENAME}"


    cat << EOF > /home/franb/EPNro1/consolidar.sh
#!/bin/bash

directorio="/home/franb/EPNro1"
entrada="${directorio}/entrada"
file_name="${directorio}/salida/${FILENAME}"
procesado="${directorio}/procesado"

while true; do
    for archivo in "${entrada}"/*.txt; do
        if [[ -f "$archivo" ]]; then
            cat "$archivo" >> "$file_name"
            #echo >>"$file_name"
    
            mv "$archivo" "${procesado}/"
        fi
    done
    sleep 3
done
EOF

    echo -e "Entorno creado correctamente"
}

op2() {
    bash /home/franb/EPNro1/consolidar.sh &
    echo "Corriendo proceso en segundo plano"
}

op3() {
    if [ -f ${file_name} ]; then
        cat ${file_name} | sort -k1 -n
    fi    
}

op4() {
    if [ -f ${file_name} ]; then
        cat ${file_name} | sort -k5 -rn
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
    done < ${file_name}
    # simplicar alumnos .txt

    # ver implementacion con grep
    }