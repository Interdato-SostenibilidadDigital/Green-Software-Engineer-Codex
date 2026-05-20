# Guía de Codex

Esta guía explica cómo usar las skills de Green Software Engineer dentro de Codex para revisar, diseñar y medir software con criterios de sostenibilidad.

## 🧭 Vista rápida

| Quieres... | Usa... | Resultado esperado |
| --- | --- | --- |
| Evaluar una decisión técnica | `$green-software-engineer` | Recomendación directa, tradeoffs y supuestos. |
| Revisar código o infraestructura | `$green-review` | Hallazgos priorizados por impacto probable de carbono. |
| Estimar o preparar medición | `$green-software-engineer` | Frontera SCI, unidad funcional, datos faltantes y plan de medición. |
| Auditar IA/ML o agentes | Ambas, según contexto | Revisión de tokens, fanout, herramientas, caché, entrenamiento e inferencia. |
| Validar hosting verde | `$green-review` o script `tools/green-hosting-check.ps1` | Evidencia externa por dominio desde The Green Web Foundation. |

## 🌱 Propósito

Este paquete añade dos modos reutilizables de trabajo para ingeniería de software verde en Codex:

- Asesoría y diseño con `$green-software-engineer`.
- Revisión estructurada con `$green-review`.

Ambas skills están pensadas para proyectos reales, donde la sostenibilidad debe convivir con rendimiento, costo, confiabilidad, cumplimiento y experiencia de usuario.

## 🧩 Casos de uso por dominio

| Dominio | Qué revisar |
| --- | --- |
| Backend, APIs y microservicios | Rutas calientes, payloads, paginación, round trips, trabajo síncrono pesado, polling, caché y límites de concurrencia. |
| Bases de datos | Consultas N+1, scans grandes, índices faltantes, lecturas sin límite, columnas innecesarias, retención excesiva y formatos poco eficientes. |
| Cloud e infraestructura | Sobreaprovisionamiento, servicios siempre encendidos, autoscaling, scale-to-zero, regiones cloud, capacidad spot/preemptible y jobs movibles en el tiempo. |
| Pipelines de datos | ETL, streaming, procesamiento incremental, particionado, compresión, frecuencia de jobs y reprocesamiento innecesario. |
| IA y ML | LLMs, RAG, agentes, embeddings, inferencia, entrenamiento, evaluación, fanout de herramientas, presupuestos de tokens y uso de GPU/TPU. |
| Web y media | Tráfico alto, assets pesados, imágenes, video, bundles grandes, exceso de JavaScript y transferencia de datos innecesaria. |
| Hosting verde | Evidencia Green Web por dominio, proveedor detectado, documentos de soporte y límites del alcance. |
| Arquitectura y ADRs | Comparación de alternativas por carbono, costo, latencia, confiabilidad, complejidad y cumplimiento. |

## ✅ Cuándo usarlo

El paquete aporta más cuando:

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

## 🧠 Cuándo usar `$green-software-engineer`

Usa esta skill cuando necesites una opinión técnica más profunda:

| Situación | Ejemplo de prompt |
| --- | --- |
| Comparar arquitectura | `Usa $green-software-engineer para comparar polling, webhooks y eventos para este flujo.` |
| Crear línea base SCI | `Ayúdame a definir la frontera SCI y unidad funcional de este servicio API.` |
| Revisar IA/ML | `Evalúa el SCI de consumidor de este flujo RAG con llamadas a herramientas.` |
| Decidir cloud/infra | `Compara estas opciones de autoscaling y scale-to-zero con tradeoffs de carbono.` |

La respuesta debería empezar con una recomendación clara y después explicar razonamiento, supuestos y tradeoffs.

## 🔎 Cuándo usar `$green-review`

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

## 📚 Referencias internas

| Skill | Archivo | Uso |
| --- | --- | --- |
| `$green-software-engineer` | `references/sci-baseline.md` | Frontera, unidad funcional, energía, intensidad de carbono, carbono incorporado y supuestos. |
| `$green-software-engineer` | `references/domain-guides.md` | Backend, bases de datos, cloud, infraestructura, pipelines, web/media y arquitectura general. |
| `$green-software-engineer` | `references/ai-ml-carbon.md` | LLMs, RAG, agentes, inferencia, entrenamiento, embeddings y aceleradores. |
| `$green-software-engineer` | `references/green-hosting-evidence.md` | Evidencia de hosting verde por dominio y relación con SCI. |
| `$green-review` | `references/review-severity.md` | Severidad, priorización y prevención de greenwashing técnico. |
| `$green-review` | `references/review-domains.md` | Preguntas de revisión por dominio. |
| `$green-review` | `references/green-hosting-evidence.md` | Formato de hallazgo y límites de la verificación Green Web. |

## 🧾 Formato esperado de revisión

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

Si no hay problemas materiales, la skill debe decirlo claramente y nombrar cualquier brecha residual de medición.

## 📊 Criterios de severidad

| Severidad | Cuándo aplica |
| --- | --- |
| Alta | Ruta caliente, alto volumen, infraestructura siempre encendida, muchos datos, aceleradores/modelos grandes o impacto también en costo, latencia o confiabilidad. |
| Media | Impacto relevante que debería abordarse en el sprint o iteración actual. |
| Baja | Ineficiencia menor o mejora oportunista con bajo riesgo. |
| Informativa | Evidencia contextual, como resultado Green Web, que ayuda a medir o decidir pero no implica por sí sola un problema material. |
| Ya verde | Patrón materialmente eficiente que conviene preservar. |

La severidad baja si el cambio es poco frecuente, de bajo volumen, fuera de rutas críticas o depende de supuestos débiles.

## 🧮 Medición SCI

Cuando el usuario necesite medición, usa:

```text
SCI = ((E * I) + M) / R
```

| Variable | Significado |
| --- | --- |
| `E` | Energía consumida por el software. |
| `I` | Intensidad de carbono de la electricidad. |
| `M` | Emisiones incorporadas asignadas al software. |
| `R` | Unidad funcional: solicitud, usuario, transacción, workflow, token, imagen, segundo de audio/video, etc. |

Una buena respuesta debe explicar la frontera de medición, la unidad funcional, los datos faltantes, los supuestos y el nivel de incertidumbre.

## 🌐 Verificación de hosting verde

Cuando exista un dominio público, Codex puede usar The Green Web Foundation Greencheck API como evidencia externa:

```text
GET https://api.thegreenwebfoundation.org/api/v3/greencheck/{hostname}
```

También puedes ejecutar el script local:

```powershell
.\tools\green-hosting-check.ps1 app.example.com api.example.com
```

Formato recomendado de interpretación:

```text
[INTENSIDAD DE CARBONO] Evidencia de hosting verde
Resultado: green / grey / unknown
Fuente: The Green Web Foundation Greencheck API
Interpretación: evidencia parcial para el dominio consultado; no certifica el sistema completo.
```

Usa este resultado como insumo para infraestructura y SCI, especialmente para el componente `I`. No reemplaza medición de energía, región, utilización, carbono incorporado, backend privado, bases de datos, terceros o IA/ML.

## 🛡️ Regla anti-greenwashing

No afirmes que una alternativa es más verde solo por su categoría. Serverless, edge, servicios administrados, regiones de baja intensidad o modelos más pequeños deben evaluarse con volumen, utilización, latencia, retención, intensidad de carbono y frontera de medición.

## 🏷️ Uso del distintivo

El distintivo `Software Verde Revisado` es una auto-declaración que un equipo puede mostrar cuando ha usado este paquete de skills para revisar un sistema, documentar sus decisiones y gestionar los hallazgos relevantes.

```markdown
[![Software Verde Revisado](https://raw.githubusercontent.com/Interdato-SostenibilidadDigital/Green-Software-Engineer-Codex/main/docs/assets/interdato-green-software-reviewed.svg)](https://github.com/Interdato-SostenibilidadDigital/Green-Software-Engineer-Codex)
```

Antes de usarlo, valida:

- Qué sistema, servicio, flujo o versión fue revisado.
- Qué skill se usó y con qué alcance.
- Qué hallazgos se encontraron y cómo se gestionaron.
- Qué supuestos, datos faltantes o límites de medición permanecen.
- Que el claim no se presenta como certificación oficial, auditoría externa o garantía de neutralidad de carbono.

La responsabilidad por el uso correcto del distintivo recae en quien lo publica. El distintivo no sustituye medición, evidencia, revisión independiente ni cumplimiento formal cuando el contexto lo requiera.

## 🔗 Referencias externas

- Green Software Patterns: https://patterns.greensoftware.foundation
- Especificación SCI: https://sci.greensoftware.foundation
- Especificación SCI for AI: https://github.com/Green-Software-Foundation/sci-ai/blob/dev/SPEC.md
- Principios GSF: https://learn.greensoftware.foundation/practitioner/carbon-efficiency
- The Green Web Foundation Greencheck API: https://developers.thegreenwebfoundation.org/api/greencheck/v3/check-single-domain/
