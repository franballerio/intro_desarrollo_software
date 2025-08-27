#!/bin/bash
if [[ -z "${FILENAME+x}" ]]; then
    echo "debes definir la variable de ambiente FILENAME"
    exit
fi
#si la variable no  esta definida o vacia


a=0

while [ "$a" -ne 6 ]
do
    echo -e "Seleccionar una de las siguientes opciones:\n\t1 - Crear Entorno\n\t2 - Correr Proceso\n\t3 - Alumnos\n\t4 - Top 10\n\t5 - Buscar por padron\n\t6 - Salir"
    read a
    case $a in
        1) 
            echo "seleccionaste crear entorno"
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
    chmod+x /home/EPNro1/consolidar.sh

    echo -e "Entorno creado correctamente"
    echo -e "\n------------\n"
    ;;

        2) 
            bash /home/EPNro1/consolidar.sh &
            echo -e "\n------------\n"
            ;;


        3)
            if [ -f "/home/lauta/Escritorio/so/salida/${FILENAME}" ]; then
                cat "/home/lauta/Escritorio/so/salida/${FILENAME}" | sort -k1 -n
            fi  
            echo -e "\n------------\n"
            ;;

        4)
            if [ -f "/home/lauta/Escritorio/so/salida/${FILENAME}" ]; then
                cat "/home/lauta/Escritorio/so/salida/${FILENAME}" | sort -k5 -rn
            fi
            echo -e "\n------------\n"
            ;;

        5)
            echo ingrese numero de padron

            read x

            while read -r c1 c2 c3 c4 c5; do
                if [[ $c1 -eq $x ]]; then
                    echo "$c1 $c2 $c3 $c4 $c5"
                fi
            done < "/home/lauta/Escritorio/so/salida/${FILENAME}"
            echo -e "\n------------\n"
            # simplicar alumnos .txt

            # ver implementacion con grep
            ;;
        6) echo "saliendo"
        echo -e "\n------------\n"
        ;;

    esac
done
    