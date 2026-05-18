# Guía de Codex

## Propósito

Este paquete añade dos modos reutilizables de trabajo para ingeniería de software
verde en Codex:

- Asesoría y diseño con `$green-software-engineer`.
- Revisión estructurada con `$green-review`.

Ambas skills están pensadas para proyectos reales, donde la sostenibilidad debe
convivir con rendimiento, costo, confiabilidad, cumplimiento y experiencia de
usuario.

## Casos de Uso

### Backend, APIs y Microservicios

Usa el paquete para revisar rutas calientes, payloads, paginación, round trips,
trabajo síncrono pesado, polling, caché y límites de concurrencia.

### Bases de Datos

Úsalo para detectar consultas N+1, scans grandes, índices faltantes, lecturas sin
límite, columnas innecesarias, retención excesiva y formatos poco eficientes.

### Cloud e Infraestructura

Úsalo para revisar sobreaprovisionamiento, servicios siempre encendidos, autoscaling,
scale-to-zero, regiones cloud, capacidad spot/preemptible y jobs que pueden moverse
a ventanas de menor carbono.

### Pipelines de Datos

Úsalo para ETL, streaming, procesamiento incremental, particionado, compresión,
frecuencia de jobs y reprocesamiento innecesario.

### IA y ML

Úsalo para LLMs, RAG, agentes, embeddings, inferencia, entrenamiento, evaluación,
fanout de herramientas, presupuestos de tokens, límites de iteraciones y uso de
GPU/TPU.

### Web y Media

Úsalo cuando una aplicación web tenga mucho tráfico, assets pesados, imágenes,
video, bundles grandes, exceso de JavaScript o transferencia de datos innecesaria.

### Arquitectura y ADRs

Úsalo para comparar alternativas de diseño y documentar tradeoffs de carbono,
costo, latencia, confiabilidad, complejidad y cumplimiento.

## ¿Sirve para Todo Tipo de Software?

Puede aplicarse a muchos tipos de software porque los principios son transversales:
usar menos energía, mover menos datos, aprovechar mejor hardware, medir antes de
optimizar y elegir una unidad funcional clara.

Pero no todos los proyectos obtienen el mismo valor. El paquete aporta más cuando:

- Hay alto volumen de uso.
- Existe infraestructura cloud o servidores persistentes.
- Se procesan muchos datos.
- Hay tráfico de red significativo.
- Hay jobs repetidos o pipelines.
- Se usan LLMs, modelos de IA, GPUs o TPUs.
- Hay decisiones de arquitectura con varias alternativas viables.

El paquete aporta menos cuando:

- El cambio es solo documentación.
- El cambio es solo UI visual sin impacto en assets, red o rendimiento.
- Son tests pequeños sin efecto en producción.
- Es un script de uso único o muy ocasional.
- No hay información suficiente sobre volumen, utilización o entorno.

## Cuándo Usar `$green-software-engineer`

Usa esta skill cuando necesites una opinión técnica más profunda:

- Decisiones de arquitectura sensibles al carbono.
- Explicación de principios de Green Software Foundation.
- Selección de unidades funcionales para SCI.
- Creación de una línea base SCI.
- Planificación de SCI de consumidor o proveedor en IA/ML.
- Decisiones sobre región cloud, autoscaling, batching, caché o planificación de cargas.
- Revisión de sostenibilidad de una funcionalidad, servicio o arquitectura.

Ejemplo:

```text
Usa $green-software-engineer para estimar el SCI de consumidor de nuestro servicio API con LLM.
```

## Cuándo Usar `$green-review`

Usa esta skill cuando quieras hallazgos concisos y estructurados:

- Handlers de API.
- Consultas y migraciones de bases de datos.
- Terraform, Kubernetes, Pulumi, CloudFormation u otra configuración de infraestructura.
- Trabajos en segundo plano, colas y tareas cron.
- ETL, streaming y pipelines de datos.
- Estrategias de caché.
- Inferencia de IA, recuperación de contexto y flujos agénticos.

Ejemplo:

```text
Usa $green-review para revisar este handler de API y detectar hotspots de carbono.
```

## Referencias Internas

`$green-software-engineer` incluye:

- `references/sci-baseline.md`: pasos para definir frontera, unidad funcional, energía, intensidad de carbono, carbono incorporado y supuestos.
- `references/domain-guides.md`: recomendaciones por dominio para backend, bases de datos, cloud, pipelines, web/media e IA/ML.
- `references/ai-ml-carbon.md`: guía específica para LLMs, RAG, agentes, inferencia, entrenamiento y aceleradores.

`$green-review` incluye:

- `references/review-severity.md`: criterios para priorizar hallazgos por impacto probable y evitar greenwashing técnico.
- `references/review-domains.md`: preguntas de revisión por dominio.

## Formato Esperado de Revisión

`$green-review` emite hallazgos con este formato:

```text
[PRINCIPIO] Título breve
Severidad: Alta / Media / Baja
Problema: Una frase que describe la ineficiencia.
Sugerencia: Corrección concreta o alternativa recomendada.
```

Luego resume:

- Número de hallazgos por severidad.
- Mejora de mayor prioridad.
- Si conviene crear una línea base SCI.

Si no hay problemas materiales, la skill debe decirlo claramente y nombrar cualquier
brecha residual de medición.

## Criterios de Severidad

La severidad debe subir cuando el problema:

- Está en una ruta caliente.
- Escala con volumen.
- Mantiene infraestructura siempre encendida.
- Mueve muchos datos.
- Usa GPU/TPU, LLMs o modelos grandes.
- También empeora costo, latencia o confiabilidad.

La severidad debe bajar cuando el cambio:

- Es poco frecuente.
- Tiene bajo volumen.
- Está fuera de rutas críticas.
- Depende de supuestos débiles.

## Medición SCI

Cuando el usuario necesite medición, usa:

```text
SCI = ((E * I) + M) / R
```

Donde:

- `E`: energía consumida por el software.
- `I`: intensidad de carbono de la electricidad.
- `M`: emisiones incorporadas asignadas al software.
- `R`: unidad funcional.

Una buena respuesta debe explicar la frontera de medición, la unidad funcional, los
datos faltantes, los supuestos y el nivel de incertidumbre.

## Regla Anti-Greenwashing

No se debe afirmar que una alternativa es más verde solo por su categoría. Serverless,
edge, servicios administrados, regiones de baja intensidad o modelos más pequeños
deben evaluarse con volumen, utilización, latencia, retención, intensidad de carbono
y frontera de medición.

## Referencias Externas

- Green Software Patterns: https://patterns.greensoftware.foundation
- Especificación SCI: https://sci.greensoftware.foundation
- Especificación SCI for AI: https://github.com/Green-Software-Foundation/sci-ai/blob/dev/SPEC.md
- Principios GSF: https://learn.greensoftware.foundation/practitioner/carbon-efficiency
