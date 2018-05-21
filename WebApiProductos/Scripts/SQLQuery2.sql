-- 1) Procedimiento almacenado para filtrar por nombre
     
-- Author      : Guillermo                                                                 
-- Create date : 2018-05-18                                                                 
-- Description : Filtrar por nombre                                              
-- Tables used :  Producto                                                                                                                              
-- =============================================                                                                 
-- exec BuscarPorNombre 'Samsung'
   
-- =============================================   
CREATE PROCEDURE [dbo].[BuscarPorNombre]
@nombre VARCHAR(100) = ''
AS
BEGIN
SELECT * FROM Producto WHERE Nombre LIKE  @nombre +'%'   
END

-- 2) Procedimiento almacenado para filtrar por descripcion
     
-- Author      : Guillermo                                                                 
-- Create date : 2018-05-18                                                                 
-- Description : Filtrar por descripcion                                              
-- Tables used :  Producto                                                                                                                              
-- =============================================                                                                 
-- exec BuscarPorNombre 'Smartphone'
   
-- =============================================   
CREATE PROCEDURE [dbo].[BuscarPorDescripcion]
@descripcion VARCHAR(200) = ''         
AS                                                                 
BEGIN
SELECT * FROM Producto WHERE Descripcion LIKE  @descripcion +'%'   
END

-- 3) Procedimiento almacenado para filtrar por estado
     
-- Author      : Guillermo                                                                 
-- Create date : 2018-05-18                                                                 
-- Description : Filtrar por estado                                              
-- Tables used :  Producto                                                                                                                              
-- =============================================                                                                 
-- exec BuscarPorEstado 'Activo'
   
-- =============================================                                                        
CREATE PROCEDURE [dbo].[BuscarPorEstado]
@estado VARCHAR(10) = ''         
AS                                                                 
BEGIN
SELECT * FROM Producto WHERE Estado = @estado
END
  
-- 4) Procedimiento almacenado para insertar productos
     
-- Author      : Guillermo                                                                 
-- Create date : 2018-05-18                                                                 
-- Description : Insertar producto                                              
-- Tables used :  Producto                                                                                                                              
-- =============================================                                                                 
-- exec InsertarProducto 'Samsung S7','Smartphone Samsung Galaxy S7','Activo'
   
-- =============================================   
                                                      
CREATE PROCEDURE [dbo].[InsertarProducto]                                               
   (                        
     @nombre VARCHAR(100)     = '', 
     @descripcion VARCHAR(200)     = '', 
     @Estado VARCHAR(10)     = ''
      )                                                         
AS                                                                 
BEGIN         
        IF NOT EXISTS (SELECT * FROM Producto WHERE Nombre=@nombre) 
            BEGIN 

                    INSERT INTO Producto (Nombre,Descripcion,Estado) VALUES (@nombre,@descripcion,@estado)            
                    SELECT 'Inserted' AS results 
                         
            END 
         ELSE 
             BEGIN 
                     SELECT 'Exists' AS results 
              END 
 
END 

-- 5) Procedimiento almacenado to actualizar productos
     
-- Author      : Guillermo                                                                 
-- Create date : 2018-05-18                                                                 
-- Description : Actualizar productos                                              
-- Tables used :  Producto                                                                                                                     
-- =============================================                                                                 
-- exec ActualizarProducto 2,'Samsung J7','Smartphone Samsung Galaxy J7','Inactivo' 
         
-- =============================================                                                            
CREATE PROCEDURE [dbo].[ActualizarProducto]                                               
   ( @ID INT=0,                            
     @nombre VARCHAR(100) = '', 
     @descripcion VARCHAR(200) = '', 
     @estado VARCHAR(10) = ''
      )                                                         
AS                                                                 
BEGIN         
        IF NOT EXISTS (SELECT * FROM Producto WHERE ID!=@id) 
            BEGIN 
                    UPDATE Producto SET Nombre = @nombre, Descripcion = @descripcion, Estado=@estado WHERE ID=@id 
                                
                    SELECT 'updated' AS results                         
            END 
         ELSE 
             BEGIN 
                     SELECT 'Exists' AS results 
              END 
END 
 
-- 6) Procedimiento almacenado para borrar productos
     
-- Author      : Guillermo                                                                 
-- Create date : 2018-05-18                                                                 
-- Description : Borrar productos                                              
-- Tables used :  Producto                                                                                                                             
-- =============================================                                                                 
-- exec BorrarProducto 10 
         
-- =============================================                                                            
CREATE PROCEDURE [dbo].[BorrarProducto]                                               
   ( @id INT=0 )                                                         
AS                                                                 
BEGIN         
        DELETE FROM Producto WHERE ID=@id                 
             
END 

-- 7) Procedimiento almacenado para mostrar todos los productos
     
-- Author      : Guillermo                                                                 
-- Create date : 2018-05-18                                                                 
-- Description : Mostrar todos los productos                                              
-- Tables used :  Producto                                                                                                                             
-- =============================================                                                                 
-- exec BorrarProducto 10 
         
-- =============================================                                                            
CREATE PROCEDURE [dbo].[MostrarProductos]                                               
   ( @id INT=0 )                                                         
AS                                                                 
BEGIN         
        SELECT * FROM Producto            
             
END 
-- 2) Procedimiento almacenado para filtrar por nombre
     
-- Author      : Guillermo                                                                 
-- Create date : 2018-05-18                                                                 
-- Description : Filtrar por nombre                                              
-- Tables used :  Producto                                                                                                                              
-- =============================================                                                                 
-- exec BuscarPorNombre 'Samsung'
   
-- =============================================   
CREATE PROCEDURE [dbo].[BuscarPorId]
@id int = ''
AS
BEGIN
SELECT * FROM Producto WHERE Id=id  
END