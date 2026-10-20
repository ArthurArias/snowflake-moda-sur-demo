-- Silver: los datos tal como llegan, solo con nombres claros. Sin lógica de negocio.
CREATE OR ALTER VIEW DEMO_VIDEO.COMERCIO.V_VENTAS_SILVER AS
SELECT MESNUM AS mes, LINEAID AS linea, ARTICULOID AS articulo,
       TERRITORIOID AS territorio, VENTAS AS ventas, COSTE AS coste
FROM DEMO_VIDEO.COMERCIO.F_VENTAS;
