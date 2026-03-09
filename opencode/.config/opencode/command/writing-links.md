---
description: Genera links de correcciones writing (answers tipo fill_count) - últimas 10 o IDs específicos
---

# Skill: Generar Links de Correcciones Writing

Esta skill genera links para acceder rápidamente a las correcciones writing.
Ejecutar automáticamente cuando el usuario no proporciona texto ni ids.

## Comportamiento

- **Si el usuario NO proporciona IDs**: Consulta las 10 últimas answers de tipo `fill_count` y genera links
- **Si el usuario SÍ proporciona IDs**: Solo genera links para los IDs específicos que dio

## Comando para obtener el progress ID

Para cada answer, obtener el ID del campo `field_referenced_progress`:

```bash
ddev drush ev "
  \$answer = \Drupal::entityTypeManager()->getStorage('answer')->load({{ID}});
  \$progress_id = \$answer->get('field_referenced_progress')->target_id;
  echo \$progress_id;
"
```

## Comando para obtener últimas 10 (cuando no hay IDs)

```bash
ddev drush ev "
  \$query = \Drupal::entityQuery('answer')
    ->accessCheck(FALSE)
    ->condition('bundle', 'fill_count')
    ->condition('field_corrected', TRUE)
    ->sort('created', 'DESC')
    ->range(0, 10);
  \$ids = \$query->execute();
  foreach (array_values(\$ids) as \$id) {
    echo \$id . PHP_EOL;
  }
"
```

## Formato de URLs

Para cada ID de answer, generar:

**Writing Corrections:**
- DDEV: `https://apiplatform.ddev.site/en/writing-corrections/{{ID}}`
- Prod: `https://panel.beenglishlab.es/en/writing-corrections/{{ID}}`

**Edición Answer:**
- DDEV: `https://apiplatform.ddev.site/en/answer/{{ID}}`
- Prod: `https://panel.beenglishlab.es/en/answer/{{ID}}`

**Progress ID** (del campo `field_referenced_progress`):
- Mostrar el ID del progreso referenciado

**Comando para reencolar corrección** (NO ejecutar, solo mostrar):
```bash
drush ev "\Drupal::service('queue')->get('ai_writing')->createItem(['progressID' => {{PROGRESS_ID}}]);"
```

## Ejemplos de uso

### Sin IDs → Últimas 10 automáticas
El usuario no dice nada.

Resultado:
```
Últimas 10 correcciones writing (fill_count):

Answer ID: 1260021 | Progress ID: 272099
Writing Corrections:
- DDEV:  https://apiplatform.ddev.site/en/writing-corrections/1260021
- Prod:  https://panel.beenglishlab.es/en/writing-corrections/1260021

Editar Answer:
- DDEV:  https://apiplatform.ddev.site/en/answer/1260021
- Prod:  https://panel.beenglishlab.es/en/answer/1260021

Reencolar corrección:
drush ev "\Drupal::service('queue')->get('ai_writing')->createItem(['progressID' => 272099]);"

Answer ID: 1260020 | Progress ID: 272098
...
```

### Con IDs específicos → Solo esos IDs
Usuario dice: *"dame los links para 1260021, 1260015"*

Resultado:
```
Links para IDs especificados:

Answer ID: 1260021 | Progress ID: 272099
Writing Corrections:
- DDEV:  https://apiplatform.ddev.site/en/writing-corrections/1260021
- Prod:  https://panel.beenglishlab.es/en/writing-corrections/1260021

Editar Answer:
- DDEV:  https://apiplatform.ddev.site/en/answer/1260021
- Prod:  https://panel.beenglishlab.es/en/answer/1260021

Reencolar corrección:
drush ev "\Drupal::service('queue')->get('ai_writing')->createItem(['progressID' => 272099]);"

Answer ID: 1260015 | Progress ID: 271845
...
```

## Regla simple

- **No hay IDs en el mensaje** → Ejecuta drush, trae últimas 10
- **Hay IDs en el mensaje** → Usa esos IDs directamente, sin drush
- **Para cada answer** → Muestra: Answer ID, Progress ID, URLs (DDEV/Prod), y el comando de reencolado (sin ejecutar)
