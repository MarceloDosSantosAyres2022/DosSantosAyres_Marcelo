DROP DATABASE IF EXISTS sistema;
CREATE DATABASE sistema CHARACTER SET utf8mb4;
USE sistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado boolean NOT NULL
);
CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
INSERT INTO departamentos VALUES(1, 'Desarrollo', 120000, true);
INSERT INTO departamentos VALUES(2, 'Sistemas', 150000, true);
INSERT INTO departamentos VALUES(3, 'Recursos Humanos', 280000, true);
INSERT INTO departamentos VALUES(4, 'Contabilidad', 110000, true);
INSERT INTO departamentos VALUES(5, 'I+D', 375000, true);
INSERT INTO departamentos VALUES(6, 'Proyectos', 0,true );
INSERT INTO departamentos VALUES(7, 'Publicidad', 0, true);
INSERT INTO departamentos VALUES(8, 'Comercial', 0, false);
INSERT INTO empleados VALUES(1, '27-32481596-3', 'Aarón', 'Rivero', 1, true);
INSERT INTO empleados VALUES(2, '27-29557532-1', 'Adela', 'Salas', 2, true);
INSERT INTO empleados VALUES(3, '20-36970642-1', 'Adolfo', 'Rubio', 3, true);
INSERT INTO empleados VALUES(4, '20-41705545-1', 'Adrián', 'Suárez', 4, true);
INSERT INTO empleados VALUES(5, '20-17087203-3', 'Marcos', 'Loyola', 5, true);
INSERT INTO empleados VALUES(6, '27-38382980-3', 'María', 'Santana', 1, true);
INSERT INTO empleados VALUES(7, '23-80576669-1', 'Pilar', 'Ruiz', 2, true);
INSERT INTO empleados VALUES(8, '24-71651431-3', 'Pepe', 'Ruiz', 3, true);
INSERT INTO empleados VALUES(9, '25-36399183-3', 'Juan', 'Gómez', 2, true);
INSERT INTO empleados VALUES(10, '20-34638446-3', 'Diego','Flores', 5, true);
INSERT INTO empleados VALUES(11, '27-36738983-3', 'Marta','Herrera', 1, true);
INSERT INTO empleados VALUES(12, '27-44123836-1', 'Irene','Salas', NULL, false);
INSERT INTO empleados VALUES(13, '20-38265162-1', 'Juan Antonio','Perez', NULL, true);

-- 1. Lista el apellido de todos los empleados.
select apellido from EMPLEADOS;
-- 2. Lista el apellido de los empleados eliminando los apellidos que estén repetidos.
select distinct apellido from EMPLEADOS;
-- 3. Lista todas las columnas de la tabla empleados.
Select idemplaedo, cuil_cuit, nombre, apellido, id_departamento, estado from EMPLEADOS;
-- 4. Lista el nombre y apellido de todos los empleados.
select nombre, apellido from EMPLEADOS;
-- 5. Lista el cuit/cuil de los departamentos de los empleados que aparecen en la tabla empleados.
select id_departamento, cuil_cuit from empleados;

-- 6. Lista el nombre y apellido de los empleados en una única columna.
select concat(nombre,' ', apellido) as  nombre_completo from EMPLEADOS;
-- 7. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
select upper( concat(nombre,' ', apellido)) as  nombre_completo from EMPLEADOS;

-- 8. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
select lower( concat(nombre,' ', apellido)) as  nombre_completo from EMPLEADOS;
-- 9. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
select concat(nombre,' ', apellido) as  nombre_completo from EMPLEADOS;
-- 10. Lista el nombre de todos los departamentos ordenados de forma ascendente.
select * from departamentos order by nombre asc ;
-- 11. Lista el nombre de todos los departamentos ordenados de forma descendente.
select * from departamentos order by nombre desc;
-- 12. Lista el apellido y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar su apellido y luego su nombre.
select apellido, nombre from EMPLEADOS order by apellido asc;
-- 13. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
select nombre, presupuesto from departamentos order by presupuesto desc limit 3;

-- 14. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
select nombre, presupuesto from departamentos order by presupuesto asc limit 3; 

-- 15. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a $150000.
select nombre, presupuesto from departamentos where presupuesto >150000;

-- 16. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
select nombre, presupuesto from departamentos where 100000 < presupuesto and presupuesto < 200000;
-- 17. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
select nombre, presupuesto from departamentos where 100000 > presupuesto or presupuesto > 200000;

-- 18. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
select nombre, presupuesto from departamentos where presupuesto between 100000 and 200000;

-- 19. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
select nombre, presupuesto from departamentos where presupuesto not between 100000 and 200000;

-- 20. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.

select empleados.apellido, empleados.nombre, departamentos.nombre, departamentos.presupuesto from empleados inner join departamentos on  empleados.id_departamento = departamentos.iddepartamento;


-- 21. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, 
-- en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por apellido y el nombre de los empleados.
select  departamentos.nombre, departamentos.presupuesto, empleados.apellido, empleados.nombre from 
empleados inner join departamentos on  empleados.id_departamento = departamentos.iddepartamento order by departamentos.nombre asc ;

-- 22. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
SELECT departamentos.iddepartamento, departamentos.nombre FROM departamentos inner join empleados
 on departamentos.iddepartamento = empleados.id_departamento where empleados.id_departamento is not null;

-- 23. Devuelve el nombre del departamento donde trabaja el empleado que tiene el cuit
-- 27-38382980-3. 
SELECT departamentos.nombre FROM departamentos inner join empleados
 on departamentos.iddepartamento = empleados.id_departamento where empleados.cuil_cuit = '27-38382980-3';

-- 24. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz.
select departamentos.nombre from departamentos inner join empleados on departamentos.iddepartamento = empleados.id_departamento
where empleados.nombre = 'Pepe' and empleados.apellido = 'Ruiz';

-- 25. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
select empleados.idemplaedo, departamentos.iddepartamento, empleados.nombre,  empleados.apellido, empleados.cuil_cuit, empleados.estado, departamentos.nombre
  from empleados inner join departamentos on departamentos.iddepartamento = empleados.id_departamento
where departamentos.nombre = 'I+D' order by empleados.apellido asc;


-- 26. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
select empleados.idemplaedo, departamentos.iddepartamento, empleados.nombre,  empleados.apellido, empleados.cuil_cuit, empleados.estado, departamentos.nombre
  from empleados inner join departamentos on departamentos.iddepartamento = empleados.id_departamento
where  departamentos.nombre = 'Sistemas' or departamentos.nombre = 'Contabilidad' or departamentos.nombre = 'I+D' order by empleados.apellido asc;

-- 27. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre $100000 y $200000.
select empleados.nombre,  empleados.apellido  from empleados inner join departamentos on departamentos.iddepartamento = empleados.id_departamento
where departamentos.presupuesto not between 100000 and 200000;





 
