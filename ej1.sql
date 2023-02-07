DROP DATABASE IF EXISTS personal;
CREATE DATABASE personal CHARACTER SET utf8mb4;
USE personal;

CREATE TABLE departamentos (
id_depto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre_depto VARCHAR(20) NOT NULL,
  ciudad VARCHAR(15) NULL,
  nombre_jefe_depto CHAR(30) NULL
);


CREATE TABLE empleados (
  id_emp INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre CHAR(30) NOT NULL,
  sex_emp CHAR(1) NOT NULL,
  fec_nac DATE NOT NULL,
  fec_incorporacion DATE NOT NULL,
  sal_emp FLOAT NOT NULL,
  comision_emp FLOAT NOT NULL,
  cargo_emp VARCHAR(15) NOT NULL,
  id_depto INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_depto) REFERENCES departamentos(id_depto)
  );


-- Insertar datos en la tabla `departamentos`

INSERT INTO `departamentos` VALUES (1000,'GERENCIA','CIUDAD REAL','Bruno Cebrian');
INSERT INTO `departamentos` VALUES (1500,'PRODUCCIÓN','CIUDAD REAL','Jesica Duran');
INSERT INTO `departamentos` VALUES (2000,'VENTAS','CIUDAD REAL','Alicia Andres');
INSERT INTO `departamentos` VALUES (2100,'VENTAS','BARCELONA','Fabian Soto');
INSERT INTO `departamentos` VALUES (2200,'VENTAS','VALENCIA','Mari Plaza');
INSERT INTO `departamentos` VALUES (2300,'VENTAS','MADRID','Jonatan Acuña');
INSERT INTO `departamentos` VALUES (3000,'INVESTIGACIÓN','CIUDAD REAL','Valentina Sola');
INSERT INTO `departamentos` VALUES (3500,'MERCADEO','CIUDAD REAL','Abraham Diego');
INSERT INTO `departamentos` VALUES (4000,'MANTENIMIENTO','CIUDAD REAL','Raúl Carrero');
INSERT INTO `departamentos` VALUES (4100,'MANTENIMIENTO','BARCELONA','Catalina Valdes');
INSERT INTO `departamentos` VALUES (4200,'MANTENIMIENTO','VALENCIA','Adriana Rocha');
INSERT INTO `departamentos` VALUES (4300,'MANTENIMIENTO','MADRID','German Luna');

-- Insertar datos en la tabla `empleados`

INSERT INTO `empleados` VALUES (222,'José Giraldo','M','1985-01-20','2000-11-01',1200000,400000,'Asesor',3500);
INSERT INTO `empleados` VALUES (333,'Pedro Blanco','M','1987-10-28','2000-10-01',800000,3000000,'Vendedor',2000);
INSERT INTO `empleados` VALUES (444,'Jesús Alfonso','M','1988-03-14','2000-10-01',800000,3500000,'Vendedor',2000);
INSERT INTO `empleados` VALUES (555,'Julián Mora','M','1989-07-03','2000-10-01',800000,3100000,'Vendedor',2200);
INSERT INTO `empleados` VALUES (666,'Manuel Millán','M','1990-12-08','2004-06-01',800000,3700000,'Vendedor',2300);
INSERT INTO `empleados` VALUES (777,'Marcos Cortez','M','1986-06-23','2000-04-16',2550000,500000,'Mecánico',4000);
INSERT INTO `empleados` VALUES (782,'Antonio Gil','M','1980-01-23','2010-04-16',850000,1500000,'Técnico',1500);
INSERT INTO `empleados` VALUES (219,'Melissa Roa','F','1960-06-19','2001-03-16',2250000,2500000,'Vendedor',2100);
INSERT INTO `empleados` VALUES (111,'Irene Díaz','F','1979-09-28','2004-06-01',1050000,200000,'Mecánico',4200);
INSERT INTO `empleados` VALUES (383,'Luis Pérez','M','1956-02-25','2000-01-01',5050000,0,'Director',1500);
INSERT INTO `empleados` VALUES (060,'Darío Casas','M','1960-04-05','1992-11-01',4500000,500000,'Investigador',3000);
INSERT INTO `empleados` VALUES (802,'William Daza','M','1982-10-09','1999-12-16',2250000,1000000,'Investigador',3000);
INSERT INTO `empleados` VALUES (221,'Carla López','F','1975-05-11','2005-07-16',4500000,500000,'Jefe Mercadeo',3500);
INSERT INTO `empleados` VALUES (331,'Carlos Rozo','M','1975-05-11','2001-09-16',750000,500000,'Vigilante',3500);
INSERT INTO `empleados` VALUES (099,'Diana Solarte','F','1957-11-19','1990-05-16',1250000,500000,'Secretaria',1000);
INSERT INTO `empleados` VALUES (144,'Rosa Angulo','F','1957-03-15','1998-08-16',3250000,3500000,'Jefe Ventas',2000);
INSERT INTO `empleados` VALUES (269,'María Rojas','F','1959-01-15','1990-05-16',6250000,1500000,'Gerente',1000);
INSERT INTO `empleados` VALUES (343,'Elisa Rojas','F','1979-09-28','2004-06-01',3000000,1000000,'Jefe Mecánicos',4000);
INSERT INTO `empleados` VALUES (334,'Marisol Pulido','F','1979-10-01','1990-05-16',3250000,1000000,'Investigador',3000);
INSERT INTO `empleados` VALUES (335,'Ana Moreno','F','1992-01-05','2004-06-01',1200000,400000,'Secretaria',3000);
INSERT INTO `empleados` VALUES (336,'Carolina Ríos','F','1992-02-15','2000-10-01',1250000,500000,'Secretaria',1500);
INSERT INTO `empleados` VALUES (337,'Edith Muñoz','F','1992-03-31','2000-10-01',800000,3600000,'Vendedor',2100);
INSERT INTO `empleados` VALUES (338,'Abel Gómez','M','1939-12-24','2000-10-01',1050000,200000,'Mecánico',4300);
INSERT INTO `empleados` VALUES (689,'Mario Llano','M','1945-08-30','1990-05-16',2250000,2500000,'Vendedor',2300);
INSERT INTO `empleados` VALUES (785,'Joaquín Rosas','M','1947-07-07','1990-05-16',2250000,2500000,'Vendedor',2200);
INSERT INTO `empleados` VALUES (898,'Iván Duarte','M','1955-08-12','1998-05-16',1050000,200000,'Mecánico',4100);


select*from empleados;
select*from departamentos;
select nombre_depto from departamentos;
select nombre, sal_emp from empleados;
select comision_emp from empleados;
select*from empleados where cargo_emp = 'Secretaria';
select*from empleados where cargo_emp = 'Vendedor' order by nombre asc;
select nombre, cargo_emp from empleados order by sal_emp desc;
select nombre from empleados where cargo_emp like'%Jefe%' and id_depto=3500;
select nombre as nombre, cargo_emp as cargo from empleados;
select nombre, sal_emp, comision_emp from empleados where id_depto = 2000 order by comision_emp desc;
select nombre, (sal_emp+comision_emp)+500 "Salario final" from empleados where id_depto = 3000 order by nombre asc;
select*from empleados where nombre like'j_%' order by nombre asc;
select nombre, sal_emp, comision_emp, (sal_emp+comision_emp)+500 "Salario final" from empleados where comision_emp > 1000;
select nombre, sal_emp, comision_emp, (sal_emp+comision_emp)+500 "Salario final" from empleados where comision_emp = 0;
select nombre, sal_emp, comision_emp, (sal_emp+comision_emp)+500 "Salario final" from empleados where comision_emp > sal_emp;
select nombre, sal_emp, comision_emp, (sal_emp+comision_emp)+500 "Salario final" from empleados where comision_emp >= sal_emp*0.30;
select*from empleados where not nombre like '%ma%' ;
select* from departamentos where nombre_depto in ("ventas", "Mantenimiento", "Investigacion"); 
select* from departamentos where nombre_depto not in ("ventas", "Mantenimiento", "Investigacion"); 
select max(sal_emp) from empleados;
select max(nombre) from empleados order by nombre asc;
select min(sal_emp) "salario minimo", max(sal_emp)"salario maximo", (max(sal_emp)-min(sal_emp))"diferencia" from empleados;
select round(avg(sal_emp)) "salario promedio", d.nombre_depto as nombre from empleados e inner join departamentos d on e.id_depto = d.id_depto group by e.id_depto;

select id_depto from empleados group by id_depto having count(id_depto)>3;
select departamentos.nombre_depto, count(empleados.id_emp) "cantidad_empleados" from departamentos inner join empleados on departamentos.id_depto = empleados.id_depto group by departamentos.id_depto having count(empleados.id_depto) > 3;

INSERT INTO departamentos values(4500,'Jefe MandaMas','La Plata City','Agustin');
select nombre_depto from departamentos d left join empleados e on e.id_depto = d.id_depto where e.id_depto is null;
select nombre "nombre", nombre_depto "departamento", nombre_jefe_depto "jefe" from empleados e left join departamentos d on d.id_depto = e.id_depto;
select round(avg(sal_emp)) "salario promedio", d.nombre_depto as nombre from empleados e inner join departamentos d on e.id_depto = d.id_depto group by e.id_depto;
select e.nombre, e.sal_emp, d.nombre_depto, d.id_depto, e.id_depto from empleados e inner join departamentos d on d.id_depto = e.id_depto where sal_emp >= (select avg(sal_emp) from empleados) order by d.nombre_depto asc;



