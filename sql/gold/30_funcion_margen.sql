-- Gold: regla de negocio del margen. Si la venta es 0 devuelve NULL (evita dividir entre cero).
CREATE OR REPLACE FUNCTION DEMO_VIDEO.GOLD.MARGEN(venta FLOAT, coste FLOAT)
RETURNS FLOAT AS $$ IFF(venta = 0, NULL, (venta - coste) / venta) $$;
