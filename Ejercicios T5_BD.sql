-- Ejercicio 1.1 --

SELECT nombreCentroTrabajo FROM centrostrabajo 
ORDER BY nombreCentroTrabajo;

-- Ejercicio 1.2 --

SELECT nombreEmpleado AS 'Empleado' FROM empleados WHERE idDepartamentoFK = '121';

-- Ejercicio 1.3 --

SELECT * FROM departamentos WHERE idDepartamento = '121';

-- Ejercicio 1.4 --

SELECT nombreEmpleado AS 'Empleado', salarioEmpleado AS 'Salario' 
FROM empleados WHERE hijosEmpleado > 3 ORDER BY nombreEmpleado;

-- Ejercicio 1.5 --

-- Sacar comisión --
SELECT comisionEmpleado AS 'Comisión',
-- Sacar departamentoFK -- 
idDepartamentoFK AS 'Nº Departamento', 
-- Sacar nombre --
nombreEmpleado AS 'Empleado' 
-- Ordenar por el segundo campo y el primero descendentemente--
FROM empleados WHERE salarioEmpleado < 1900 ORDER BY 2,1 DESC;

-- Ejercicio 1.6 --

SELECT nombreDepartamento AS 'Departamento' 
FROM departamentos WHERE presupuestoDepartamento > 10;

-- Ejercicio 1.7 --

SELECT DISTINCT idDepartamentoFK AS 'Nº Departamento' 
FROM empleados WHERE salarioEmpleado < 2000 ORDER BY 1;

-- Ejercicio 1.8 --

SELECT DISTINCT comisionEmpleado AS 'Comisiones' FROM empleados WHERE idDepartamentoFK = 110;

-- Ejercicio 1.9 --

SELECT nombreDepartamento AS 'Departamento' 
FROM departamentos WHERE tipoDirectorDepartamento = 'F';


-- Ejercicio 1.10 --

SELECT nombreEmpleado, idEmpleado, extensionEmpleado 
FROM empleados WHERE idDepartamentoFK = 121;

-- Ejercicio 1.11 --

SELECT extensionEmpleado FROM empleados ORDER BY extensionEmpleado ASC;

-- Ejercicio 1.12 --

SELECT comisionEmpleado AS 'Comisión Empleado', 
nombreEmpleado AS 'Nombre Empleado', 
salarioEmpleado AS 'Salario Empleado' 
FROM empleados WHERE hijosEmpleado > 3 ORDER BY comisionEmpleado ASC;

-- Ejercicio 1.13 --

SELECT salarioEmpleado, nombreEmpleado 
FROM empleados WHERE hijosEmpleado = 0 ORDER BY comisionEmpleado DESC;

-- Ejercicio 2.1 --

SELECT nombreEmpleado AS 'Empleado', CONCAT(salarioEmpleado * 12, '€') AS 'Salario' 
FROM empleados WHERE idDepartamentoFK = 100 ORDER BY salarioEmpleado DESC;

-- Ejercicio 2.2 --
SELECT nombreEmpleado AS 'Empleado'
FROM empleados WHERE comisionEmpleado >= salarioEmpleado * 0.5
ORDER BY nombreEmpleado;

-- Ejercicio 2.3 --
SELECT nombreEmpleado AS 'Empleado', salarioEmpleado+(hijosEmpleado*500) AS 'Gratificación' 
FROM empleados WHERE hijosEmpleado >= 4 ORDER BY 1;

-- Ejercicio 2.4 --
SELECT CONCAT('Departamento de ', nombreDepartamento) AS 'Departamentos' FROM departamentos
WHERE presupuestoDepartamento < 5 ORDER BY nombreDepartamento;

-- Ejercicio 2.5 --
SELECT nombreDepartamento AS 'Departamento', 
CONCAT(ROUND((presupuestoDepartamento/12*9 + presupuestoDepartamento/12*3*1.1),2), '€') AS 'Presupuesto'
FROM departamentos WHERE presupuestoDepartamento/12*9 > 5 ORDER BY 1;

-- Ejercicio 2.6 --

SELECT nombreEmpleado AS 'Empleado', 
CONCAT(ROUND(salarioEmpleado*12, 2), '€') AS 'Actual Anual',
CONCAT(ROUND(salarioEmpleado*12*1.06, 2), '€') AS '2020',
CONCAT(ROUND(salarioEmpleado*12*1.06*1.06, 2), '€') AS '2021',
CONCAT(ROUND(salarioEmpleado*12*1.06*1.06*1.06, 2), '€') AS '2022'
FROM empleados WHERE hijosEmpleado > 4 ORDER BY 1;

-- Ejercicio 2.7 --

SELECT nombreEmpleado AS 'Empleado' 
FROM empleados 
WHERE comisionEmpleado * 1000 < salarioEmpleado * 12 / 10
ORDER BY 1;

-- Ejercicio 2.8 

SELECT nombreEmpleado AS 'Empleado', 
CONCAT(salarioEmpleado+comisionEmpleado, '€') AS 'Salario Total' 
FROM empleados
WHERE idDepartamentoFK = 112
ORDER BY 2 DESC;

-- Ejercicio 2.9 --

SELECT nombreEmpleado AS 'Empleado', 
CONCAT(salarioEmpleado+comisionEmpleado, '€')  AS 'Salario Total'
FROM empleados 
WHERE (salarioEmpleado+comisionEmpleado) > 3000 
ORDER BY idEmpleado;

-- Ejercicio 2.10 --

SELECT DISTINCT idDepartamentoFK AS 'Departamento' FROM empleados 
WHERE comisionEmpleado > salarioEmpleado * 0.2 ORDER BY 1;

-- Ejercicio 3.1.1 Versión Cutre para momentos Cutres 1--

SELECT nombreEmpleado AS 'Empleado' 
FROM empleados 
WHERE salarioEmpleado >= 4500 
ORDER BY 1;

-- Ejercicio 3.1.1 Versión Pro 1 --

SELECT nombreEmpleado AS 'Empleado' 
FROM empleados 
WHERE salarioEmpleado >= 
	-- SubConsulta --
	(SELECT salarioEmpleado 
    FROM empleados 
    WHERE nombreEmpleado = 'FIERRO, CLAUDIA')*1.5 
ORDER BY 1;

-- Ejercicio Resuelto tema --

SELECT nombreEmpleado AS 'Empleado' FROM empleados 
WHERE salarioEmpleado < ANY (SELECT MAX(comisionEmpleado) FROM empleados
GROUP BY idDepartamentoFK);

-- Ejercicio 3.1.2 --

SELECT salarioEmpleado+comisionEmpleado AS 'Salario',
ROUND(100*comisionEmpleado/(salarioEmpleado+comisionEmpleado),0) AS '% comisión' 
FROM empleados 
WHERE comisionEmpleado > 0 
ORDER BY nombreEmpleado;

-- Ejercicio 3.2.1 --

SELECT nombreDepartamento AS 'Departamento' 
FROM departamentos WHERE idDepartamentoFK IS null;

-- Ejercicio 3.3.1 --

SELECT nombreEmpleado 
FROM empleados 
WHERE salarioEmpleado > (SELECT MAX(salarioEmpleado) FROM empleados 
WHERE idDepartamentofk = 122)
ORDER BY 1;