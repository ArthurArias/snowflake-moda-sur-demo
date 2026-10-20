-- Staging: carga desde un almacen externo (ejemplo con error a proposito)
CREATE OR REPLACE STAGE DEMO_VIDEO.STAGING.ST_EXTERNO
  URL = 's3://almacen-ficticio/ventas/'
  CREDENTIALS = (AWS_KEY_ID = 'AKIAFICTICIO' password = 'Clave123');
