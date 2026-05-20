# Evidencia de Hosting Verde

Usa esta referencia cuando una revision incluya dominios publicos, frontend web, APIs publicas, CDN o preguntas explicitas sobre hosting verde.

## Check Recomendado

Consultar The Green Web Foundation Greencheck API:

```text
GET https://api.thegreenwebfoundation.org/api/v3/greencheck/{hostname}
```

Normaliza el dominio antes de consultar:

- `https://example.com/app` -> `example.com`
- `api.example.com/v1` -> `api.example.com`

## Criterio de Revision

Trata el resultado como evidencia externa, no como certificacion:

- `green`: evidencia registrada para el dominio.
- `grey` o `not green`: no hay evidencia registrada en la fuente consultada.
- `unknown`: no se pudo verificar.

Eleva la severidad si un dominio `grey` corresponde a una ruta con alto trafico, CDN principal, API intensiva o workload siempre encendido. Mantenerlo como informativo si el dominio es accesorio o de bajo volumen.

## Formato de Hallazgo

```text
[INTENSIDAD DE CARBONO] Evidencia de hosting verde
Severidad: Informativa / Baja / Media
Problema: El dominio consultado no tiene evidencia registrada de hosting verde o el alcance es incompleto.
Sugerencia: Verificar proveedor, region, CDN y dominios relacionados; usar el resultado como insumo parcial para SCI.
```

## Limites

No concluyas que el sistema completo es verde por un solo dominio con resultado `green`.

El check no cubre necesariamente:

- backend privado;
- bases de datos;
- colas y jobs;
- APIs de terceros;
- modelos IA/ML;
- regiones cloud internas;
- carbono incorporado;
- consumo real de energia.
