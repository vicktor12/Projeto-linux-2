#!/bin/bash

echo "Atualizando servidor para receber serviços"
apt update && upgrade -y
echo "Servidor atualizado"

echo "Instalando serviços"
echo "Instalando Apache"
apt install apache2 -y
echo "Instalando Samba"
apt install samba -y
echo "Instalando MySQL"
apt install mysql-server-8.0 -y

echo "Serviços Instalados"

echo "Configurando para serviços rodarem ao iniciar a maquina"
systemctl enable apache2
systemctl enable smbd
systemctl enable mysql

echo "Serviços Prontos para serem utilizados"
echo "Iniciando com Apache"
echo "baixando site exemplo"
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "instalando unzip"
apt install unzip -y
echo "Descompactando arquivo baixado"
unzip main.zip
echo "movendo para diretorio do apache"
cp -R linux-site-dio-main /var/www/html
echo "Apache pronto!! É possivel ver site a partir do IP 192.168.0.40"

echo "--------------------"

