#!/bin/bash

if [[ -z $FILENAME ]]; then
    echo "debes definir la variable de ambiente FILENAME"
    exit
fi
# si la variable no esta definida o vacia

directorio="/home/EPNro1"
entrada="$directorio/entrada"
file_name="$directorio/salida/$FILENAME"
procesado="$directorio/procesado"

a=0
while [[ "$a" -ne 6 ]]
do
    echo -e "\n\t----------------------"
    echo -e "\t----------------------\n"
    echo -e "Seleccionar una de las siguientes opciones:\n\t1 - Crear Entorno\n\t2 - Correr Proceso\n\t3 - Alumnos\n\t4 - Top 10\n\t5 - Buscar por padron\n\t6 - Salir\n\td - borrar entorno ;c"
    echo -e "\n\t----------------------"
    echo -e "\t----------------------\n"
    read a
    case $a in
        1)
            echo "Seleccionaste crear entorno"
            cd /home

            mkdir EPNro1 EPNro1/entrada EPNro1/salida EPNro1/procesado
            touch EPNro1/salida/${FILENAME}

            cat << EOF > /home/EPNro1/consolidar.sh
#!/bin/bash

directorio="/home/EPNro1"
entrada="$directorio/entrada"
file_name="$directorio/salida/${FILENAME}"
procesado="$directorio/procesado"

while true; do
    find ${entrada} -type f -exec cat {} >> ${file_name} \; -exec echo >> ${file_name} \; -exec mv {} ${procesado}/ \;
done
EOF
            echo -e "Entorno creado correctamente"
            echo -e "\n\t----------------------"
            echo -e "\t----------------------\n"
            ;;
        2)  
            echo "Seleccionaste correr el proceso consolidar, ahora cada archivo ingresado en entrada se procesara"
            process=$(pgrep -f "consolidar.sh")

            if [[ -z $process ]]; then
                bash /home/EPNro1/consolidar.sh &
                echo -e "\n----------------------"
                echo -e "----------------------\n"
            fi
            ;;
        3)
            echo "Seleccionaste mostrar alumnos ordenados por padron"
            if [ -f "$file_name" ]; then
                cat ""$file_name"" | sort -k1 -n
            fi
            echo -e "\n\t----------------------"
            echo -e "\t----------------------\n"
            ;;
        4)
            echo "Seleccionaste mostrar alumnos ordenados por nota mas alta"
            if [ -f "$file_name" ]; then
                cat "$file_name" | sort -t';' -k4 -rn
            fi
            echo -e "\n\t----------------------"
            echo -e "\t----------------------\n"
            ;;
        5)
            echo "Seleccionaste buscar alumno por padron"
            echo "ingrese numero de padron: "

            read x
            #grep "^$x;" "$file_name"|echo "$1 $2 $3 $4"

            while IFS=";" read -r c1 c2 c3 c4 ; do
                if [[ $c1 -eq $x ]]; then
                    echo "$c1 $c2 $c3 $c4 "
                fi
            done < "$file_name"
            echo -e "\n\t----------------------"
            echo -e "\t----------------------\n"
            ;;
            # ver implementacion con grep
        6)
            echo "Seleccionaste salir del menu"
            pkill -f "consolidar.sh"
            echo "saliendo.."
            echo -e "\n\t----------------------"
            echo -e "\t----------------------\n"
            ;;
        d) 
            pkill -f "consolidar.sh"
            sudo rm -r EPNro1
            echo "procesos y directorios borrados con exito ;c"
            a=6
            echo -e "\n----------------------"
            echo -e "----------------------\n"
            ;;
    esac
done