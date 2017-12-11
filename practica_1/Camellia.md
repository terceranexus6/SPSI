**Camellia** es un sistema de criptografía desarrollado por Mitsubishi. Éstos patentaron el algoritmo, y dejaron su uso libre a cambio de no modificarlo. Esto ha provocado que aunque en Japón esté estandarizado, en US y otros países europeos el estandar sea AES (aunque tengan un potencial equivalente). GPG, Mozilla, FreeBSD y por supuesto OpenSSL lo tienen implementado junto a otros más.

El sistema Camelia puede usarse con **claves de 128, 192 y 256 bits**, y es implementable tanto en hardware como en software. Está basado en el cifrado Feistel, que ya hemos visto en teoría, y funciona tanto com 18 vueltas (para 128 bits) como con 24 vueltas (para 192 bits) y cada seis vueltas se aplica una capa de transformación lógica llamada "función FL" o su inversa. La capa de difusión usa una transformación lineal basada en una matriz MDS de tamaño cinco.

Como ya hemos comentado es **equivalente a AES**, dado que el número total de términos es 11.696, casi igual que AES. En total se requieren 6.224 ecuaciones en 3.584 variables usando 17.920 términos lineares y cuadráticos. Teóricamente estas características hacen posible romper el cifraco con un ataque algebráico, como un [ataque XSL](https://wikivisually.com/wiki/XSL_attack), en el futuro.

Bibliografía:

- [Wikia de Criptografía](http://cryptography.wikia.com)
- [Stack exchange de criptografía](https://crypto.stackexchange.com/questions/476/why-does-nobody-use-or-break-the-camellia-cipher)
- [Wiki Visually](https://wikivisually.com/wiki/Camellia_%28cipher%29)
