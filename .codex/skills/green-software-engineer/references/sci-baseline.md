# Línea Base SCI

Usa esta guía cuando el usuario quiera medir, estimar o justificar impacto de carbono.

## Flujo

1. Define la frontera del sistema: servicios, jobs, bases de datos, colas, almacenamiento, red, observabilidad, herramientas externas y llamadas a modelos.
2. Define la unidad funcional `R`: por solicitud, transacción, usuario activo, workflow, token, imagen, inferencia, GB procesado o job completado.
3. Estima o mide energía `E`: métricas cloud, telemetría de hardware, uso CPU/GPU, duración, memoria, I/O y utilización.
4. Selecciona intensidad `I`: usa región y ventana temporal reales cuando existan; si no, documenta el supuesto.
5. Asigna carbono incorporado `M`: reparte fabricación y retiro de hardware según uso, tiempo, capacidad o una regla explícita.
6. Calcula `SCI = ((E * I) + M) / R`.
7. Documenta supuestos, incertidumbre, fuente de datos y qué cambio se comparará contra la línea base.

## Buenas Prácticas

- Medir primero rutas calientes, cargas de alto volumen y servicios siempre encendidos.
- Separar operación normal, picos, jobs batch y entrenamiento/inferencia de IA.
- Comparar alternativas con la misma unidad funcional.
- Evitar precisión falsa: si los datos son aproximados, reportar rangos.
- Recomendar instrumentación cuando la incertidumbre impida priorizar.

## Señales de Que SCI Vale la Pena

- Alto volumen de solicitudes o procesamiento.
- Infraestructura dedicada o siempre encendida.
- Uso de GPU/TPU, modelos grandes o pipelines de datos intensivos.
- Costos cloud relevantes.
- Decisiones de arquitectura con varias alternativas viables.
