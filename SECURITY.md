# Seguridad

Para comunicar una vulnerabilidad, escribe a **contacto@interdato.com** con el repositorio, la versión o commit afectado, el impacto y pasos mínimos para reproducirla. No publiques credenciales, datos personales ni pruebas con información sensible en issues o pull requests públicos.

## Controles de este repositorio

- El workflow **Security** busca secretos en el historial git disponible en cada push y pull request; también puede ejecutarse manualmente y semanalmente.
- El escáner se descarga en una versión fija y se comprueba su SHA-256 antes de ejecutarlo. Sus resultados ocultan los valores detectados.
- Los nuevos controles de CI usan permisos de lectura y no reciben claves de servicios externos.
- Dependabot propone actualizaciones semanales de las acciones de GitHub. Las propuestas requieren revisión; no se fusionan automáticamente.

Estos controles detectan clases concretas de problemas y no sustituyen una revisión del cambio, los permisos de la cuenta o la configuración del hosting. El estado verde de CI no es una certificación de seguridad.

## Alcance

Las skills son instrucciones para Codex, no una garantía sobre el código que revise o genere. Revisa los cambios antes de aplicarlos o desplegarlos. `tools/green-hosting-check.ps1` consulta por HTTPS la API pública de The Green Web Foundation; no requiere credenciales. No añadas secretos o datos de clientes a ejemplos, prompts ni archivos versionados.
