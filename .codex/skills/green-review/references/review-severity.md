# Severidad de Revisión Verde

Usa esta guía para priorizar hallazgos por impacto probable, no por elegancia técnica.

## Alta

Marcar como alta si una o más condiciones aplican:

- Ruta caliente con alto volumen o crecimiento esperado.
- Servicio siempre encendido con baja utilización.
- Consulta, job o pipeline que procesa grandes volúmenes sin límites claros.
- Uso de GPU/TPU, LLMs o modelos grandes sin presupuesto, caché o justificación.
- Transferencia de datos grande, frecuente o evitable.
- Sobreaprovisionamiento cloud material o falta de autoscaling en carga variable.
- Problema que también afecta costo, latencia o confiabilidad de forma significativa.

## Media

Marcar como media si:

- El impacto es repetitivo pero no claramente crítico.
- Hay una alternativa razonable con costo de implementación moderado.
- El volumen puede crecer y conviene corregir ahora.
- Falta medición, pero los indicios de desperdicio son fuertes.

## Baja

Marcar como baja si:

- El cambio está fuera de rutas calientes.
- El volumen es bajo o es una tarea poco frecuente.
- La corrección es útil pero no urgente.
- El beneficio depende de supuestos todavía débiles.

## Ya Verde

Usar cuando el patrón ya está bien optimizado:

- Paginación, límites y selección de campos claros.
- Caché con TTL e invalidación razonables.
- Autoscaling o scale-to-zero bien configurado.
- Procesamiento incremental o batch justificado.
- Presupuestos de tokens, llamadas e iteraciones en IA.

## Regla Anti-Greenwashing

No afirmar que serverless, edge, managed services, una región específica o un modelo más pequeño son más verdes por defecto. Pedir o declarar supuestos sobre volumen, utilización, intensidad de carbono, latencia, retención de datos y frontera de medición.
