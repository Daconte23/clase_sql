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



