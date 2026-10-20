# Snowflake con GitHub: capas Silver, Staging y Gold (demostración)

Repositorio de demostración con datos inventados de una pyme ficticia de moda ("Moda Sur"). Sirve para enseñar cómo se trabaja en equipo con Snowflake y GitHub.

## Estructura (una carpeta por capa)
| Carpeta | Qué contiene | Quién lo toca |
|---|---|---|
| `sql/00_esquemas.sql` | Crea los esquemas de cada capa | Plataforma |
| `sql/silver/` | Vistas sobre los datos de origen, limpios y sin lógica de negocio | Plataforma de datos |
| `sql/staging/` | Tablas intermedias que usan los procesos (trazabilidad y pruebas) | Equipo de datos |
| `sql/gold/` | Funciones, procedimientos y tareas que producen las tablas de negocio | Equipo de datos, con revisión |

## Reglas del equipo
1. Nadie escribe directamente en `main`: todo cambio entra por una pull request.
2. Una rama por cambio: `feature/<incidencia>-<descripcion-corta>`.
3. Un script nuevo por cambio y reejecutable (`CREATE OR ALTER` cuando se pueda).
4. La pull request explica qué capa toca, cómo se probó y cómo se deshace.
5. Los cambios de `sql/gold/` los revisa otra persona del equipo.
6. Cada subida a producción lleva una etiqueta de versión (`v1.0.0`).

Más detalle en `CONTRIBUTING.md` y `docs/flujo_trabajo.md`.
