# Revisión por Dominio

Usa esta referencia para elegir preguntas de revisión según el tipo de cambio.

## API y Backend

- ¿Hay payloads con campos no usados?
- ¿Hay paginación, límites y filtros?
- ¿Se puede evitar polling con eventos, webhooks o colas?
- ¿Hay trabajo pesado en la ruta crítica?
- ¿Existe caché para respuestas estables?

## Bases de Datos

- ¿Hay consultas N+1?
- ¿Faltan índices en filtros, joins u ordenamientos frecuentes?
- ¿Se leen filas o columnas innecesarias?
- ¿Hay retención de datos sin propósito claro?
- ¿La agregación se hace donde minimiza movimiento de datos?

## Infraestructura Cloud

- ¿La capacidad está alineada con uso real?
- ¿La carga puede escalar a cero?
- ¿La región elegida equilibra latencia, cumplimiento, costo y carbono?
- ¿La carga tolera spot/preemptible?
- ¿Los jobs batch pueden moverse a ventanas de menor carbono?

## Pipelines de Datos

- ¿Se reprocesa todo cuando bastaría incremental?
- ¿Hay particiones según patrones de consulta?
- ¿Se comprimen datos y se evita transferencia innecesaria?
- ¿La frecuencia del pipeline corresponde con valor de negocio real?

## IA y ML

- ¿El modelo es proporcional a la tarea?
- ¿Hay límites de tokens, iteraciones y llamadas a herramientas?
- ¿Se cachean embeddings, retrieval o respuestas determinísticas?
- ¿Se cuenta toda la cascada en flujos agénticos?
- ¿Los aceleradores están bien utilizados o quedan inactivos?
