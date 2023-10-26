#!/bin/bash

clear

while true; do
  echo -e "\e[1;34m███    ███ ███████ ██    ██ \e[0m"
  sleep 0.05
  echo -e "\e[1;34m████  ████ ██      ██    ██     Minecraft Server Manager for Linux\e[0m"
  sleep 0.05
  echo -e "\e[1;34m██ ████ ██ ███████ ██    ██     Coded by Werty\e[0m"
  sleep 0.05
  echo -e "\e[1;34m██  ██  ██      ██  ██  ██  \e[0m"
  sleep 0.05
  echo -e "\e[1;34m██      ██ ███████   ████   \e[0m"
  sleep 0.05
  echo -e "1. \e[1;34mInstal·lar Java Version Manager (jvm)\e[0m" 
  sleep 0.05
  echo -e "2. \e[1;34mSeleccionar i descarregar Java\e[0m"
  sleep 0.05
  echo -e "3. \e[1;34mInstalar Servidor\e[0m"
  sleep 0.05
  echo -e "4. \e[1;34mIniciar Servidor\e[0m"
  sleep 0.05
  echo -e "5. \e[1;34mSortir\e[0m"
  printf "\nIntrodueix el número de l'opció que desitges:"
  read -p "->" opcio

    if [ $opcio -eq 1 ]; then
        echo "\nInstal·lant Java Version Manager (jvm)..."
        sudo apt-get update
        sudo apt install curl git
        git clone https://github.com/wsingleton/jvm
        cd jvm/platforms/linux/bin
        bash install.sh
        ./jvm
        echo "Java Version Manager instal·lat correctament."
        clear
    elif [ $opcio -eq 2 ]; then
        echo "\nSelecciona la versió de Java que desitges descarregar:"
        echo -e "0. \e[1;34mJava Latest\e[0m"
        echo -e "1. \e[1;34mJava 8\e[0m"
        echo -e "2. \e[1;34mJava 11\e[0m"
        echo -e "3. \e[1;34mJava 16\e[0m"
        read -p "Introdueix el número corresponent a la versió: " versio_java

        if [ $versio_java -eq 0 ]; then
            clear
            echo "Descarregant Java Latest..."
            ./jvm/platforms/linux/bin/jvm install latest
            ./jvm/platforms/linux/bin/jvm use latest
            clear
        elif [ $versio_java -eq 1 ]; then
            clear
            echo "Descarregant Java 18..."
            ./jvm/platforms/linux/bin/jvm install 18
            ./jvm/platforms/linux/bin/jvm use 18
            clear
        elif [ $versio_java -eq 2 ]; then
            clear
            echo "Descarregant Java 16..."
            ./jvm/platforms/linux/bin/jvm install 16
            ./jvm/platforms/linux/bin/jvm use 16
            clear
        elif [ $versio_java -eq 3 ]; then
            clear
            echo "Descarregant Java 11..."
            ./jvm/platforms/linux/bin/jvm install 11
            ./jvm/platforms/linux/bin/jvm use 11
            clear
        elif [ $versio_java -eq 4 ]; then
            clear
            echo "Descarregant Java 8"
            ./jvm/platforms/linux/bin/jvm install 8
            ./jvm/platforms/linux/bin/jvm use 8
            clear
        else
            echo "Opció no vàlida."
        fi
    elif [ $opcio -eq 3 ]; then
        clear
        echo "Selecciona la versió de Minecraft que vulguis descarregar:"
        echo "1. Minecraft Server 1.12.2"
        echo "2. Minecraft Server 1.16.5"
        echo "3. Minecraft Server 1.18.2"
        echo "4. Minecraft Server 1.20.1"
        read -p "Introdueix el numero corresponent al menu: " versio_server
        if [ $versio_server -eq 1 ]; then
            clear
            wget https://piston-data.mojang.com/v1/objects/886945bfb2b978778c3a0288fd7fab09d315b5f/server.jar
            mkdir server
            mv server.jar server
        elif [ $versio_java -eq 2 ]; then
            clear
            wget https://piston-data.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
            mkdir server
            mv server.jar server
        elif [ $versio_java -eq 3 ]; then
            clear
            wget https://piston-data.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar
            mkdir server
            mv server.jar server
        elif [ $versio_java -eq 4 ]; then
            clear
            wget https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar
            mkdir server
            mv server.jar server
        fi
    elif [ $opcio -eq 4 ]; then
        clear
        echo "Iniciant servidor..."
        cd server
        echo "eula=true" > eula.txt
        java -jar server.jar
    elif [ $opcio -eq 5 ]; then
        echo "Sortint del programa."
        exit 0
    else
        echo "Opció no vàlida."
    fi
done
