<!-- AUTO-GENERATED-CONTENT:START (STARTER) -->
<p align="center">
  <a href="https://www.faciltech.info">
    <img alt="faciltech" src="https://yt3.ggpht.com/ytc/AAUvwng4KJs5t62nl2AvqDVOuXepKCSZp-l9_AQlsKBbwg=s176-c-k-c0x00ffffff-no-rj-mo" width="160" />
  </a>
</p>
<h1 align="center">
  Scan-Hosts - Ferramenta para enumeraçao de hosts e portas.
</h1>

A ideia desse script simples otimizar tempo, utilizamos o Nmap para fazer a verificaçao dos Hosts de um segmento de rede, em seguida ele identifica todos os hosts Up e cria uma pasta para cada Host.
Em seguida, o script verifica as portas abertas e os serviços, mostrando as portas abertas na tela, se salvando os serviços destas portas em um arquivo .txt dentro da respectiva pasta.
## 🚀 Por que usa-lo?

Muitas vezes precisamos verificar em uma rede com muitos hosts, quais estão vivos e quais portas e serviços estão em execução. Dessa forma eu automatizei o processo, facilitando e trazendo de forma organizada os resultados.
  
1.  **Como instalar?**

    Navegue dentro de seu sistema, escolha o local e execute no terminal o comando abaixo.

    ``` 
        git clone https://github.com/faciltech/scan-hosts.git
        Cloning into 'scan'...
        remote: Enumerating objects: 10, done.
        remote: Counting objects: 100% (10/10), done.
        remote: Compressing objects: 100% (10/10), done.
        remote: Total 10 (delta 1), reused 0 (delta 0), pack-reused 0
        Receiving objects: 100% (10/10), 19.14 KiB | 612.00 KiB/s, done.
        Resolving deltas: 100% (1/1), done.
      ```

2.  **Conceda permissão para o arquivo!**
```
chmod +x scan_hosts.sh
```
OBS: Uma outra boa dica é mover o arquivo do script para o diretório /usr/bin , dessa forma podemos utilizar de forma direta no terminal.
## 🧐 Como usar o script?

Você irá digitar ```./scan_hosts.sh 192.168.0``` 

![image](https://github.com/faciltech/scan-hosts/assets/3409713/6bbac0ba-2169-49c3-ae17-e090da10beae)
<img alt="faciltech" src="20230118_194341.gif"/>
## 🎓 Linguagem

O utilitário é desenvolvido em linguagem shellscript, necessita que o nmap esteja instalado na maquina.
![image](https://github.com/faciltech/scan-hosts/assets/3409713/5fe41cd5-1f62-4aa2-a234-26d3d31efe65)

<!-- AUTO-GENERATED-CONTENT:END -->


