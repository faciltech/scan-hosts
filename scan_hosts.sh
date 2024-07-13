#!/bin/bash
echo "################################################################"
echo "## Autor: Eduardo Amaral - eduardo4maral@protonmail.com       ##"
echo "## You Tube : https://www.youtube.com/faciltech               ##"
echo "## github   : https://github.com/faciltech                    ##"
echo "## Facebook : https://www.facebook.com/faciltech123           ##"
echo "## Linkedin : https://www.linkedin.com/in/eduardo-a-02194451/ ##"
echo "## Atualização: 12/01/24                                      ##"
echo "################################################################"
echo ""

if [ "$#" -ne 2 ]
then
	echo " "
	echo "######################## MODO DE USO ######################################"
        echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Analisar uma rede: ./scan-hosts.sh -r 192.168.0 \e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m]"
        echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Analisar um host/dominio: ./scan-hosts.sh -t 192.168.0.4 \e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m]"
        echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Analisar uma lista de ips: ./scan-hosts.sh -l ips.txt \e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m]"
	echo -e "\e[31m[*] ATENÇÃO: Só portas TCP, Necessita de Nmap \e[0m"
	echo "###########################################################################"
	exit
else

#### Condicao para criar um novo projeto caso este nome ja exista

	while true; do
		read -p $'\e[1;92m[\e[0m\e[1;77m?\e[0m\e[1;92m] Escolha o nome do projeto:\e[0m ' diretorio
		if [[ -e $diretorio ]]; then
			echo "[-] Já existe um projeto com esse nome."

		elif [[ -z $diretorio ]];then
			echo "[-] O nome do projeto não pode ser vazio."

		else
			mkdir $diretorio
			break
		fi
	done

fi

if [ $1 == "-l" ] && [ $2 != " " ];
then
	echo -n "DIGITE O NOME DO PROJETO: "
	echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Inicio do Scan:\e[0m\e[1;77m  $(date +%d/%m/%y) - às $(date +%T) \e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m]"
	echo -e "\033[40;1;32m#### SCANEANDO HOSTS ####\033[0m"

	hosts=$2
	for i in $(cat $hosts);
        do
                echo $i
		echo $i >> relatorio.txt
                mkdir $diretorio/$i
        done

        for i in $(cat $hosts);
        do
		echo -e "\033[40;1;32m#### SCANEANDO PORTAS DO HOST $i ####\033[0m"
		echo -e "\e[31m#### SCANEANDO PORTAS DO HOST $i ####\e[0m" >> relatorio.txt
                portas=$(sudo nmap -sS --open -p- -Pn $i --host-timeout 500 | grep '^[0-9]' | awk -F'/' '{print $1}'| xargs | sed 's/ /,/g')

                if [ -z "$portas" ]; then
                	echo -e "\033[1;31mSem portas abertas \033[0m"
			echo ""
                else

                	echo -e "Portas abertas do Host $i: \e[1;33;40m$portas \e[0m"
	             	nmap -v -sC -sV -p $portas $i 2>/dev/null > $diretorio/$i/portas_servicos.txt
                	echo "Os serviços das portas foram salvos no arquivo $diretorio/$i/portas_servicos.txt"
			echo ""
		fi
        done 
	echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Fim do Scan:\e[0m\e[1;77m  $(date +%d/%m/%y) - às $(date +%T) \e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m]"
elif [ $1 == "-r" ] && [ $2 != " " ]
then
	echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Inicio do Scan:\e[0m\e[1;77m  $(date +%d/%m/%y) - às $(date +%T) \e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m]"
	echo -e "\033[40;1;32m#### SCANEANDO HOSTS ####\033[0m"
        echo -e "\e[31m#### SCANEANDO HOSTS ####\e[0m" >> relatorio.txt	

	hosts=$(sudo nmap -sn $2.0/24 | grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b')
        for i in $hosts;
        do
                echo $i
                echo $i >> relatorio.txt
                mkdir $diretorio/$i
        done
        for i in $hosts;
        do
                echo -e "\033[40;1;32m#### SCANEANDO PORTAS DO HOST $i ####\033[0m"
                echo -e "\e[31m#### SCANEANDO PORTAS DO HOST $i ####\e[0m" >> relatorio.txt
                portas=$(sudo nmap -sS --open -p- -Pn $i --host-timeout 500 | grep '^[0-9]' | awk -F'/' '{print $1}'| xargs | sed 's/ /,/g')

                if [ -z "$portas" ]; then
            	    echo -e "\033[1;31mSem portas TCP abertas \033[0m"
		    echo ""
            	    echo "Sem portas TCP abertas no Host $i" >> relatorio.txt
                else
                	echo -e "Portas abertas do Host $i: \e[1;33;40m$portas \e[0m"
                	nmap -v -sC -sV -p $portas $i 2>/dev/null  > $diretorio/$i/portas_servicos.txt
                	echo "Os serviços das portas foram salvos no arquivo $diretorio/$i/portas_servicos.txt"
                	echo ""
		fi
	done
	echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Fim do Scan:\e[0m\e[1;77m  $(date +%d/%m/%y) - às $(date +%T) \e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m]"
elif [ $1 == "-t" ] && [ $2 != " " ]
then
	echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Inicio do Scan:\e[0m\e[1;77m  $(date +%d/%m/%y) - às $(date +%T) \e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m]"
        echo ""
	echo -e "\033[40;1;32m#### SCANEANDO PORTAS DO HOSTS $i ####\033[0m"
        echo -e "\e[31m#### SCANEANDO PORTAS DO HOST $i ####\e[0m" >> relatorio.txt
        portas=$(sudo nmap -sS --open  -p- -Pn $2 --host-timeout 500 | grep '^[0-9]' | awk -F'/' '{print $1}'| xargs | sed 's/ /,/g')
	if [ -z "$portas" ];
	then
		echo -e "\033[1;31mSem portas TCP abertas. \033[0m"
	else
		echo -e "Portas abertas do Host $i: \e[1;33;40m$portas \e[0m"
        	nmap -v -sC -sV -p $portas $2 2>/dev/null  > $diretorio/portas_servicos.txt
        	echo "Os serviços das portas foram salvos no arquivo $diretorio/portas_servicos.txt"
		echo ""
	fi
	echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Fim do Scan:\e[0m\e[1;77m  $(date +%d/%m/%y) - às $(date +%T) \e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m]"
else
#	echo "Modo de Uso:"
#	echo "- Se voce quer scanear uma rede completa, você passe a opção -r e os tres primeiros octetos."
#	echo "Exemplo: ./scan-hosts.sh -r 192.168.0"
#	echo "- Se voce quer scanear apenas um host, use a opcao -t e passe o ip."
#	echo "Exemplo: ./scan-hosts.sh -t 192.168.0.4"
#	echo "- Se voce quer scanear uma lista de ips a partir de uma arquivo .txt, use o exemplo abaixo." 
#	echo "Exemplo: ./scan-hosts.sh -l ips.txt"
	break
fi

