/* 

1. Introducción a MySQL
MySQL es un sistema de gestión de bases de datos relacional (RDBMS) basado en SQL (Structured Query Language). Es muy utilizado para aplicaciones web por su rendimiento y facilidad de uso.

Conceptos Básicos:
Base de datos: Colección de datos organizados.
Tabla: Colección de datos organizados en filas y columnas.
Columna: Representa un campo o atributo de la tabla.
Fila: Representa un registro o una entrada de la tabla.

2. Instalación y Configuración
Instalación en Windows:
Descarga e instala MySQL desde el sitio oficial.
Configura el usuario root y asigna una contraseña.

Instalación en Linux: 
sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation

Iniciar sesión en MySQL:
mysql -u root -p

*/

-- 3. Creación de Base de Datos y Tablas
-- Crear una base de datos:

CREATE DATABASE escuela;

-- Seleccionar la base de datos:

USE escuela;

-- Crear una tabla:

CREATE TABLE estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT,
    curso VARCHAR(50)
);

-- Mostrar tablas:

SHOW TABLES;

-- Ver estructura de una tabla:

DESCRIBE estudiantes;

--4. Operaciones CRUD
-- Insertar datos (Create):

INSERT INTO estudiantes (nombre, edad, curso)
VALUES ('Juan Pérez', 20, 'Matemáticas');

-- Consultar datos (Read):

SELECT * FROM estudiantes;

-- Actualizar datos (Update):

UPDATE estudiantes
SET edad = 21
WHERE nombre = 'Juan Pérez';

-- Eliminar datos (Delete):

DELETE FROM estudiantes
WHERE nombre = 'Juan Pérez';

-- 5. Consultas Más Avanzadas
-- Filtrar datos con WHERE:

SELECT * FROM estudiantes
WHERE edad > 18;

-- Ordenar resultados:

SELECT * FROM estudiantes
ORDER BY edad DESC;

-- Uso de funciones agregadas:

SELECT AVG(edad) AS promedio_edad
FROM estudiantes;

/*

Función AVG() en MySQL
La función AVG() en MySQL se utiliza para calcular el promedio (media aritmética) de los valores de una columna numérica. Es una función de agregación, lo que significa que opera sobre un conjunto de filas y devuelve un solo valor.

Sintaxis:

SELECT AVG(columna) AS nombre_promedio
FROM nombre_tabla
[WHERE condición];

columna: Es el nombre de la columna sobre la cual deseas calcular el promedio.
nombre_promedio: Es un alias opcional para el resultado de la función.
WHERE: Opcional. Se utiliza para aplicar filtros y calcular el promedio solo de las filas que cumplen con la condición especificada.

Ejemplo Básico
Supongamos que tenemos una tabla llamada empleados:


CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

-- Insertar datos en la tabla 'empleados'.
INSERT INTO empleados (nombre, salario)
VALUES 
('Juan', 2000.50),
('Ana', 2500.00),
('Luis', 1800.75),
('María', 2200.30);

Podemos utilizar AVG() para calcular el salario promedio:

SELECT AVG(salario) AS salario_promedio
FROM empleados;
Resultado:
salario_promedio
2125.39

Uso con WHERE
Si solo queremos calcular el promedio de los empleados con salario superior a $2,000:

SELECT AVG(salario) AS salario_promedio
FROM empleados
WHERE salario > 2000;
Resultado:
salario_promedio
2233.60

*/

-- Agrupar datos con GROUP BY:

SELECT curso, COUNT(*) AS total_estudiantes
FROM estudiantes
GROUP BY curso;

/*

Uso con GROUP BY
Si queremos calcular el salario promedio por departamento, podemos hacerlo usando GROUP BY. Supongamos que añadimos una columna departamento:

ALTER TABLE empleados
ADD departamento VARCHAR(50);

-- Actualizar los departamentos de los empleados.
UPDATE empleados
SET departamento = 'Ventas'
WHERE nombre IN ('Juan', 'Ana');

UPDATE empleados
SET departamento = 'Marketing'
WHERE nombre IN ('Luis', 'María');

-- Calcular el salario promedio por departamento.
SELECT departamento, AVG(salario) AS salario_promedio
FROM empleados
GROUP BY departamento;
Resultado:
departamento	salario_promedio
Marketing	2000.53
Ventas	2250.25
En este ejemplo:

El promedio del departamento de Marketing se calcula con los salarios de Luis y María.
El promedio del departamento de Ventas se calcula con los salarios de Juan y Ana.


*/



-- Agregando explicación con ejemplos con ayud de IA



-- ##################################
-- # 1. CREAR BASE DE DATOS Y TABLAS #
-- ##################################

-- Crear la base de datos llamada 'tienda'.
CREATE DATABASE tienda;

-- Seleccionar la base de datos.
USE tienda;

-- Crear una tabla llamada 'productos'.
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID único para cada producto.
    nombre VARCHAR(100) NOT NULL,       -- Nombre del producto.
    precio DECIMAL(10, 2) NOT NULL,     -- Precio del producto.
    cantidad INT DEFAULT 0              -- Cantidad en stock (por defecto 0).
);

-- Crear una tabla llamada 'ventas'.
CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID único para cada venta.
    producto_id INT,                    -- ID del producto vendido (relación con 'productos').
    cantidad INT,                       -- Cantidad vendida.
    fecha DATE,                         -- Fecha de la venta.
    FOREIGN KEY (producto_id) REFERENCES productos(id)  -- Llave foránea.
);

-- ####################################
-- # 2. INSERTAR DATOS EN LAS TABLAS  #
-- ####################################

-- Insertar productos en la tabla 'productos'.
INSERT INTO productos (nombre, precio, cantidad)
VALUES 
('Camiseta', 20.50, 50),
('Pantalón', 35.00, 30),
('Zapatos', 50.00, 20);

-- Insertar datos en la tabla 'ventas'.
INSERT INTO ventas (producto_id, cantidad, fecha)
VALUES 
(1, 2, '2024-11-10'),
(2, 1, '2024-11-10'),
(3, 5, '2024-11-09');

-- ####################################
-- # 3. CONSULTAS BÁSICAS (READ)      #
-- ####################################

-- Mostrar todos los productos.
SELECT * FROM productos;

-- Mostrar todas las ventas.
SELECT * FROM ventas;

-- Consultar productos cuyo precio es mayor a 30.
SELECT * FROM productos
WHERE precio > 30;

-- Ordenar productos por precio de mayor a menor.
SELECT * FROM productos
ORDER BY precio DESC;

-- ####################################
-- # 4. FUNCIONES DE AGREGACIÓN       #
-- ####################################

-- Calcular el total de productos en stock.
SELECT SUM(cantidad) AS total_stock
FROM productos;

-- Calcular el precio promedio de los productos.
SELECT AVG(precio) AS precio_promedio
FROM productos;

-- Contar el número total de productos.
SELECT COUNT(*) AS total_productos
FROM productos;

-- Obtener el precio máximo y mínimo de los productos.
SELECT MAX(precio) AS precio_maximo, MIN(precio) AS precio_minimo
FROM productos;

-- ####################################
-- # 5. FUNCIONES ESCALARES           #
-- ####################################

-- Convertir el nombre del producto a mayúsculas.
SELECT UPPER(nombre) AS nombre_mayuscula
FROM productos;

-- Obtener la longitud del nombre del producto.
SELECT nombre, LENGTH(nombre) AS longitud_nombre
FROM productos;

-- Redondear el precio de los productos a un decimal.
SELECT nombre, ROUND(precio, 1) AS precio_redondeado
FROM productos;

-- ####################################
-- # 6. FUNCIONES DE FECHA Y HORA     #
-- ####################################

-- Mostrar la fecha y hora actual.
SELECT NOW() AS fecha_hora_actual;

-- Extraer solo la fecha actual.
SELECT DATE(NOW()) AS fecha_actual;

-- Formatear la fecha actual (día/mes/año).
SELECT DATE_FORMAT(NOW(), '%d/%m/%Y') AS fecha_formateada;

-- Calcular la diferencia en días entre dos fechas.
SELECT DATEDIFF('2024-12-01', '2024-11-10') AS dias_diferencia;

-- ####################################
-- # 7. FUNCIONES DE TEXTO            #
-- ####################################

-- Concatenar texto para describir el producto.
SELECT CONCAT('Producto: ', nombre, ' - Precio: $', precio) AS descripcion
FROM productos;

-- Extraer las primeras 3 letras del nombre del producto.
SELECT SUBSTRING(nombre, 1, 3) AS iniciales
FROM productos;

-- Reemplazar 'Camiseta' por 'Playera' en el nombre del producto.
SELECT REPLACE(nombre, 'Camiseta', 'Playera') AS nombre_modificado
FROM productos;

-- ####################################
-- # 8. FUNCIONES DE CONTROL DE FLUJO #
-- ####################################

-- Usar IF para evaluar la cantidad de productos.
SELECT nombre,
       IF(cantidad > 25, 'Alta disponibilidad', 'Baja disponibilidad') AS disponibilidad
FROM productos;

-- Usar CASE para clasificar los productos según la cantidad.
SELECT nombre,
       CASE
           WHEN cantidad > 40 THEN 'Mucho stock'
           WHEN cantidad BETWEEN 20 AND 40 THEN 'Stock moderado'
           ELSE 'Poco stock'
       END AS clasificacion_stock
FROM productos;

-- ####################################
-- # FIN DEL CÓDIGO                   #
-- ####################################




