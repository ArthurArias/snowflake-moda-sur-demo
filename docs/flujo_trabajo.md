# Flujo de trabajo

```
incidencia -> rama -> commits -> pull request -> revisión -> fusión en main -> etiqueta -> despliegue
```

## Entornos
| Entorno | Rama o etiqueta | Para qué |
|---|---|---|
| Desarrollo | rama `feature/...` | Probar sin riesgo |
| Preproducción | `main` | Validar con el equipo funcional |
| Producción | etiqueta `vX.Y.Z` | Lo que usan los informes |

## Deshacer un cambio
Se crea una pull request que revierte el commit (`git revert`). No se borra historial.
