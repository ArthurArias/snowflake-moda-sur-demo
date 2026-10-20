# Cómo contribuir

## Ciclo de un cambio
1. Abrir una incidencia que describa el problema de negocio.
2. Crear una rama desde `main`: `feature/<n>-<descripcion>`.
3. Escribir el script en la carpeta de su capa y probarlo en el esquema de trabajo de desarrollo.
4. Hacer commits pequeños con mensajes claros (`feat:`, `fix:`, `docs:`).
5. Subir la rama y abrir una pull request con la plantilla.
6. Esperar la revisión y las comprobaciones automáticas.
7. Fusionar con `squash` para dejar un solo commit por cambio.
8. Etiquetar la versión cuando se vaya a producción.

## Mensajes de commit
- `feat: calcula el margen por mes en gold`
- `fix: corrige la unión de ventas con territorios`
- `docs: explica la capa staging`

## Qué pasa si no se sigue
- Escribir en `main` sin pull request: nadie revisa el cambio y un error llega a producción.
- Mezclar varios cambios en una rama: la revisión es difícil y deshacer uno obliga a deshacer todos.
- No etiquetar versiones: no se sabe qué código corre en producción ni a qué versión volver.
