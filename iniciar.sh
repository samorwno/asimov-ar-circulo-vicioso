#!/bin/bash
# Iniciar el servidor local de "Asimov AR - Círculo Vicioso"
cd "$(dirname "$0")" || exit 1
echo "=================================================="
echo " Asimov AR - Circulo Vicioso"
echo " Servidor en http://localhost:8000"
echo " Abre esa direccion, permite la camara y apunta"
echo " al marcador Hiro (markers/hiro.png)."
echo " Ctrl+C para detener."
echo "=================================================="
python3 -m http.server 8000
