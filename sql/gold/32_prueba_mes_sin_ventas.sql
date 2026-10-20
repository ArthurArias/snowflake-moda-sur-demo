-- Prueba de gold: con venta 0 el margen debe ser NULL y no dar error.
SELECT DEMO_VIDEO.GOLD.MARGEN(0, 10) AS margen_sin_ventas,
       DEMO_VIDEO.GOLD.MARGEN(100, 60) AS margen_normal;
