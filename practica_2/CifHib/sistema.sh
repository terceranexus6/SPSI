#!/bin/bash

echo "Bienvenido al sistema de encriptacion para SPSI."
read -p"Seleccione modo de operacion: " sim
read -p"Mensaje a cifrar: " men
echo $men > cifrar.txt
read -p"Elija un nombre para su texto (con extension): " nombre
echo Archivo $nombre creado
read -p"Elija un nombre para su texto de salida (con extension): " nombre2
echo Archivo $nombre2 creado
touch $nombre
touch $nombre2

num=${#men}

linea1="openssl rand -hex $num "
liena2="echo $sim"

$linea1 > $nombre
$linea2 >> $nombre

touch cifrar.txt
touch mensajecifrado.txt

read -p"Seleccione la clave publica :" pub
read -p"Seleccione la clave privada :" priv

line=$(head -n 1 $nombre)

openssl rsautl -encrypt -inkey $pub -pubin -in $nombre -out $nombre2
openssl rsautl -decrypt -inkey $priv -in $nombre2 -out dec.bin
openssl $sim -in cifrar.txt -out mensajecifrado.txt -pass pass:$line
rm -rf cifrar.txt
