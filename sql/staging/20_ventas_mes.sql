-- Staging: resumen intermedio por mes. Lo consume gold; nadie lo usa en informes.
CREATE OR REPLACE TABLE DEMO_VIDEO.STAGING.VENTAS_MES AS
SELECT MESNUM AS mes, SUM(VENTAS) AS ventas, SUM(COSTE) AS coste
FROM DEMO_VIDEO.COMERCIO.F_VENTAS
GROUP BY MESNUM;
