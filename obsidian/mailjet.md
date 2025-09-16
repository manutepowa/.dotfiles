---
id: mailjet
aliases:
  - mailjet
tags:
  - email
  - template
  - fer
  - drupal
  - php
---

# Uso de Plantillas con Variables Ad-hoc en Mailjet (PHP + API v3.1)

## ✅ ¿Es necesario crear propiedades de contacto?
No. Para **plantillas transaccionales** puedes pasar **variables ad-hoc** directamente en la llamada a la **Send API v3.1** sin necesidad de declararlas como *contact properties* en Mailjet.

Esto se hace con los parámetros:

- `TemplateID` → ID de la plantilla publicada.
- `TemplateLanguage: true` → habilita el lenguaje de plantillas.
- `Variables` → objeto con claves/valores que quieras usar (no ligados a contactos).

---

## 📌 Ejemplo en PHP con el SDK oficial

```php
<?php
require 'vendor/autoload.php';

use \Mailjet\Client;
use \Mailjet\Resources;

$mj = new Client(getenv('MJ_APIKEY_PUBLIC'), getenv('MJ_APIKEY_PRIVATE'), true, ['version' => 'v3.1']);

$body = [
  'Messages' => [[
    'From' => ['Email' => 'noreply@tudominio.com', 'Name' => 'Mi App'],
    'To'   => [['Email' => 'destino@ejemplo.com', 'Name' => 'Destinatario']],
    'TemplateID'       => 123456,     // ID de tu plantilla en Mailjet
    'TemplateLanguage' => true,       // activa el lenguaje de plantillas
    'Subject'          => 'Hola {{var:first_name:"amigo"}}',
    'Variables'        => [           // variables ad-hoc
      'first_name' => 'María',
      'plan'       => 'Pro',
      'items'      => [
        ['name' => 'Producto A', 'qty' => 2],
        ['name' => 'Producto B', 'qty' => 1]
      ]
    ]
  ]]
];

$res = $mj->post(Resources::$Email, ['body' => $body]);
```

📝 En la plantilla

En tu plantilla (creada en el editor de Mailjet) puedes usar:

{{var:first_name}} para el nombre.

{{var:plan}} para el plan contratado.

Bucle sobre items para mostrar lista de productos.

Ejemplo con valor por defecto:

Hola {{var:first_name:"amigo"}}, gracias por elegir el plan {{var:plan}}.

Hola {{var:first_name:"amigo"}}, gracias por elegir el plan {{var:plan}}.

