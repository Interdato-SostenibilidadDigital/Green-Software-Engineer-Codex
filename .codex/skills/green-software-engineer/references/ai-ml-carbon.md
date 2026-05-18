# Carbono en IA y ML

Usa esta referencia para sistemas con LLMs, RAG, agentes, inferencia, entrenamiento o evaluación.

## Frontera

- SCI de consumidor: inferencia, serving, orquestación, herramientas, RAG, almacenamiento, observabilidad y UX.
- SCI de proveedor: entrenamiento, preparación de datos, evaluación, despliegue, integración y retiro.
- En flujos agénticos, contar cada operación disparada: modelo, herramienta, búsqueda, recuperación, reranking, base de datos y servicio externo.

## Unidades Funcionales

- LLM: por token, solicitud o workflow, según la decisión que se compare.
- Agentes: por ejecución de workflow.
- RAG: por respuesta, incluyendo retrieval, embeddings, reranking y generación.
- Imagen: por imagen.
- Audio/video: por segundo.
- ML clásico: por inferencia.
- Entrenamiento: por FLOP, token de entrenamiento, parámetro o experimento.

## Optimizaciones Prácticas

- Usar clasificación o modelo pequeño antes de escalar a modelos grandes.
- Definir presupuestos de tokens, llamadas a herramientas e iteraciones.
- Deduplicar contexto y documentos recuperados.
- Cachear embeddings y resultados determinísticos.
- Reutilizar evaluaciones cuando no cambian datos, prompts ni modelo.
- Apagar GPUs/TPUs inactivas y mejorar utilización por batching.
- Medir calidad junto con carbono para evitar optimizaciones que degraden utilidad.

## Riesgos Comunes

- Contar solo la llamada final al modelo e ignorar RAG/herramientas.
- Reportar emisiones de entrenamiento solo del checkpoint final.
- Usar valores brutos cuando valores efectivos representan mejor pruning, deduplicación o utilización.
- Cambiar a un modelo más pequeño sin medir precisión, seguridad o tasa de reintentos.
