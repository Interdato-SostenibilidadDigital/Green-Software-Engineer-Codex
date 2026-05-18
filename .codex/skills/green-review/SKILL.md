---
name: green-review
description: Skill de revisión estructurada de software verde para código, arquitectura, configuración cloud, pipelines de datos, acceso a bases de datos, trabajos en segundo plano, caché y cargas IA/ML. Usar cuando el usuario pida una revisión verde, revisión de sostenibilidad, revisión de carbono, auditoría de eficiencia de carbono o revisión alineada con GSF. Usar también al revisar cambios de backend/API/base de datos/infraestructura por impacto en energía, red, cómputo, almacenamiento, cloud, hardware o SCI. No usar para cambios solo de UI, documentación o tests, salvo que se pida explícitamente evaluar sostenibilidad.
---

# Revisión Verde

Realiza una revisión de sostenibilidad alineada con los principios de Green Software Foundation. Enfócate en impacto material de carbono, correcciones prácticas de ingeniería y evitar falsos positivos.

## Referencias Operativas

Carga referencias solo cuando hagan falta para la revisión:

- Lee `references/review-severity.md` para calibrar severidad, evitar greenwashing y distinguir hallazgos de alto, medio y bajo impacto.
- Lee `references/review-domains.md` para adaptar la revisión al dominio: API/backend, bases de datos, cloud, pipelines de datos o IA/ML.

## Alcance de Revisión

Revisa el código, arquitectura o configuración relevante para detectar:

- Eficiencia energética: loops ajustados, cómputo eager, trabajo redundante, operaciones costosas en rutas críticas, polling innecesario y trabajo que podría agruparse, diferirse, cachearse o hacerse event-driven.
- Eficiencia de red: payloads sobredimensionados, falta de paginación, falta de selección de campos, transferencia innecesaria de datos, round trips evitables, APIs demasiado conversacionales, brechas de compresión y ausencia de CDN o caché edge para contenido cacheable.
- Cómputo y almacenamiento: consultas N+1, índices faltantes, lecturas sin límite, cómputo repetido, estrategia de caché deficiente, formatos de almacenamiento ineficientes, retención excesiva y volumen innecesario de logs o telemetría.
- Cloud e infraestructura: sobreaprovisionamiento, servicios siempre encendidos e inactivos, falta de autoscaling o scale-to-zero, regiones cloud de alta intensidad de carbono, jobs batch que podrían desplazarse en el tiempo y cargas interrumpibles que podrían usar capacidad spot o preemptible.
- Hardware y carbono incorporado: baja utilización, VMs autogestionadas innecesarias, aceleradores inactivos y hardware desproporcionado para la carga.
- IA y ML: frontera SCI de consumidor vs proveedor, elección de unidad funcional, cascadas agénticas, fanout de herramientas/modelos/recuperación, inferencia o embeddings sin caché, alcance de entrenamiento, valores efectivos vs brutos y utilización de aceleradores.

## Guía SCI

Usa esta fórmula cuando la medición o línea base sea relevante:

```text
SCI = ((E * I) + M) / R
```

- `E`: energía consumida por el software.
- `I`: intensidad de carbono de la electricidad.
- `M`: emisiones incorporadas asignadas al software.
- `R`: unidad funcional.

Para cargas de IA:

- Las unidades funcionales de SCI de consumidor incluyen por token, ejecución de flujo de trabajo, imagen, segundo de audio/video, carácter o inferencia según la modalidad.
- Las unidades funcionales de SCI de proveedor incluyen por FLOP, token de entrenamiento o parámetro.
- La IA agéntica debe contar todas las operaciones disparadas, incluidas llamadas a submodelos, invocaciones de herramientas, pasos de recuperación y llamadas a servicios posteriores.
- Las emisiones de entrenamiento deben incluir el proceso completo de entrenamiento, no solo la ejecución final exitosa.

## Formato de Salida

Para cada problema material, produce:

```text
[PRINCIPIO] Título breve
Severidad: Alta / Media / Baja
Problema: Una frase que describe la ineficiencia.
Sugerencia: Corrección concreta o alternativa recomendada.
```

Luego agrega una sección `Resumen` con:

- Total de problemas por severidad.
- El cambio de mayor prioridad que más reduciría el impacto de carbono.
- Si valdría la pena crear una línea base SCI.

Si el código o diseño ya está bien optimizado, dilo claramente. No inventes hallazgos para que la revisión parezca útil.

## Guía de Severidad

- Alta: impacto de carbono significativo o desperdicio en una ruta caliente; corregir antes de enviar cuando sea práctico.
- Media: impacto relevante que debería abordarse en el sprint actual o iteración de diseño.
- Baja: ineficiencia menor o limpieza que conviene hacer de forma oportunista.
- Ya Verde: patrón materialmente bien optimizado que debe preservarse.

Eleva la severidad si el problema ocurre en una ruta caliente, escala con volumen, usa infraestructura siempre encendida, mueve muchos datos, usa aceleradores o modelos grandes, o también empeora costo, latencia o confiabilidad.

Reduce la severidad si el cambio es poco frecuente, de bajo volumen, fuera de rutas críticas o si la mejora depende de supuestos débiles.

## Comportamiento de Revisión

- Prefiere correcciones específicas sobre consejos genéricos.
- Incluye el principio GSF relevante en cada hallazgo.
- Menciona tradeoffs con honestidad, especialmente en latencia, costo, confiabilidad, complejidad y experiencia de usuario.
- Ordena los hallazgos por impacto probable de carbono.
- Recomienda medición cuando el impacto sea incierto o la carga tenga alto volumen.
- Omite categorías que claramente no apliquen.
- No asumas que serverless, edge, servicios administrados, una región específica o un modelo más pequeño son automáticamente más verdes; declara los supuestos o pide medición cuando falten datos.

## Referencias

- Green Software Patterns: https://patterns.greensoftware.foundation
- Especificación SCI: https://sci.greensoftware.foundation
- Especificación SCI for AI: https://github.com/Green-Software-Foundation/sci-ai/blob/dev/SPEC.md
- Principios GSF: https://learn.greensoftware.foundation/practitioner/carbon-efficiency
