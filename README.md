# Paquete de Skills de Codex para Ingeniería de Software Verde

Paquete de skills para que Codex trabaje con criterios de ingeniería de software
verde, eficiencia energética, reducción de impacto de carbono y medición SCI.

El objetivo no es añadir una capa cosmética de sostenibilidad, sino ayudar a tomar
mejores decisiones de ingeniería: menos trabajo innecesario, menos datos movidos,
mejor utilización de infraestructura, medición más clara y tradeoffs explícitos.

Este paquete aplica prácticas ampliamente aceptadas de ingeniería de software verde y criterios alineados con Green Software Foundation. Las recomendaciones deben validarse con medición, contexto de uso y tradeoffs técnicos antes de considerarse óptimas.

## Skills Incluidas

- `$green-software-engineer`: asesoría técnica para arquitectura baja en carbono,
  Green Software Foundation, Software Carbon Intensity, IA/ML, cloud, bases de
  datos, pipelines y decisiones de diseño.
- `$green-review`: revisión estructurada para detectar hotspots de carbono en
  código, infraestructura, APIs, bases de datos, jobs, pipelines, caché e IA/ML.

## Instalación

Instalación local en un proyecto:

```text
mi-proyecto/
`-- .codex/
    `-- skills/
        |-- green-software-engineer/
        |   |-- SKILL.md
        |   |-- agents/openai.yaml
        |   `-- references/
        |       |-- ai-ml-carbon.md
        |       |-- domain-guides.md
        |       `-- sci-baseline.md
        `-- green-review/
            |-- SKILL.md
            |-- agents/openai.yaml
            `-- references/
                |-- review-domains.md
                `-- review-severity.md
```

Instalación global:

```text
~/.codex/skills/
|-- green-software-engineer/
`-- green-review/
```

## Uso Rápido

Invoca la skill por nombre:

```text
Usa $green-software-engineer para comparar polling y webhooks desde una perspectiva de software verde.
```

```text
Usa $green-review para auditar este servicio Terraform por sobreaprovisionamiento.
```

## Casos de Uso

Este paquete es útil para:

- Revisar APIs, servicios backend y microservicios con alto volumen de solicitudes.
- Detectar consultas ineficientes, N+1, lecturas sin límite y problemas de retención de datos.
- Auditar infraestructura cloud, Terraform, Kubernetes y servicios siempre encendidos.
- Evaluar jobs batch, colas, cron jobs, ETL, streaming y pipelines de datos.
- Diseñar estrategias de caché, batching, autoscaling y scale-to-zero.
- Comparar alternativas de arquitectura considerando carbono, costo, latencia y confiabilidad.
- Crear una línea base SCI para medir impacto por solicitud, transacción, usuario, workflow o token.
- Revisar sistemas de IA/ML: LLMs, RAG, agentes, embeddings, inferencia, entrenamiento y uso de GPU/TPU.
- Optimizar aplicaciones web con mucho tráfico, assets pesados, imágenes, video o alto uso de red.
- Preparar revisiones técnicas, ADRs o discusiones de arquitectura con criterios de sostenibilidad.

## Alcance

No está limitado a un lenguaje, framework o proveedor cloud específico. Puede ayudar
en casi cualquier tipo de software, pero aporta más valor cuando el sistema consume
infraestructura, procesa datos, mueve tráfico de red, ejecuta trabajos repetidos o
usa IA/ML.

En cambios puramente visuales, documentación, pruebas unitarias pequeñas o scripts
de uso ocasional, el impacto de carbono suele ser bajo. En esos casos la skill puede
ser útil para confirmar que no hay problemas materiales, pero probablemente no sea
necesaria como revisión profunda.

## Qué Cubre

- Los 8 principios de Green Software Foundation.
- Software Carbon Intensity: `SCI = ((E * I) + M) / R`.
- Guía para crear líneas base SCI y documentar supuestos.
- SCI de consumidor y proveedor para sistemas de IA.
- Revisión por dominio: backend, APIs, bases de datos, cloud, pipelines, web/media e IA/ML.
- Criterios de severidad para priorizar hallazgos por impacto probable.
- Caché, batching, scale-to-zero, planificación sensible al carbono y demand shaping.

## Principio de Trabajo

El paquete evita asumir que una solución es más verde por etiqueta. Serverless,
edge, servicios administrados, regiones cloud específicas o modelos más pequeños
pueden ser buenas opciones, pero dependen de volumen, utilización, latencia,
retención de datos, intensidad de carbono y frontera de medición.

Consulta [docs/codex-guide.md](docs/codex-guide.md) para más detalles de uso.
