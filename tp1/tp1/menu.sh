#!/bin/bash

# Francisco Ballerio
# Lautaro Soria

directorio="/home/EPNro1"
entrada="$directorio/entrada"
file_name="$directorio/salida/$FILENAME"
procesado="$directorio/procesado"

if [[ -z $FILENAME ]]; then
    # si la variable no esta definida o vacia
    echo "debes definir la variable de ambiente FILENAME"
    exit
fi

if [ $# -eq 1 ]; then
    if [ $1 == "-d" ]; then
        pkill -f "consolidar.sh"
        sudo rm -rf /home/EPNro1
        echo "Proceso y entorno eliminados con exito ;c"
        
        echo -e "\n----------------------"
        echo -e "----------------------\n"
        exit
    fi
fi

opcion=0
while [[ "$opcion" -ne 6 ]]
do
    #echo -e "\n\t----------------------"
    echo -e "\n------------------------------------------------\n"
    echo -e "Seleccionar una de las siguientes opciones:\n\t1 - Crear Entorno\n\t2 - Correr Proceso\n\t3 - Alumnos\n\t4 - Top 10\n\t5 - Buscar por padron\n\t6 - Salir"
    echo -e "\n------------------------------------------------\n"
    #echo -e "\t----------------------\n"
    
    read opcion
    case $opcion in
        1)  
            if [[ -d $directorio ]]; then
                echo "Entorno ya existente"
                sleep 3
                clear
                continue
            else 

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
    sleep 1
done
EOF
                echo -e "Entorno creado correctamente"
                #echo -e "\n\t----------------------"
                #echo -e "\t----------------------\n"
            fi
            ;;
        2)  
            process=$(pgrep -f "consolidar.sh")

            if [[ -z $process ]]; then
                clear
                echo "Seleccionaste correr el proceso consolidar, ahora cada archivo ingresado en entrada se procesara"
                bash /home/EPNro1/consolidar.sh &
                #echo -e "\n----------------------"
                #echo -e "----------------------\n"
            else
                echo "Proceso corriendo en segundo plano"
                clear
            fi
            ;;
        3)
            echo "Seleccionaste mostrar alumnos ordenados por padron"
            if [ -f "$file_name" ]; then
                clear
                cat "$file_name" | sort -t';' -k1 -n
            fi
            #echo -e "\n\t----------------------"
            #echo -e "\t----------------------\n"
            ;;
        4)
            echo "Seleccionaste mostrar alumnos ordenados por nota mas alta"
            if [ -f "$file_name" ]; then
                clear
                sort -t';' -k4 -rn "$file_name" | head
            fi
            #echo -e "\n\t----------------------"
            #echo -e "\t----------------------\n"
            ;;
        5)  
            if [ -f "$file_name" ]; then
                echo "Seleccionaste buscar alumno por padron"
                echo "ingrese numero de padron: "

                clear
                read padron
                grep "$padron" "$file_name"
            fi

            # while IFS=";" read -r c1 c2 c3 c4 ; do
            #     if [[ $c1 -eq $x ]]; then
            #         echo "$c1 $c2 $c3 $c4 "
            #     fi
            # done < "$file_name"
            #echo -e "\n\t----------------------"
            #echo -e "\t----------------------\n"
            ;;
            # ver implementacion con grep
        6)
            #echo "Seleccionaste salir del menu"
            #pkill -f "consolidar.sh"
            echo "saliendo.."
            clear
            #break
            #echo -e "\n\t----------------------"
            #echo -e "\t----------------------\n"
            ;;
    esac
sleep 3
done