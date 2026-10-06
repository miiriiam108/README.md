#!/bin/bash

# Actualizar repositorios
sudo apt update -y

# Instalar Apache
sudo apt install apache2 -y

# Activar y arrancar el servicio
sudo systemctl enable apache2
sudo systemctl start apache2

# Crear página personalizada
echo "<h1>Servidor Apache de Miriam</h1>" > index.html
echo "<p>Hostname: $(hostname)</p>" >> index.html

# Copiar la página al directorio web
sudo mv index.html /var/www/html/index.html
