-- Simulacion de las medidas del modelo en Snowflake (filtros y valores esperados generados por la herramienta).
-- Cada estado de filtro equivale a un WHERE: lista vacia = sin filtro. Se espera OK en todas las filas.
USE SCHEMA DEMO_VIDEO.COMERCIO;
WITH FILTROS AS (
    SELECT
        COLUMN1 AS ESTADO,
        PARSE_JSON(COLUMN2) AS MESES,
        PARSE_JSON(COLUMN3) AS LINEAS,
        PARSE_JSON(COLUMN4) AS ARTICULOS,
        PARSE_JSON(COLUMN5) AS TERRITORIOS
    FROM
        VALUES
        ('Sin filtro', '[]', '[]', '[]', '[]'),
        ('Mes = Dic', '[12]', '[]', '[]', '[]'),
        ('Meses = Ene, Feb, Mar', '[1, 2, 3]', '[]', '[]', '[]'),
        ('Línea = Online', '[]', '[2]', '[]', '[]'),
        ('Líneas = Tienda física, Mayorista', '[]', '[1, 3]', '[]', '[]'),
        ('Artículo = Zapatillas', '[]', '[]', '[1]', '[]'),
        ('Artículos = Chaqueta, Bufanda', '[]', '[]', '[3, 11]', '[]'),
        ('Comunidad = Madrid', '[]', '[]', '[]', '[13]'),
        ('Comunidades = Canarias, Baleares', '[]', '[]', '[]', '[5, 4]'),
        ('Mes = Jul + Línea = Online + Comunidad = Cataluña', '[7]', '[2]', '[]', '[9]'),
        ('Mes = Nov + Artículo = Chaqueta + Comunidad = Galicia', '[11]', '[]', '[3]', '[12]'),
        ('Línea = Posventa + Artículo = Reloj', '[]', '[4]', '[8]', '[]'),
        ('Meses = Oct, Nov, Dic + Línea = Tienda física', '[10, 11, 12]', '[1]', '[]', '[]')
),

ESPERADO AS (
    SELECT
        COLUMN1 AS ESTADO,
        COLUMN2 AS MEDIDA,
        COLUMN3 AS ESPERADO
    FROM
        VALUES
        ('Sin filtro', 'Ventas', 5777.0),
        ('Sin filtro', 'Ventas Ant', 5440.0),
        ('Sin filtro', 'Objetivo', 5740.0),
        ('Sin filtro', 'Cumplimiento', 1.00645),
        ('Sin filtro', 'Ticket medio', 50.5821),
        ('Sin filtro', 'Margen %', 0.433216),
        ('Sin filtro', 'Unidades', 116200.0),
        ('Sin filtro', 'Sell-through', 0.68457),
        ('Sin filtro', 'Visitas web', 1128296.53),
        ('Sin filtro', 'Ventas online', 1791.0),
        ('Sin filtro', 'Compras online', 30462.18),
        ('Sin filtro', 'Conversión tienda', 0.182058),
        ('Mes = Dic', 'Ventas', 689.0),
        ('Mes = Dic', 'Ventas Ant', 667.758),
        ('Mes = Dic', 'Objetivo', 650.0),
        ('Mes = Dic', 'Cumplimiento', 1.06),
        ('Mes = Dic', 'Ticket medio', 57.2487),
        ('Mes = Dic', 'Margen %', 0.4168),
        ('Mes = Dic', 'Unidades', 13638.59),
        ('Mes = Dic', 'Sell-through', 0.679249),
        ('Mes = Dic', 'Visitas web', 163169.38),
        ('Mes = Dic', 'Ventas online', 288.548),
        ('Mes = Dic', 'Compras online', 4405.31),
        ('Mes = Dic', 'Conversión tienda', 0.195),
        ('Meses = Ene, Feb, Mar', 'Ventas', 1241.0),
        ('Meses = Ene, Feb, Mar', 'Ventas Ant', 1142.407),
        ('Meses = Ene, Feb, Mar', 'Objetivo', 1250.0),
        ('Meses = Ene, Feb, Mar', 'Cumplimiento', 0.9928),
        ('Meses = Ene, Feb, Mar', 'Ticket medio', 47.6274),
        ('Meses = Ene, Feb, Mar', 'Margen %', 0.4428),
        ('Meses = Ene, Feb, Mar', 'Unidades', 25111.85),
        ('Meses = Ene, Feb, Mar', 'Sell-through', 0.73708),
        ('Meses = Ene, Feb, Mar', 'Visitas web', 221443.79),
        ('Meses = Ene, Feb, Mar', 'Ventas online', 327.188),
        ('Meses = Ene, Feb, Mar', 'Compras online', 5978.62),
        ('Meses = Ene, Feb, Mar', 'Conversión tienda', 0.173306),
        ('Línea = Online', 'Ventas', 1791.0),
        ('Línea = Online', 'Ventas Ant', 1531.0),
        ('Línea = Online', 'Objetivo', 1772.415),
        ('Línea = Online', 'Cumplimiento', 1.01049),
        ('Línea = Online', 'Ticket medio', 58.7942),
        ('Línea = Online', 'Margen %', 0.413256),
        ('Línea = Online', 'Unidades', 36528.55),
        ('Línea = Online', 'Sell-through', 0.694714),
        ('Línea = Online', 'Visitas web', 1128296.53),
        ('Línea = Online', 'Ventas online', 1791.0),
        ('Línea = Online', 'Compras online', 30462.18),
        ('Líneas = Tienda física, Mayorista', 'Ventas', 3697.0),
        ('Líneas = Tienda física, Mayorista', 'Ventas Ant', 3608.0),
        ('Líneas = Tienda física, Mayorista', 'Objetivo', 3680.819),
        ('Líneas = Tienda física, Mayorista', 'Cumplimiento', 1.0044),
        ('Líneas = Tienda física, Mayorista', 'Ticket medio', 47.8265),
        ('Líneas = Tienda física, Mayorista', 'Margen %', 0.438776),
        ('Líneas = Tienda física, Mayorista', 'Unidades', 74808.71),
        ('Líneas = Tienda física, Mayorista', 'Sell-through', 0.680943),
        ('Líneas = Tienda física, Mayorista', 'Visitas web', 0.0),
        ('Líneas = Tienda física, Mayorista', 'Ventas online', 0.0),
        ('Líneas = Tienda física, Mayorista', 'Compras online', 0.0),
        ('Líneas = Tienda física, Mayorista', 'Conversión tienda', 0.182058),
        ('Artículo = Zapatillas', 'Ventas', 842.0),
        ('Artículo = Zapatillas', 'Ventas Ant', 746.9),
        ('Artículo = Zapatillas', 'Objetivo', 838.605),
        ('Artículo = Zapatillas', 'Cumplimiento', 1.00405),
        ('Artículo = Zapatillas', 'Ticket medio', 63.2611),
        ('Artículo = Zapatillas', 'Margen %', 0.36),
        ('Artículo = Zapatillas', 'Unidades', 9910.0),
        ('Artículo = Zapatillas', 'Sell-through', 0.78),
        ('Artículo = Zapatillas', 'Visitas web', 149386.87),
        ('Artículo = Zapatillas', 'Ventas online', 297.937),
        ('Artículo = Zapatillas', 'Compras online', 4033.2),
        ('Artículo = Zapatillas', 'Conversión tienda', 0.18188),
        ('Artículos = Chaqueta, Bufanda', 'Ventas', 865.0),
        ('Artículos = Chaqueta, Bufanda', 'Ventas Ant', 861.732),
        ('Artículos = Chaqueta, Bufanda', 'Objetivo', 854.736),
        ('Artículos = Chaqueta, Bufanda', 'Cumplimiento', 1.01201),
        ('Artículos = Chaqueta, Bufanda', 'Ticket medio', 59.6207),
        ('Artículos = Chaqueta, Bufanda', 'Margen %', 0.434127),
        ('Artículos = Chaqueta, Bufanda', 'Unidades', 13090.0),
        ('Artículos = Chaqueta, Bufanda', 'Sell-through', 0.57122),
        ('Artículos = Chaqueta, Bufanda', 'Visitas web', 120656.92),
        ('Artículos = Chaqueta, Bufanda', 'Ventas online', 234.585),
        ('Artículos = Chaqueta, Bufanda', 'Compras online', 3257.54),
        ('Artículos = Chaqueta, Bufanda', 'Conversión tienda', 0.182256),
        ('Comunidad = Madrid', 'Ventas', 849.219),
        ('Comunidad = Madrid', 'Ventas Ant', 779.919),
        ('Comunidad = Madrid', 'Objetivo', 840.597),
        ('Comunidad = Madrid', 'Cumplimiento', 1.01026),
        ('Comunidad = Madrid', 'Ticket medio', 50.37),
        ('Comunidad = Madrid', 'Margen %', 0.44434),
        ('Comunidad = Madrid', 'Unidades', 17106.41),
        ('Comunidad = Madrid', 'Sell-through', 0.684281),
        ('Comunidad = Madrid', 'Visitas web', 146195.91),
        ('Comunidad = Madrid', 'Ventas online', 232.54),
        ('Comunidad = Madrid', 'Compras online', 3947.05),
        ('Comunidad = Madrid', 'Conversión tienda', 0.182092),
        ('Comunidades = Canarias, Baleares', 'Ventas', 404.39),
        ('Comunidades = Canarias, Baleares', 'Ventas Ant', 369.994),
        ('Comunidades = Canarias, Baleares', 'Objetivo', 402.409),
        ('Comunidades = Canarias, Baleares', 'Cumplimiento', 1.00492),
        ('Comunidades = Canarias, Baleares', 'Ticket medio', 50.7323),
        ('Comunidades = Canarias, Baleares', 'Margen %', 0.416618),
        ('Comunidades = Canarias, Baleares', 'Unidades', 8136.32),
        ('Comunidades = Canarias, Baleares', 'Sell-through', 0.687709),
        ('Comunidades = Canarias, Baleares', 'Visitas web', 93373.81),
        ('Comunidades = Canarias, Baleares', 'Ventas online', 147.691),
        ('Comunidades = Canarias, Baleares', 'Compras online', 2520.94),
        ('Comunidades = Canarias, Baleares', 'Conversión tienda', 0.18198),
        ('Mes = Jul + Línea = Online + Comunidad = Cataluña', 'Ventas', 17.464),
        ('Mes = Jul + Línea = Online + Comunidad = Cataluña', 'Ventas Ant', 15.226),
        ('Mes = Jul + Línea = Online + Comunidad = Cataluña', 'Objetivo', 18.007),
        ('Mes = Jul + Línea = Online + Comunidad = Cataluña', 'Cumplimiento', 0.96983),
        ('Mes = Jul + Línea = Online + Comunidad = Cataluña', 'Ticket medio', 55.998),
        ('Mes = Jul + Línea = Online + Comunidad = Cataluña', 'Margen %', 0.421483),
        ('Mes = Jul + Línea = Online + Comunidad = Cataluña', 'Unidades', 354.78),
        ('Mes = Jul + Línea = Online + Comunidad = Cataluña', 'Sell-through', 0.605419),
        ('Mes = Jul + Línea = Online + Comunidad = Cataluña', 'Visitas web', 11551.36),
        ('Mes = Jul + Línea = Online + Comunidad = Cataluña', 'Ventas online', 17.464),
        ('Mes = Jul + Línea = Online + Comunidad = Cataluña', 'Compras online', 311.87),
        ('Mes = Nov + Artículo = Chaqueta + Comunidad = Galicia', 'Ventas', 6.416),
        ('Mes = Nov + Artículo = Chaqueta + Comunidad = Galicia', 'Ventas Ant', 6.466),
        ('Mes = Nov + Artículo = Chaqueta + Comunidad = Galicia', 'Objetivo', 6.015),
        ('Mes = Nov + Artículo = Chaqueta + Comunidad = Galicia', 'Cumplimiento', 1.06668),
        ('Mes = Nov + Artículo = Chaqueta + Comunidad = Galicia', 'Ticket medio', 78.9997),
        ('Mes = Nov + Artículo = Chaqueta + Comunidad = Galicia', 'Margen %', 0.388685),
        ('Mes = Nov + Artículo = Chaqueta + Comunidad = Galicia', 'Unidades', 57.3),
        ('Mes = Nov + Artículo = Chaqueta + Comunidad = Galicia', 'Sell-through', 0.615067),
        ('Mes = Nov + Artículo = Chaqueta + Comunidad = Galicia', 'Visitas web', 1006.2),
        ('Mes = Nov + Artículo = Chaqueta + Comunidad = Galicia', 'Ventas online', 2.478),
        ('Mes = Nov + Artículo = Chaqueta + Comunidad = Galicia', 'Compras online', 27.17),
        ('Mes = Nov + Artículo = Chaqueta + Comunidad = Galicia', 'Conversión tienda', 0.192),
        ('Línea = Posventa + Artículo = Reloj', 'Ventas', 30.66),
        ('Línea = Posventa + Artículo = Reloj', 'Ventas Ant', 35.796),
        ('Línea = Posventa + Artículo = Reloj', 'Objetivo', 30.4),
        ('Línea = Posventa + Artículo = Reloj', 'Cumplimiento', 1.00857),
        ('Línea = Posventa + Artículo = Reloj', 'Ticket medio', 54.3334),
        ('Línea = Posventa + Artículo = Reloj', 'Margen %', 0.378233),
        ('Línea = Posventa + Artículo = Reloj', 'Unidades', 329.68),
        ('Línea = Posventa + Artículo = Reloj', 'Sell-through', 0.47311),
        ('Línea = Posventa + Artículo = Reloj', 'Visitas web', 0.0),
        ('Línea = Posventa + Artículo = Reloj', 'Ventas online', 0.0),
        ('Línea = Posventa + Artículo = Reloj', 'Compras online', 0.0),
        ('Meses = Oct, Nov, Dic + Línea = Tienda física', 'Ventas', 836.822),
        ('Meses = Oct, Nov, Dic + Línea = Tienda física', 'Ventas Ant', 815.447),
        ('Meses = Oct, Nov, Dic + Línea = Tienda física', 'Objetivo', 802.591),
        ('Meses = Oct, Nov, Dic + Línea = Tienda física', 'Cumplimiento', 1.04265),
        ('Meses = Oct, Nov, Dic + Línea = Tienda física', 'Ticket medio', 50.4349),
        ('Meses = Oct, Nov, Dic + Línea = Tienda física', 'Margen %', 0.439264),
        ('Meses = Oct, Nov, Dic + Línea = Tienda física', 'Unidades', 16427.35),
        ('Meses = Oct, Nov, Dic + Línea = Tienda física', 'Sell-through', 0.592076),
        ('Meses = Oct, Nov, Dic + Línea = Tienda física', 'Visitas web', 0.0),
        ('Meses = Oct, Nov, Dic + Línea = Tienda física', 'Ventas online', 0.0),
        ('Meses = Oct, Nov, Dic + Línea = Tienda física', 'Compras online', 0.0),
        ('Meses = Oct, Nov, Dic + Línea = Tienda física', 'Conversión tienda', 0.192026)
),

BASE AS (
    SELECT
        F.ESTADO,
        SUM(V.VENTAS) AS VENTAS,
        SUM(V.VENTASANT) AS VENTAS_ANT,
        SUM(V.OBJETIVO) AS OBJETIVO,
        SUM(V.COSTE) AS COSTE,
        SUM(V.UNIDADES) AS UNIDADES,
        SUM(V.UNIDADESRECIBIDAS) AS RECIBIDAS,
        SUM(V.TICKETS) AS TICKETS,
        SUM(V.VISITASWEB) AS VISITAS_WEB,
        SUM(V.VISITANTES) AS VISITANTES,
        SUM(IFF(V.LINEAID = 2, V.VENTAS, 0)) AS VENTAS_ONLINE,
        SUM(IFF(V.LINEAID = 2, V.TICKETS, 0)) AS COMPRAS_ONLINE,
        SUM(IFF(V.LINEAID = 1, V.TICKETS, 0)) AS TICKETS_TIENDA
    FROM FILTROS AS F
    INNER JOIN F_VENTAS AS V
        ON
            (ARRAY_SIZE(F.MESES) = 0 OR ARRAY_CONTAINS(V.MESNUM::VARIANT, F.MESES))
            AND (ARRAY_SIZE(F.LINEAS) = 0 OR ARRAY_CONTAINS(V.LINEAID::VARIANT, F.LINEAS))
            AND (ARRAY_SIZE(F.ARTICULOS) = 0 OR ARRAY_CONTAINS(V.ARTICULOID::VARIANT, F.ARTICULOS))
            AND (ARRAY_SIZE(F.TERRITORIOS) = 0 OR ARRAY_CONTAINS(V.TERRITORIOID::VARIANT, F.TERRITORIOS))
    GROUP BY F.ESTADO
),

OBTENIDO AS (
    SELECT
        ESTADO,
        'Ventas' AS MEDIDA,
        VENTAS AS OBTENIDO
    FROM BASE
    UNION ALL
    SELECT
        ESTADO,
        'Ventas Ant' AS MEDIDA,
        VENTAS_ANT AS OBTENIDO
    FROM BASE
    UNION ALL
    SELECT
        ESTADO,
        'Objetivo' AS MEDIDA,
        OBJETIVO AS OBTENIDO
    FROM BASE
    UNION ALL
    SELECT
        ESTADO,
        'Cumplimiento' AS MEDIDA,
        VENTAS / NULLIF(OBJETIVO, 0) AS OBTENIDO
    FROM BASE
    UNION ALL
    SELECT
        ESTADO,
        'Ticket medio' AS MEDIDA,
        VENTAS * 1000 / NULLIF(TICKETS, 0) AS OBTENIDO
    FROM BASE
    UNION ALL
    SELECT
        ESTADO,
        'Margen %' AS MEDIDA,
        (VENTAS - COSTE) / NULLIF(VENTAS, 0) AS OBTENIDO
    FROM BASE
    UNION ALL
    SELECT
        ESTADO,
        'Unidades' AS MEDIDA,
        UNIDADES AS OBTENIDO
    FROM BASE
    UNION ALL
    SELECT
        ESTADO,
        'Sell-through' AS MEDIDA,
        UNIDADES / NULLIF(RECIBIDAS, 0) AS OBTENIDO
    FROM BASE
    UNION ALL
    SELECT
        ESTADO,
        'Visitas web' AS MEDIDA,
        VISITAS_WEB AS OBTENIDO
    FROM BASE
    UNION ALL
    SELECT
        ESTADO,
        'Ventas online' AS MEDIDA,
        VENTAS_ONLINE AS OBTENIDO
    FROM BASE
    UNION ALL
    SELECT
        ESTADO,
        'Compras online' AS MEDIDA,
        COMPRAS_ONLINE AS OBTENIDO
    FROM BASE
    UNION ALL
    SELECT
        ESTADO,
        'Conversión tienda' AS MEDIDA,
        TICKETS_TIENDA / NULLIF(VISITANTES, 0) AS OBTENIDO
    FROM BASE
)

SELECT
    E.ESTADO,
    E.MEDIDA,
    E.ESPERADO,
    ROUND(O.OBTENIDO, 4) AS OBTENIDO,
    IFF(ABS(E.ESPERADO - O.OBTENIDO) <= IFF(E.MEDIDA IN ('Cumplimiento', 'Margen %', 'Sell-through', 'Conversión tienda'), 0.0001, 0.01), 'OK', 'FALLA') AS RESULTADO
FROM ESPERADO AS E
INNER JOIN OBTENIDO AS O ON E.ESTADO = O.ESTADO AND E.MEDIDA = O.MEDIDA
ORDER BY RESULTADO, E.ESTADO, E.MEDIDA;
