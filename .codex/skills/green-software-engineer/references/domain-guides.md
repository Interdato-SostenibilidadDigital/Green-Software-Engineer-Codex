# Guías por Dominio

Carga esta referencia cuando el usuario pregunte por una arquitectura o cambio concreto.

## Backend y APIs

- Preferir APIs menos conversacionales: batching, endpoints agregados o BFF cuando reduzcan round trips.
- Limitar payloads con paginación, filtros y selección de campos.
- Evitar polling frecuente; usar webhooks, colas o eventos cuando el caso lo permita.
- Cachear respuestas estables con TTLs coherentes y invalidación clara.
- Diferir trabajo pesado fuera de la ruta crítica si el usuario no necesita respuesta inmediata.

## Bases de Datos

- Buscar N+1, lecturas sin límite, índices faltantes y consultas que fuerzan scans grandes.
- Reducir transferencia de columnas no usadas.
- Usar agregaciones cerca de los datos cuando evite mover grandes volúmenes.
- Retener datos según valor real, cumplimiento y uso analítico.
- Considerar formatos columnares/comprimidos para analítica y lotes.

## Cloud e Infraestructura

- Revisar utilización antes de recomendar más capacidad o servicios dedicados.
- Preferir autoscaling y scale-to-zero cuando la carga sea variable.
- Serverless o managed no siempre es más verde: validar volumen, cold starts, región, eficiencia y utilización compartida.
- Elegir región por latencia, datos, cumplimiento y carbono; no sacrificar requisitos críticos sin decirlo.
- Usar spot/preemptible para workloads tolerantes a interrupciones.

## Pipelines de Datos

- Procesar incrementalmente cuando sea posible.
- Evitar reprocesar datasets completos por cambios pequeños.
- Agrupar trabajos cuando reduzca overhead sin romper SLA.
- Comprimir y particionar datos por patrones reales de consulta.
- Programar batch en ventanas de menor carbono si la latencia lo permite.

## Web, Frontend y Media

- Optimizar imágenes y video: tamaño correcto, formatos modernos, compresión y lazy loading.
- Evitar enviar JavaScript, datos o assets que la pantalla actual no necesita.
- Usar CDN para contenido estático cacheable.
- Medir impacto con Core Web Vitals y bytes transferidos, no solo estética.

## IA y ML

- Empezar con el modelo más pequeño que cumpla calidad y seguridad.
- Limitar tokens de entrada/salida, pasos agentic y fanout de herramientas.
- Cachear embeddings, recuperaciones y respuestas cuando sea correcto.
- Hacer batching de inferencia cuando mejore utilización sin dañar latencia crítica.
- Apagar o liberar aceleradores inactivos.
