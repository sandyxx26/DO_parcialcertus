use kaggle
go


-- en caso no exista la tabla - crear tabla
IF NOT EXISTS (SELECT * FROM SYS.TABLES WHERE object_id=OBJECT_ID(N'dbo.starbucks') AND type = 'U') 
	create table dbo.starbucks(
				beverage_category VARCHAR(50),
				beverage VARCHAR(100),
				beverage_prep VARCHAR(50),
				calories DECIMAL(6,3),
				total_fat_g VARCHAR(10),
				trans_fat_g DECIMAL(6,3),
				saturated_fat_g DECIMAL(6,3),
				sodium_mg DECIMAL(6,3),
				total_carbohytrates_g DECIMAL(6,3),
				cholesterl_mg DECIMAL(6,3),
				dietary_fibre_g DECIMAL(6,3),
				sugars_g DECIMAL(6,3),
				proteing_g DECIMAL(6,3),
				vitamin_a_pct VARCHAR(10),
				vitamin_c_pct VARCHAR(10),
				calcium_pct VARCHAR(10),
				iron_pct VARCHAR(10),
				caffeine_mg VARCHAR(10)
)
go
--SI YA EXISTE LA TABLA DBO.STARBUCKS - LIMPIAR TABLA
TRUNCATE TABLE dbo.starbucks;
go
--IMPORTAR DARTA DESDE ARCHIVO
BULK INSERT dbo.starbucks
FROM 'C:\Users\fcisn\Documents\MURUMURU\PROYECTO_PARCIAL\dataset\starbucks.csv'
WITH
(
	FIRSTROW = 2, --empieza en la 2da fila, ya que la primera es la cabecera
	FIELDTERMINATOR = ',',  -- indicamos separador de clumnas
	ROWTERMINATOR = '0x0a' -- indicamos separador de filas (salto de lineas en este caso)
	
)
go
