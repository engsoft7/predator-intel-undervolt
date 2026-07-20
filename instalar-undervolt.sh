#!/bin/bash

set -e

echo "=== Instalando dependências ==="

sudo apt update
sudo apt install -y build-essential pkg-config git

echo "=== Baixando intel-undervolt ==="

cd /tmp
rm -rf intel-undervolt

git clone https://github.com/kitsunyan/intel-undervolt.git
cd intel-undervolt

echo "=== Compilando ==="

make
sudo make install

echo "=== Configurando undervolt ==="

sudo tee /etc/intel-undervolt.conf > /dev/null <<EOF
undervolt 0 'CPU' -120
undervolt 1 'GPU' -50
undervolt 2 'CPU Cache' -120
undervolt 3 'System Agent' 0
undervolt 4 'Analog I/O' 0
EOF


echo "=== Criando serviço systemd ==="

sudo tee /etc/systemd/system/intel-undervolt.service > /dev/null <<EOF
[Unit]
Description=Intel Undervolt
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/usr/bin/intel-undervolt apply
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF


echo "=== Ativando serviço ==="

sudo systemctl daemon-reload
sudo systemctl enable intel-undervolt
sudo systemctl start intel-undervolt


echo "=== Verificando ==="

sudo intel-undervolt read

echo "=== Finalizado ==="
