<!-- AUTO-GENERATED-CONTENT:START (STARTER) -->
<p align="center">
  <a href="https://www.faciltech.info">
    <img alt="faciltech" src="https://yt3.ggpht.com/ytc/AAUvwng4KJs5t62nl2AvqDVOuXepKCSZp-l9_AQlsKBbwg=s176-c-k-c0x00ffffff-no-rj-mo" width="160" />
  </a>
</p>
<h1 align="center">
  Scan-Hosts - Ferramenta para enumeraçao de hosts e portas.
</h1>

A ideia desse script simples otimizar tempo, utilizamos o Nmap para fazer a verificaçao dos Hosts de um segmento de rede,voce escolhe um nome para o projeto, ele cria uma pasta para o projeto e em seguida ele identifica todos os hosts Up e cria uma subpasta para cada Host dentro do diretório pai.
Em seguida, o script verifica as portas abertas e os serviços, mostrando as portas abertas na tela, se salvando os serviços destas portas em um arquivo .txt dentro da respectiva subpasta.
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
Caso digite sem o argumento da rede, recebe a seguinte resposta:

![image](https://github.com/faciltech/scan-hosts/assets/3409713/7f25fb64-fda4-4f10-a363-51388d5d7434)

Você irá digitar ```./scan_hosts.sh -r 192.168.0``` 
Ele vai perguntar o nome do projeto:
Em seguida o script faz o scan de hosts vivos.
![image](https://github.com/faciltech/scan-hosts/assets/3409713/9bfe296e-1eac-4e0c-b040-910a154c1637)
<img alt="faciltech" src="20230118_194341.gif"/>

Também pode ser utilizado a opçao -l para passar uma lista de ips.

Ex:

![image](https://github.com/faciltech/scan-hosts/assets/3409713/5ceff1aa-ee87-490f-bc2d-33273d324566)

```
./scan-hosts.sh -l lista_ips.txt
```
![image](https://github.com/faciltech/scan-hosts/assets/3409713/b7693cb5-5963-4fd1-9525-4a8e27380610)

## 🎓 Linguagem

O utilitário é desenvolvido em linguagem shellscript, necessita que o nmap esteja instalado na maquina.
![image](https://github.com/faciltech/scan-hosts/assets/3409713/7b7c1d7b-bfe4-469c-8e1d-8a4e1844e480)

![image](https://github.com/faciltech/scan-hosts/assets/3409713/5fe41cd5-1f62-4aa2-a234-26d3d31efe65)

![image](https://github.com/faciltech/scan-hosts/assets/3409713/e96daa5f-060d-41bd-8588-206c0e09335e)

<!-- AUTO-GENERATED-CONTENT:END -->


