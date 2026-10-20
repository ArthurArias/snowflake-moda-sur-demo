# Modelo de Power BI como texto

Este directorio guarda la definición del modelo semántico de Power BI en formato de texto (TMDL): tablas, relaciones y medidas. No incluye datos.

- `Comercio.SemanticModel/definition/relationships.tmdl`: las nueve relaciones.
- `Comercio.SemanticModel/definition/tables/`: una archivo por tabla; las medidas están en `M_Medidas.tmdl`.
- La cuenta de Snowflake aparece como `TU_CUENTA`: sustitúyela por la tuya al abrir el proyecto.

Por qué en Git: un cambio en una medida o en una relación se revisa en una pull request, igual que el SQL.
