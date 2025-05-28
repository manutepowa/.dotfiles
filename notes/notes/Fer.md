# Sistema de validación de documentos PDF

- La clave es el método **CRC** (Cyclic Redundancy Check). Lo hace signaturit.com
- Con esto podemos generar un código **del contenido** del documento y validarlo (no de los metadatos).
  - El usuario sube el PDF a tu sistema de validación.
  - El backend calcula el hash del archivo recibido.
  - El sistema compara ese hash con el valor guardado en la base de datos en el momento de la generación/descarga (registro de descargas).
  - Si coinciden, el documento es íntegro.

Ejemplo con NodeJS
```js
const fs = require('fs');
const crc32 = require('crc/crc32');

const archivo = 'ruta/al/archivo.pdf';

// Lee el archivo como buffer
const buffer = fs.readFileSync(archivo);

// Calcula el CRC32 y lo muestra en hexadecimal
const crc = crc32(buffer).toString(16);
console.log(`CRC32 de ${archivo}: ${crc}`);
```

Ejemplo con PHP
```php
<?php
$archivo = 'ruta/al/archivo.pdf';

// Opción eficiente para archivos grandes
$crc = hash_file('crc32b', $archivo);

// Si prefieres el valor como entero sin signo:
printf("CRC32 de %s: %s\n", $archivo, $crc);
?>
```

## Servicios de firma
Servicios para firmar documentos que certifican la identidad del firmante y otorga validez legal.

- signaturit.com
- viafirma.com
- firmafy.com
