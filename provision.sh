#!/usr/bin/env bash

echo "Atualizando pacotes..."
sudo apt update -y
sudo apt upgrade -y

echo "Instalando dependências para Docker..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

echo "Adicionando chave GPG e repositório Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable"

sudo apt update -y
echo "Instalando Docker..."
sudo apt install -y docker-ce docker-compose

echo "Adicionando vagrant ao grupo docker..."
sudo usermod -aG docker vagrant

echo "Verificando Docker..."
docker --version && docker-compose --version

echo "Criando docker-compose.yml no /home/vagrant..."
cp /vagrant/docker-compose.yml /home/vagrant/
cd /home/vagrant
sudo docker-compose up -d
