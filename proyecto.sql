-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-03-2020 a las 06:16:03
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_PRODUCTO_CODIGO` (IN `CCodigo_P` VARCHAR(10))  BEGIN
	SELECT P.Codigo_P, CP.Nombre_CP, MP.Nombre_MP, P.Descripcion_P, P.Precio_P, P.Imagen_P, P.Estado_P FROM PRODUCTO P
	INNER JOIN clase_producto CP ON CP.Codigo_CP = P.Codigo_CP
	INNER JOIN marca_producto MP ON MP.Codigo_MP = P.Codigo_MP
	WHERE P.Codigo_P = CCodigo_P and P.Estado_P = 'HAB' ORDER BY cp.Nombre_CP ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_CLASE_PRODUCTO` (IN `CCodigo_CP` VARCHAR(10))  begin
	update CLASE_PRODUCTO set Estado_CP='INH' where Codigo_CP=UPPER(CCodigo_CP);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_DETALLE_VENTA` (IN `CCodigo_V` VARCHAR(10))  BEGIN
	DELETE FROM DETALLE_VENTA WHERE Codigo_V = CCodigo_V;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_MARCA_PRODUCTO` (IN `CCodigo_MP` VARCHAR(10))  begin
	update MARCA_PRODUCTO set Estado_MP='INH' where Codigo_MP=CCodigo_MP;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_PRODUCTO` (IN `CCodigo_P` VARCHAR(10))  begin
	update PRODUCTO set Estado_P='INH' where Codigo_P=CCodigo_P;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_USUARIO` (IN `CCodigo_U` VARCHAR(10))  begin
	update USUARIO set Estado_U='INH' where Codigo_U=CCodigo_U;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_VENTA` (IN `CCodigo_V` VARCHAR(10))  BEGIN
	DELETE FROM DETALLE_VENTA WHERE DETALLE_VENTA.Codigo_V=CCodigo_V;
    DELETE FROM VENTA WHERE VENTA.Codigo_V=CCodigo_V;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LOGEAR_USUARIO` (IN `IId_U` VARCHAR(30))  begin
	select Codigo_U,Id_U,Clave_U,Estado_U from USUARIO
    where Id_U = IId_U;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_CLASE_PRODUCTO` (IN `CCodigo_CP` VARCHAR(10), IN `NNombre_CP` VARCHAR(30))  begin
	update CLASE_PRODUCTO set Nombre_CP=UPPER(NNombre_CP) where Codigo_CP=UPPER(CCodigo_CP);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_CLAVE_USUARIO` (IN `CCodigo_U` VARCHAR(10), IN `CClave_U` VARCHAR(20))  begin
	update USUARIO set Clave_U=CClave_U where Codigo_U=CCodigo_U;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_EMAIL_USUARIO` (IN `CCodigo_U` VARCHAR(10), IN `EEmail_U` VARCHAR(50))  begin
	update USUARIO set Email_U=EEmail_U where Codigo_U=CCodigo_U;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_MARCA_PRODUCTO` (IN `CCodigo_MP` VARCHAR(10), IN `NNombre_MP` VARCHAR(30))  begin
	update MARCA_PRODUCTO set Nombre_MP=UPPER(NNombre_MP) where Codigo_MP=CCodigo_MP;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_PRODUCTO` (IN `CCodigo_P` VARCHAR(10), IN `NNombre_CP` VARCHAR(30), IN `NNombre_MP` VARCHAR(30), IN `DDescripcion_P` VARCHAR(50), IN `PPrecio_P` DECIMAL(6,2), IN `IImagen_P` VARCHAR(50))  begin
	declare CCodigo_CP varchar(10);
    declare CCodigo_MP varchar(10);
    
    set CCodigo_CP = (SELECT Codigo_CP FROM clase_producto where Nombre_CP = NNombre_CP);
    set CCodigo_MP = (SELECT Codigo_MP FROM marca_producto where Nombre_MP = NNombre_MP);

	update PRODUCTO set Codigo_CP=UPPER(CCodigo_CP), Codigo_MP=UPPER(CCodigo_MP), Descripcion_P=UPPER(DDescripcion_P), Precio_P=UPPER(PPrecio_P), Imagen_P=IImagen_P where Codigo_P=UPPER(CCodigo_P);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_USUARIO` (IN `CCodigo_U` VARCHAR(10), IN `NNombres_U` VARCHAR(50), IN `AApellidos_U` VARCHAR(50), IN `DDireccion1_U` VARCHAR(50), IN `DDireccion2_U` VARCHAR(50), IN `TTelefono_U` VARCHAR(10))  begin
update USUARIO set Nombres_U=UPPER(NNombres_U), Apellidos_U=UPPER(AApellidos_U),  Direccion1_U=UPPER(DDireccion1_U), Direccion2_U=UPPER(DDireccion2_U), Telefono_U=TTelefono_U where Codigo_U=UPPER(CCodigo_U);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CLASE_PRODUCTO_HABILITADOS` ()  BEGIN
	SELECT * FROM CLASE_PRODUCTO
    WHERE Estado_CP = 'HAB'
    ORDER BY Nombre_CP ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CLASE_PRODUCTO_INHABILITADOS` ()  BEGIN
	SELECT * FROM CLASE_PRODUCTO
    WHERE Estado_CP = 'INH'
    ORDER BY Nombre_CP ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_CLASE_PRODUCTO` ()  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_CP) from CLASE_PRODUCTO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('CP000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('CP00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('CP0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('CP'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'CP0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_CP FROM CLASE_PRODUCTO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_MARCA_PRODUCTO` ()  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_MP) from MARCA_PRODUCTO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('MP000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('MP00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('MP0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('MP'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'MP0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_MP FROM MARCA_PRODUCTO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_PRODUCTO` ()  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_P) from PRODUCTO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('P000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('P00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('P0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('P'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'P0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_P FROM PRODUCTO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_USUARIO` ()  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_U) from USUARIO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('U000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('U00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('U0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('U'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'U0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_U FROM USUARIO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_VENTA` ()  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_V) from VENTA);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('V000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('V00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('V0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('V'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'V0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_V FROM VENTA;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_DETALLE_VENTA_POR_CODIGO` (IN `CCodigo_V` VARCHAR(10))  BEGIN
	SELECT dv.Codigo_V, CONCAT(c.Nombre_CP,' ',m.Nombre_MP,' - ',p.Descripcion_P) as Producto, dv.Precio, dv.Cantidad, dv.Descuento, dv.SubTotal
    FROM DETALLE_VENTA dv
    INNER JOIN PRODUCTO p ON p.Codigo_P = dv.Codigo_P
    INNER JOIN CLASE_PRODUCTO c ON c.Codigo_CP = p.Codigo_CP
    INNER JOIN MARCA_PRODUCTO m ON m.Codigo_MP = p.Codigo_MP
    WHERE dv.Codigo_V = CCodigo_V;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_MARCA_PRODUCTO_HABILITADOS` ()  begin
	SELECT * FROM MARCA_PRODUCTO
    where Estado_MP = 'HAB'
    ORDER BY Nombre_MP ASC;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_MARCA_PRODUCTO_INHABILITADOS` ()  begin
	SELECT * FROM MARCA_PRODUCTO
    where Estado_MP = 'INH'
    ORDER BY Nombre_MP ASC;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_PRODUCTOS_ELIMINADOS` ()  BEGIN
	SELECT P.Codigo_P, CP.Nombre_CP as Clase_P, MP.Nombre_MP as Marca_P, P.Descripcion_P, P.Precio_P, P.Imagen_P, P.Estado_P FROM PRODUCTO P
	INNER JOIN clase_producto CP ON CP.Codigo_CP = P.Codigo_CP
	INNER JOIN marca_producto MP ON MP.Codigo_MP = P.Codigo_MP
	WHERE P.Estado_P = 'INH' ORDER BY cp.Nombre_CP ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_PRODUCTOS_HABILITADOS` ()  BEGIN
	SELECT P.Codigo_P, CP.Nombre_CP as Clase_P, MP.Nombre_MP as Marca_P, P.Descripcion_P, P.Precio_P, P.Imagen_P, P.Estado_P FROM PRODUCTO P
	INNER JOIN clase_producto CP ON CP.Codigo_CP = P.Codigo_CP
	INNER JOIN marca_producto MP ON MP.Codigo_MP = P.Codigo_MP
	WHERE P.Estado_P = 'HAB' and CP.Estado_CP = 'HAB' and MP.Estado_MP = 'HAB' ORDER BY cp.Nombre_CP ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_USUARIOS_CLIENTES_HABILITADOS` ()  begin
	select Codigo_U,Nombres_U,Apellidos_U,Dni_U,Email_U,Telefono_U,Id_U,Tipo_U,Estado_U from USUARIO
    where Tipo_U LIKE 'CLIENTE' and Estado_U = 'HAB'
    order by Nombres_U asc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_USUARIOS_CLIENTES_INHABILITADOS` ()  begin
	select Codigo_U,Nombres_U,Apellidos_U,Dni_U,Email_U,Telefono_U,Id_U,Tipo_U,Estado_U from USUARIO
    where Tipo_U LIKE 'CLIENTE' and Estado_U = 'INH'
    order by Nombres_U asc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_USUARIO_POR_CODIGO` (IN `CCodigo_U` VARCHAR(10))  begin
	select * from USUARIO
    where Codigo_U = CCodigo_U;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_VENTA` ()  BEGIN
	SELECT Codigo_V, USUARIO.Codigo_U, concat(USUARIO.Nombres_U,', ', USUARIO.Apellidos_U) AS Cliente, Total, DATE_FORMAT(Fecha,'%d/%m/%Y a las %H:%i:%s horas') AS Fecha  FROM VENTA
    INNER JOIN USUARIO ON USUARIO.Codigo_U = VENTA.Codigo_U 
    ORDER BY Fecha desc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RECUPERAR_CLASE_PRODUCTO` (IN `CCodigo_CP` VARCHAR(10))  begin
	update CLASE_PRODUCTO set Estado_CP='HAB' where Codigo_CP=UPPER(CCodigo_CP);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RECUPERAR_MARCA_PRODUCTO` (IN `CCodigo_MP` VARCHAR(10))  begin
	update MARCA_PRODUCTO set Estado_MP='HAB' where Codigo_MP=CCodigo_MP;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RECUPERAR_PRODUCTO` (IN `CCodigo_P` VARCHAR(10))  begin
	update PRODUCTO set Estado_P='HAB' where Codigo_P=CCodigo_P;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RECUPERAR_USUARIO` (IN `CCodigo_U` VARCHAR(10))  begin
	update USUARIO set Estado_U='HAB' where Codigo_U=CCodigo_U;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_CLASE_PRODUCTO` (IN `NNombre_CP` VARCHAR(30))  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_CP) from CLASE_PRODUCTO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('CP000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('CP00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('CP0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('CP'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'CP0001');
	end if;
    
    if not exists (select Codigo_CP,Nombre_CP,Estado_CP from CLASE_PRODUCTO where Codigo_CP=CCodigo or Nombre_CP=NNombre_CP and (Estado_CP='HAB' or Estado_CP='INH')) then
		insert into CLASE_PRODUCTO(Codigo_CP,Nombre_CP) values (UPPER(CCodigo) ,UPPER(NNombre_CP));
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_DETALLE_VENTA` (IN `CCodigo_V` VARCHAR(10), IN `NNombre_P` VARCHAR(100), IN `PPrecio` DECIMAL(10,2), IN `CCantidad` DECIMAL(10,2), IN `DDescuento` DECIMAL(10,2), IN `SSubTotal` DECIMAL(10,2))  BEGIN
	declare CCodigo_P varchar(10);
    
    set CCodigo_P = (SELECT Codigo_P FROM PRODUCTO P
    INNER JOIN clase_producto CP ON CP.Codigo_CP = P.Codigo_CP
    INNER JOIN marca_producto MP ON MP.Codigo_MP = P.Codigo_MP
    WHERE CONCAT(CP.Nombre_CP,' ',MP.Nombre_MP,' - ',P.Descripcion_P) = NNombre_P);
    
    INSERT INTO DETALLE_VENTA(Codigo_V, Codigo_P, Precio, Cantidad, Descuento, SubTotal) VALUES(UPPER(CCodigo_V),UPPER(CCodigo_P),PPrecio,CCantidad,DDescuento,SSubTotal);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_MARCA_PRODUCTO` (IN `NNombre_MP` VARCHAR(30))  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_MP) from MARCA_PRODUCTO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('MP000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('MP00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('MP0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('MP'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'MP0001');
	end if;
    
    if not exists (select Codigo_MP,Nombre_MP,Estado_MP from MARCA_PRODUCTO where Codigo_MP=CCodigo or Nombre_MP=NNombre_MP and (Estado_MP='HAB' or Estado_MP='INH')) then
		insert into MARCA_PRODUCTO(Codigo_MP,Nombre_MP) values (UPPER(CCodigo) ,UPPER(NNombre_MP));
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_PRODUCTO` (IN `NNombre_CP` VARCHAR(30), IN `NNombre_MP` VARCHAR(30), IN `DDescripcion_P` VARCHAR(50), IN `PPrecio_P` DECIMAL(6,2), IN `IImagen_P` VARCHAR(50))  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
    
    declare CCodigo_CP varchar(30);
    declare CCodigo_MP varchar(30);
	
    set max = (select MAX(Codigo_P) from PRODUCTO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('P000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('P00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('P0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('P'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'P0001');
	end if;
    
    set CCodigo_CP = (SELECT Codigo_CP FROM clase_producto where Nombre_CP = NNombre_CP);
    set CCodigo_MP = (SELECT Codigo_MP FROM marca_producto where Nombre_MP = NNombre_MP);
    
    
    if not exists (select Codigo_P,Codigo_CP,Codigo_MP,Descripcion_P,Precio_P,Estado_P from PRODUCTO
    where Codigo_P=CCodigo or Codigo_CP=CCodigo_CP and Codigo_MP = CCodigo_MP and Descripcion_P = DDescripcion_P and Precio_P=PPrecio_P and (Estado_P='HAB' or Estado_P='INH')) then
		insert into PRODUCTO(Codigo_P, Codigo_CP, Codigo_MP, Descripcion_P, Precio_P, Imagen_P) values (UPPER(CCodigo) ,UPPER(CCodigo_CP), UPPER(CCodigo_MP), UPPER(DDescripcion_P), UPPER(PPrecio_P), IImagen_P);
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_USUARIO` (IN `NNombres_U` VARCHAR(50), IN `AApellidos_U` VARCHAR(50), IN `EEmail_U` VARCHAR(50), IN `DDireccion1_U` VARCHAR(50), IN `DDireccion2_U` VARCHAR(50), IN `TTelefono_U` VARCHAR(10), IN `IId_U` VARCHAR(30), IN `CClave_U` VARCHAR(20), IN `TTipo_U` VARCHAR(15))  BEGIN
declare max varchar(10);
declare num int;
declare CCodigo varchar(10);

    set max = (select MAX(Codigo_U) from USUARIO);
set num = (SELECT LTRIM(RIGHT(max,4)));
if num>=1 and num <=8 then
set num = num + 1;
set CCodigo = (select concat('U000'  ,  CAST(num as CHAR)));
elseif num>=9 and num <=98 then
set num = num + 1;
set CCodigo = (select concat('U00'  ,  CAST(num as CHAR)));
elseif num>=99 and num <=998 then
set num = num + 1;
set CCodigo = (select concat('U0'  ,  CAST(num as CHAR)));
elseif num>=999 and num <=9998 then
set num = num + 1;
set CCodigo = (select concat('U'  ,  CAST(num as CHAR)));
else 
set CCodigo=(select 'U0001');
end if;
    
    if not exists (select Id_U,Email_U from USUARIO where Id_U = IId_U and Email_U=EEmail_U) then
insert into USUARIO(Codigo_U,Nombres_U,Apellidos_U,Email_U,Direccion1_U,Direccion2_U,Telefono_U,Id_U,Clave_U,Tipo_U,Estado_U) 
        values (UPPER(CCodigo),UPPER(NNombres_U),UPPER(AApellidos_U),EEmail_U,UPPER(DDireccion1_U),UPPER(DDireccion2_U),TTelefono_U,IId_U,CClave_U,UPPER(TTipo_U),'HAB');
end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_USUARIO_CLIENTE` (IN `NNombres_U` VARCHAR(50), IN `AApellidos_U` VARCHAR(50), IN `EEmail_U` VARCHAR(50), IN `DDireccion1_U` VARCHAR(50), IN `DDireccion2_U` VARCHAR(50), IN `TTelefono_U` VARCHAR(10), IN `IId_U` VARCHAR(30), IN `CClave_U` VARCHAR(20))  BEGIN
declare max varchar(10);
declare num int;
declare CCodigo varchar(10);

    set max = (select MAX(Codigo_U) from USUARIO);
set num = (SELECT LTRIM(RIGHT(max,4)));
if num>=1 and num <=8 then
set num = num + 1;
set CCodigo = (select concat('U000'  ,  CAST(num as CHAR)));
elseif num>=9 and num <=98 then
set num = num + 1;
set CCodigo = (select concat('U00'  ,  CAST(num as CHAR)));
elseif num>=99 and num <=998 then
set num = num + 1;
set CCodigo = (select concat('U0'  ,  CAST(num as CHAR)));
elseif num>=999 and num <=9998 then
set num = num + 1;
set CCodigo = (select concat('U'  ,  CAST(num as CHAR)));
else 
set CCodigo=(select 'U0001');
end if;
    
    if not exists (select Id_U,Email_U from USUARIO where Id_U = IId_U and Email_U=EEmail_U) then
insert into USUARIO(Codigo_U,Nombres_U,Apellidos_U,Email_U,Direccion1_U,Direccion2_U,Telefono_U,Id_U,Clave_U,Tipo_U,Estado_U) 
        values (UPPER(CCodigo),UPPER(NNombres_U),UPPER(AApellidos_U),EEmail_U,UPPER(DDireccion1_U), UPPER(DDireccion2_U),TTelefono_U,IId_U,CClave_U,'CLIENTE','HAB');
end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_VENTA` (IN `NNombre_U` VARCHAR(100), IN `TTotal` DECIMAL(10,2))  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
    
    declare CCodigo_U varchar(10);
	
    set max = (select MAX(Codigo_V) from VENTA);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('V000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('V00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('V0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('V'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'V0001');
	end if;
    
    set CCodigo_U = (SELECT Codigo_U FROM USUARIO WHERE concat(Nombres_U,', ',Apellidos_U)=NNombre_U);
    
    if not exists (select Codigo_V from VENTA where Codigo_V = CCodigo) then
		insert into VENTA(Codigo_V, Codigo_U, Total) values (UPPER(CCodigo), UPPER(CCodigo_U), TTotal);
	end if;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_producto`
--

CREATE TABLE `clase_producto` (
  `Codigo_CP` varchar(10) NOT NULL,
  `Nombre_CP` varchar(30) NOT NULL,
  `Estado_CP` char(3) DEFAULT 'HAB'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clase_producto`
--

INSERT INTO `clase_producto` (`Codigo_CP`, `Nombre_CP`, `Estado_CP`) VALUES
('CP0001', 'HEADSET CORSAIR HS70', 'HAB'),
('CP0002', 'PROCESADOR AM4 8 NUCLEOS', 'HAB'),
('CP0003', 'INTEL CORE I5 9TH GEN', 'HAB'),
('CP0004', 'KRAKEN NZXT X62', 'HAB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `Codigo_V` varchar(20) NOT NULL,
  `Codigo_P` varchar(10) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Cantidad` decimal(10,2) NOT NULL,
  `Descuento` decimal(10,2) NOT NULL,
  `SubTotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`Codigo_V`, `Codigo_P`, `Precio`, `Cantidad`, `Descuento`, `SubTotal`) VALUES
('V0001', 'P0002', '9000.00', '1.00', '2250.00', '6750.00'),
('V0005', 'P0004', '6000.00', '1.00', '1500.00', '4500.00'),
('V0005', 'P0002', '9000.00', '1.00', '2250.00', '6750.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_producto`
--

CREATE TABLE `marca_producto` (
  `Codigo_MP` varchar(10) NOT NULL,
  `Nombre_MP` varchar(30) NOT NULL,
  `Estado_MP` char(3) DEFAULT 'HAB'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca_producto`
--

INSERT INTO `marca_producto` (`Codigo_MP`, `Nombre_MP`, `Estado_MP`) VALUES
('MP0001', 'CORSAIR', 'HAB'),
('MP0002', 'AMD', 'HAB'),
('MP0003', 'INTEL', 'HAB'),
('MP0004', 'NZXT', 'HAB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Codigo_P` varchar(10) NOT NULL,
  `Codigo_CP` varchar(10) NOT NULL,
  `Codigo_MP` varchar(10) NOT NULL,
  `Descripcion_P` varchar(100) NOT NULL,
  `Precio_P` decimal(10,2) NOT NULL,
  `Stock_P` decimal(6,2) DEFAULT 0.00,
  `Imagen_P` varchar(100) DEFAULT NULL,
  `Estado_P` char(3) DEFAULT 'HAB'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Codigo_P`, `Codigo_CP`, `Codigo_MP`, `Descripcion_P`, `Precio_P`, `Stock_P`, `Imagen_P`, `Estado_P`) VALUES
('P0001', 'CP0001', 'MP0001', 'EXCELENTE SONIDO 7.1', '1900.00', '0.00', 'img 8.jfif', 'HAB'),
('P0002', 'CP0002', 'MP0002', 'PROCESADOR RYZEN 9 3900X DE ALTO RENDIEMIENTO', '9000.00', '0.00', 'r.jpg', 'HAB'),
('P0003', 'CP0003', 'MP0003', 'INTEL CORE I5 PARA JUEGOS, TRABAJOS', '8000.00', '0.00', 'i5.jpg', 'HAB'),
('P0004', 'CP0004', 'MP0004', 'ENFRIMIENTO LIQUIDO ALL IN ONE', '6000.00', '0.00', 'n.jpg', 'HAB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Codigo_U` varchar(10) NOT NULL,
  `Nombres_U` varchar(50) NOT NULL,
  `Apellidos_U` varchar(50) NOT NULL,
  `Email_U` varchar(50) NOT NULL,
  `Direccion1_U` varchar(50) NOT NULL,
  `Direccion2_U` varchar(50) DEFAULT NULL,
  `telefono_U` varchar(10) DEFAULT NULL,
  `Id_U` varchar(30) NOT NULL,
  `Clave_U` varchar(20) NOT NULL,
  `Tipo_U` varchar(15) NOT NULL,
  `Estado_U` char(3) DEFAULT 'INH'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Codigo_U`, `Nombres_U`, `Apellidos_U`, `Email_U`, `Direccion1_U`, `Direccion2_U`, `telefono_U`, `Id_U`, `Clave_U`, `Tipo_U`, `Estado_U`) VALUES
('U0001', 'admin', 'admin', 'admin@gmaill.com', 'HACIENDA OJO DE AGUA PLAZA AQUATERRA', '', '558796318', 'Admin', 'root', 'ADMINISTRADOR', 'HAB'),
('U0002', 'DANIEL', 'HORTA DELGADO', 'danielhortadelgado@gmail.com', 'JARDINES DE MORELOS', '', '5548243149', 'DanielH', 'stringer', 'CLIENTE', 'HAB'),
('U0003', 'TOMAS', 'BARRERA ZEPEDA ', 'tomas.b.z@hotmail.com', 'GALENA S/N', '', '5568615288', 'tommy', 'bazt', 'CLIENTE', 'HAB'),
('U0004', 'CARLOS', 'LOPEZ ARREOLA', 'carlitos.lp@hotmail.com', 'MORELOS', 'JOSEFA ORTIZ', '5570670635', 'carlitos', 'puto', 'CLIENTE', 'HAB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `Codigo_V` varchar(20) NOT NULL,
  `Codigo_U` varchar(10) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `Fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`Codigo_V`, `Codigo_U`, `Total`, `Fecha`) VALUES
('V0001', 'U0002', '6750.00', '2020-02-26 01:55:54'),
('V0005', 'U0002', '11250.00', '2020-03-08 22:58:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clase_producto`
--
ALTER TABLE `clase_producto`
  ADD PRIMARY KEY (`Codigo_CP`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD KEY `FK_Codigo_V` (`Codigo_V`),
  ADD KEY `FK_Codigo_P` (`Codigo_P`);

--
-- Indices de la tabla `marca_producto`
--
ALTER TABLE `marca_producto`
  ADD PRIMARY KEY (`Codigo_MP`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Codigo_P`),
  ADD KEY `FK_Codigo_CP` (`Codigo_CP`),
  ADD KEY `FK_Codigo_MP` (`Codigo_MP`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Codigo_U`),
  ADD UNIQUE KEY `U_Id_U` (`Id_U`),
  ADD UNIQUE KEY `U_Email_U` (`Email_U`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`Codigo_V`),
  ADD KEY `FK_Codigo_U` (`Codigo_U`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `FK_Codigo_P` FOREIGN KEY (`Codigo_P`) REFERENCES `producto` (`Codigo_P`),
  ADD CONSTRAINT `FK_Codigo_V` FOREIGN KEY (`Codigo_V`) REFERENCES `venta` (`Codigo_V`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_Codigo_CP` FOREIGN KEY (`Codigo_CP`) REFERENCES `clase_producto` (`Codigo_CP`),
  ADD CONSTRAINT `FK_Codigo_MP` FOREIGN KEY (`Codigo_MP`) REFERENCES `marca_producto` (`Codigo_MP`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FK_Codigo_U` FOREIGN KEY (`Codigo_U`) REFERENCES `usuario` (`Codigo_U`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
