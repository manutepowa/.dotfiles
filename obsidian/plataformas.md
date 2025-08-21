---
title: Plataformas
tags: [platforms, development, drupal, composer, iris, llumh, migration]
---

# Plataformas

# notas

composer remove "drupal/block_class" "drupal/fitvids" "drupal/flexslider" drupal/views_url_alias_filter drupal/console drupal/swiftmailer --no-update
composer require 'drupal/csv_serialization:^4.0' --no-update
composer require 'drupal/core-recommended:^10.2' 'drupal/core-composer-scaffold:^10.2' 'drupal/core-project-message:^10.2' drush/drush --no-update


## Importación IRIS/LLUMH
- Eliminar users teacher
- To lower emails
- Mapear grados en español


## Migrar llamada descuentos de IRIS/LLUMH
- Descargar csv de IRIS/LLUMH con dni - email
- Crear endpoint para comprobar si existe en el centro de estudios.
- Si no existe, comprobar en el CSV
