#!/bin/bash
figlet SCAN-HOSTS
echo "Autor: Eduardo Amaral - eduardo4maral@protonmail.com"
echo "You Tube : https://www.youtube.com/faciltech"
echo "github   : https://github.com/faciltech"
echo "Linkedin : https://www.linkedin.com/in/eduardo-a-02194451/"
if [ -z "$1" ]
then
        echo "Modo de Uso: ./scan.sh 192.168.0"
        echo "Apenas ID da rede (3 primeiros numeros, exemplo 192.168.0)."
        echo "ATENÇÃO: Só portas TCP"
        echo "OBS: Necessita de Nmap"
        exit 1
fi

echo -e "\e[31m#### SCANEANDO HOSTS ####\e[0m"
hosts=$(sudo nmap -sn $1.0/24 | grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b')
for i in $hosts;
do
        echo $i
        mkdir $i
done
for i in $hosts;
do
        cd $i
        echo ""
        echo -e "\e[31m#### SCANEANDO PORTAS DO HOST $i ####\e[0m"
        portas=$(sudo nmap -sS --open --source-port 443 -p- -Pn $i | grep '^[0-9]' | awk -F'/' '{print $1}'| xargs | sed 's/ /,/g')

        if [ -z "$portas" ]; then
            echo "Sem portas abertas no Host $i"
        else
            printf "\e[1;33;40mPortas abertas do Host $i \e[0m: \e[1;32m$portas\e[0m"                                                                                                                                                      
            echo " "                                                                                                                                                                                                                       
            echo -e "\e[31m#### Informações dos serviços das Portas do Host $i ####\e[0m"                                                                                                                                                  
            nmap -sC -sV -p $portas -Pn $i > portas_servicos.txt                                                                                                                                                                           
            echo "Os serviços das portas foram salvos no arquivo /$i/portas_servicos.txt"                                                                                                                                                  
        fi                                                                                                                                                                                                                                 
                                                                                                                                                                                                                                           
        cd ..                                                                                                                                                                                                                              
done 
