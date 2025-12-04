#!/bin/bash

echo "Iniciando PROGRAMA-ADVOCACIA..."

if ! command -v python &> /dev/null; then
    echo "Python não está instalado."
    echo "Instale com: sudo pacman -S python"
    exit 1
fi

if [ ! -d "venv" ]; then
    python -m venv venv
fi

source venv/bin/activate

pip install --upgrade pip

if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
else
    echo "requirements.txt não encontrado."
    exit 1
fi

if [ -f "index.py" ]; then
    python index.py
else
    echo "index.py não encontrado. Abortando."
    exit 1
fi
