CREATE TABLE [dbo].[Table]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [Nombre] NVARCHAR(100) NULL, 
    [Descripcion] NVARCHAR(200) NULL, 
    [Estado] NVARCHAR(10) NULL
)

INSERT INTO Producto (Nombre, Descripcion, Estado) VALUES ('Samsung J5','Smartphone Samsung Galaxy J5','Activo');
INSERT INTO Producto (Nombre, Descripcion, Estado) VALUES ('Samsung J7','Smartphone Samsung Galaxy J7','Activo');
INSERT INTO Producto (Nombre, Descripcion, Estado) VALUES ('LG 39LN5700','Smart TV LG 39 Pulgadas','Inactivo');
INSERT INTO Producto (Nombre, Descripcion, Estado) VALUES ('LG 32LN5700','Smart TV LG 32 Pulgadas','Inactivo');
INSERT INTO Producto (Nombre, Descripcion, Estado) VALUES ('Samsung UN48J5200AK','Smart TV Samsung 48 Pulgadas','Activo');
INSERT INTO Producto (Nombre, Descripcion, Estado) VALUES ('Lenovo Yoga 8','Tablet Lenovo Yoga 8','Inactivo');
INSERT INTO Producto (Nombre, Descripcion, Estado) VALUES ('Sony E2033','Smartphone Sony Xperia E2033','Inactivo');
INSERT INTO Producto (Nombre, Descripcion, Estado) VALUES ('Samsung A5','Smartphone Samsung Galaxy A5','Activo');
INSERT INTO Producto (Nombre, Descripcion, Estado) VALUES ('Technicolor TC8305C','Modem Technicolor TC8305C','Inactivo');
INSERT INTO Producto (Nombre, Descripcion, Estado) VALUES ('Hitron CGNV2','Modem Hitron CGNV2','Activo');