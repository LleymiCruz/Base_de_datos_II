SET SERVEROUTPUT ON;
----------Ejercicio 1--------------------------------
DECLARE 
nombre VARCHAR2(50);
apellido1 VARCHAR2(50);
apellido2 VARCHAR(50);

BEGIN
nombre:='lleymi';
apellido1:='cruz';
apellido2:='Montoya';

DBMS_OUTPUT.PUT_LINE(UPPER(SUBSTR(nombre,1,1) || '.' || SUBSTR(apellido1,1,1) ||'.' || SUBSTR(apellido2,1,1)));
END;
/
----------Ejercicio 2--------------------------------
DECLARE 
numero NUMBER;
residuo NUMBER;

BEGIN
numero:=23;
residuo:=MOD(numero,2);
    IF 
    
           residuo=0
        THEN
           DBMS_OUTPUT.PUT_LINE('El número ' || numero || ' es par');
        ELSIF residuo=1
        THEN
             DBMS_OUTPUT.PUT_LINE('El número ' || numero || ' es impar');
        ELSE 
         DBMS_OUTPUT.PUT_LINE('El número ' || numero || ' no es entero, por tanto, no es par ni impar');
    END IF;         

END;
/
----------Ejercicio 3--------------------------------
DECLARE 
    salario_maximo EMPLOYEES.SALARY%TYPE;

BEGIN
    SELECT MAX(EMPLOYEES.SALARY) INTO salario_maximo FROM EMPLOYEES WHERE department_id=100;
    DBMS_OUTPUT.PUT_LINE('El salario máximo del departamento con ID 100 es: '||salario_maximo);
END;
/

----------Ejercicio 4--------------------------------
DECLARE 
    id_departamento DEPARTMENTS.DEPARTMENT_ID%TYPE;
    nombre_dep DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    numero_empleados INTEGER;
BEGIN
    id_departamento:=100;
    SELECT DEPARTMENTS.DEPARTMENT_NAME INTO nombre_dep FROM DEPARTMENTS WHERE DEPARTMENT_ID=id_departamento;
    SELECT COUNT(*) INTO numero_empleados FROM EMPLOYEES WHERE DEPARTMENT_ID=id_departamento;
    DBMS_OUTPUT.PUT_LINE('Departamento: ' || nombre_dep);
    DBMS_OUTPUT.PUT_LINE('N° de empleados: ' || numero_empleados);

END;
/

----------Ejercicio 5--------------------------------
DECLARE 
    salario_maximo EMPLOYEES.SALARY%TYPE;
    salario_minimo EMPLOYEES.SALARY%TYPE;
    diferencia NUMBER;
BEGIN
    SELECT MAX(EMPLOYEES.SALARY) INTO salario_maximo FROM EMPLOYEES;
    SELECT MIN(EMPLOYEES.SALARY) INTO salario_minimo FROM EMPLOYEES;
    diferencia:=salario_maximo-salario_minimo;
    DBMS_OUTPUT.PUT_LINE('Salario máximo: ' || salario_maximo);
    DBMS_OUTPUT.PUT_LINE('Salario minimo: ' || salario_minimo);
    DBMS_OUTPUT.PUT_LINE('Su diferencia es: ' || diferencia);

END;
/