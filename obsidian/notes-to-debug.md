---
title: Notes To Debug
tags: [debug, troubleshooting, api, drupal, json-api, jwt]
---

# Notes To Debug

```js
response Response {
  status: 200,
  statusText: 'OK',
  headers: Headers {
    server: 'nginx',
    'content-type': 'application/vnd.api+json',
    'content-length': '812',
    connection: 'keep-alive',
    'cache-control': 'must-revalidate, no-cache, private',
    date: 'Wed, 19 Jun 2024 06:01:08 GMT',
    'x-drupal-dynamic-cache': 'UNCACHEABLE',
    'content-language': 'en',
    'x-content-type-options': 'nosniff',
    'x-frame-options': 'SAMEORIGIN',
    'x-drupal-cache-tags': 'config:jsonapi_extras.settings config:jsonapi_image_styles.settings config:jsonapi_resource_config_list config:system.logging http_response',
    'x-drupal-cache-contexts': 'url.path url.query_args:fields url.query_args:include url.query_args:page url.site user.permissions',
    'x-drupal-cache-max-age': '0 (Uncacheable)',
    expires: 'Sun, 19 Nov 1978 05:00:00 GMT',
    'x-generator': 'Drupal 10 (https://www.drupal.org)',
    'access-control-allow-origin': '*'
  },
  body: ReadableStream { locked: false, state: 'readable', supportsBYOB: true },
  bodyUsed: false,
  ok: true,
  redirected: false,
  type: 'basic',
  url: 'http://ddev-apiplatform-web/api/exercise/slug?filter[field_language]=2&filter[field_level]=12&filter[field_block]=48&filter[field_
unit]=40&filter[field_tab]=26&filter[field_weight]=1'
}

{
  jsonapi: { version: '1.0', meta: { links: [Object] } },
  data: [],
  meta: {
    omitted: {
      detail: 'Some resources have been omitted because of insufficient authorization.',
      links: [Object]
    }
  },
  links: {
    self: {
      href: 'http://ddev-apiplatform-web/api/exercise/slug?filter%5Bfield_language%5D=2&filter%5Bfield_level%5D=12&filter%5Bfield_block%5D=48&filter%5Bfield_unit%5D=40&filter%5Bfield_tab%5D=26&filter%5Bfield_weight%5D=1'
    }
  }
}


{
  help: {
    href: 'https://www.drupal.org/docs/8/modules/json-api/filtering#filters-access-control'
  },
  'item--PtLxZyV': {
    href: 'http://ddev-apiplatform-web/en/api/exercise/intro/f55d8627-6b3c-4732-a914-91762c0aea1e',
    meta: {
      rel: 'item',
      detail: 'The current user is not allowed to GET the selected resource.'
    }
  }
}

http://ddev-apiplatform-web/api/exercise/slug?filter[field_language]=2&filter[field_level]=12&filter[field_block]=48&filter[field_unit]=40&filter[field_tab]=26&filter[field_weight]=1

{
  user: {
    uid: '19',
    name: 'silsa3@uv.es',
    roles: [ 'authenticated', 'student' ],
    uuid: 'e6ae9f59-661f-4980-ba41-05936dfe0a50',
    picture: ''
  },
  jwt: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3MTg3NzY3MDQsImV4cCI6MTcyMTM2ODcwNCwiZHJ1cGFsIjp7InVpZCI6IjE5In19.acB1HIxY1JQB9oEjYbwCIpiY61q8vCxBKOxmG1kO72bg6ygMaDAV7_0tXfAqKzZdfOFQZpFpWnnAWirB2g_0c1hj01lKMkYYwUUJj9Uj0zuToJlpSmdhb-qumLjZzpEk5G_Uu0YxqRSRgU6EovZ-eC641SUgCZPwSDZ-8TVYHnKvxKFxmfjT4S6TuAajgsgpvxMhTrtj1uFZyGg7nNfjVvQsvZ2aiyoyVk5_hmRoK1wxLfSVNlV0s_NPBybguS8BWv0ELfpW6Fy9fCiCufJSd9RpwEu87W4EtleFDu8sxMdw1VPahix5v5dhwrNGF8ijiXWPicxXlGQIaCJf06lxpQ'
}


## Classroom
/api/enrollment/enrollment?include=field_classroom.field_classroom_hub.field_language,field_classroom.field_level,field_classroom.field_teacher_s_,field_exam_results,field_final_exam_results,field_classroom.field_teacher_s_.user_picture,field_classroom.field_banner_1.field_media_image,field_classroom.field_banner_2.field_media_image&filter[field_classroom.drupal_internal__id]=31&filter[field_student.drupal_internal__uid]=19
```