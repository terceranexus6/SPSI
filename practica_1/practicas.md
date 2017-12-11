# Seguridad y Protección en sistemas Informáticos
## práctica 1

Para la realización de las prácticas, dado que se requería el uso de un editor hexadecimal, me he descargado GHEX para linux. Una vez descargado he utilizado el comando _truncate_ para crear los archivos bianrios.   

    truncate -s 1024 input.bin
    truncate -s 1024 input2.bin

Para modificar el contenido por 1 según lo indicado he abierto los archivos binarios con GHEX y los he modificado.

    ghex input.bin
    ghex input2.bin

Una vez creados los archivos binarios originales, he utilizado openssl para cifrarlos y descifrarlos. De ahora en adelante, la contraseña fácil es **Hola** la semifácil es **H0l4** y la difícil es un conjunto aleatorio de caractéres y números generado con **openssl passwd**

![](captura_generar_contraseña)

Para generar los archivos cifrados de DES para input.bin he utilizado:

    openssl des-(numero de bits)-(tipo) -in input.bin -out inputcifrado.bin

Para generar los archivos cifrados de AES igual:

    openssl aes-(numero de bits)-(tipo) -in input.bin -out inputcifrado.bin

Por otro lado para descifrar los archivos he utilizado:

    openssl -s (cifrado)-(numero de bits)-(tipo) -in inputcifrado.bin -out inputdescifrado.bin

Para mejor organización he separado los archivos generados a partir de INPUT (todo 0 bits) e INPUT2 (primeros 40 bits 1) en carpetas separadas. También he seguido la misma estructura de nominación de archivos, de este modo:

input**nombre-de-cifrado**numero-de-bitsTipo.bin

![](https://github.com/terceranexus6/cosicas/blob/master/images/1.jpg)
![](https://github.com/terceranexus6/cosicas/blob/master/images/2.jpg)
![](https://github.com/terceranexus6/cosicas/blob/master/images/3.jpg)

### Observaciones:
 Sobre el ejercicio tres, el cifrado ECB tiene un contenido muy regular (se repite el contenido, parece predecible a simple vista), sin embargo cgc y ofb, diferentes respectivamente, lanzan un resultado en el binario mucho más irregular.
 
En el ejercicio cuatro, el resultado de ECB también es regular en todo el archivo binario, pero el output es diferente. 

No consigo ver la diferencia a simple vista en el hexadecimal de CBC entre los dos input que pide el ejercicio cinco.

Sobre el cifrado ofb en AES 192, me ha parecido muy interesante, porque al cifrar el contenido, ha generado un hexadecimal a simple vista caótico, al descifrarlo ha vuelto a contener solo bits de 0, y al volver a encriptarlo, el contenido aleatorio era distinto, lo que me demuestra muy claramente que cada cifrado es distinto que el anterior sobre el mismo contenido. 

### Explicación de otro algoritmo:

**Camelia**

**Camellia** es un sistema de criptografía desarrollado por Mitsubishi. Éstos patentaron el algoritmo, y dejaron su uso libre a cambio de no modificarlo. Esto ha provocado que aunque en Japón esté estandarizado, en US y otros países europeos el estandar sea AES (aunque tengan un potencial equivalente). GPG, Mozilla, FreeBSD y por supuesto OpenSSL lo tienen implementado junto a otros más.

El sistema Camelia puede usarse con **claves de 128, 192 y 256 bits**, y es implementable tanto en hardware como en software. Está basado en el cifrado Feistel, que ya hemos visto en teoría, y funciona tanto com 18 vueltas (para 128 bits) como con 24 vueltas (para 192 bits) y cada seis vueltas se aplica una capa de transformación lógica llamada "función FL" o su inversa. La capa de difusión usa una transformación lineal basada en una matriz MDS de tamaño cinco.

Como ya hemos comentado es **equivalente a AES**, dado que el número total de términos es 11.696, casi igual que AES. En total se requieren 6.224 ecuaciones en 3.584 variables usando 17.920 términos lineares y cuadráticos. Teóricamente estas características hacen posible romper el cifraco con un ataque algebráico, como un [ataque XSL](https://wikivisually.com/wiki/XSL_attack), en el futuro.

Bibliografía:

- [Wikia de Criptografía](http://cryptography.wikia.com)
- [Stack exchange de criptografía](https://crypto.stackexchange.com/questions/476/why-does-nobody-use-or-break-the-camellia-cipher)
- [Wiki Visually](https://wikivisually.com/wiki/Camellia_%28cipher%29)

Finalmente, para realizar los cifrados con Camellia, he usado el mismo comando de openssl que mencionaba arriba, y, como esperaba tras la investigación teórica, las observaciones han sido parecidas a las que he alcanzado con AES.
