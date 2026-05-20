# Evidencia de Hosting Verde

Usa esta referencia cuando el usuario proporcione un dominio publico, pregunte si un sitio usa hosting verde o quiera complementar una linea base SCI con evidencia externa de infraestructura.

## Fuente Recomendada

Usa The Green Web Foundation Greencheck API como fuente externa:

```text
GET https://api.thegreenwebfoundation.org/api/v3/greencheck/{hostname}
```

El `hostname` debe enviarse sin protocolo, puerto ni path:

- Correcto: `example.com`
- Incorrecto: `https://example.com/app`

## Como Interpretar

- `green: true`: hay evidencia registrada de hosting verde para el dominio consultado.
- `green: false`: no se encontro evidencia de hosting verde en la fuente consultada.
- `unknown`: no se pudo consultar, el dominio no es valido o la fuente no respondio.

Campos utiles:

- `hosted_by`: proveedor detectado.
- `hosted_by_website`: sitio del proveedor.
- `modified`: fecha de actualizacion del dato.
- `supporting_documents`: evidencia asociada cuando existe.

## Relacion con SCI

La verificacion de hosting verde puede informar el componente `I` de SCI:

```text
SCI = ((E * I) + M) / R
```

Pero no reemplaza:

- medicion de energia real (`E`);
- seleccion de unidad funcional (`R`);
- carbono incorporado (`M`);
- datos de region, utilizacion o carga;
- medicion de backend privado, bases de datos, colas, CDNs, terceros o IA/ML.

## Regla Anti-Greenwashing

No afirmes que un sistema completo es verde solo porque un dominio devuelve `green: true`.

Formula prudente:

```text
El dominio consultado tiene evidencia de hosting verde segun The Green Web Foundation.
Este resultado es evidencia parcial de infraestructura y no certifica el sistema completo.
```

## Salida Recomendada

```text
[INTENSIDAD DE CARBONO] Evidencia de hosting verde
Resultado: green / grey / unknown
Dominio: example.com
Proveedor detectado: ...
Fuente: The Green Web Foundation Greencheck API
Interpretacion: Evidencia parcial para infraestructura; no reemplaza SCI completo.
Siguiente paso: revisar dominios adicionales, region, proveedor cloud, backend, datos e IA/ML.
```
