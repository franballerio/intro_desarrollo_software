#!/bin/bash

source ./options.sh


while true; do

    echo -e "Seleccionar una de las siguientes opciones:\n\t1 - Crear Entorno\n\t2 - Correr Proceso\n\t3 - Alumnos\n\t4 - Top 10\n\t5 - Buscar por padron\n\t6 - Salir"
    read option

    if [[ $option -eq 6 ]]; then
        echo "Saliendo..."
        break
    fi

    if [[ $option -eq 1 ]]; then
        op1
        echo -e "\n------------\n"
    fi

    if [[ $option -eq 2 ]]; then
        op2
        echo -e "\n------------\n"
    fi

    if [[ $option -eq 3 ]]; then
        op3
        echo -e "\n------------\n"
    fi

    if [[ $option -eq 4 ]]; then
        op4
        echo -e "\n------------\n"
    fi

    if [[ $option -eq 5 ]]; then
        op5
        echo -e "\n------------\n"
    fi
done

