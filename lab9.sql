CREATE FUNCTION sum_of_two_numbers(m integer, n integer) --1
RETURNS integer AS $$
        BEGIN
                RETURN m + n;
        END;
$$ LANGUAGE plpgsql;



CREATE FUNCTION FUN_TO_TEST () RETURNS double precision --2
AS $TEST$ 
BEGIN 
   RETURN 4.295806896E-29; 
END;    
$TEST$  LANGUAGE PLPGSQL


CREATE FUNCTION TODAY_IS () RETURNS CHAR(22) AS  ' --3
BEGIN 
  RETURN ''Today''''is '' || CAST(CURRENT_DATE AS CHAR(10)); 
END; 
' 
LANGUAGE PLPGSQL


newname ALIAS FOR oldname; --4

CREATE FUNCTION FUN_TO_TEST(dt DATE, ing INTEGER) --5
RETURNS DATE AS $test$  
DECLARE ss     ALIAS FOR dt;  
        ff     ALIAS FOR ing; 
BEGIN  
   RETURN ss + ff * INTERVAL '2 DAY';  
END;  
$test$  
LANGUAGE PLPGSQL

DECLARE --6
roll_no student.roll_no%TYPE;


CREATE FUNCTION get_employee(text) RETURNS text AS ' --7
  DECLARE
     frst_name ALIAS FOR $1;
     lst_name employees.last_name%TYPE;
  BEGIN
     SELECT INTO lst_name last_name FROM employees 
	 WHERE first_name = frst_name;
     return frst_name || '' '' || lst_name;
  END;
' LANGUAGE 'plpgsql';


CREATE FUNCTION get_employee (integer) RETURNS text AS ' --8
  DECLARE
    emp_id ALIAS FOR $1;
    found_employee employees%ROWTYPE;
  BEGIN
   SELECT INTO found_employee * FROM employees WHERE employee_id = emp_id;
    RETURN found_employee.first_name || '' '' || found_employee.last_name;
  END;
' LANGUAGE 'plpgsql';

CREATE FUNCTION not_equal(maxa decimal, minb decimal) --9
RETURNS boolean AS $$
BEGIN
    RETURN maxa <> minb;
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION not_equal(fstnm text, lstnm text) --10
RETURNS boolean AS $$
BEGIN
    RETURN fstnm <> lstnm;
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION not_equal(fst_number integer, snd_number integer) --11
RETURNS boolean AS $$
DECLARE
    fstnum integer := fst_number;
    sndname integer:= snd_number;
BEGIN
    RETURN fstnum<> sndname;
END;
$$ LANGUAGE plpgsql;


DECLARE --12
    local_a text COLLATE "en_US";

CREATE FUNCTION get_employee(fstnm text, lstnm text) --13
RETURNS boolean AS $$
BEGIN
    RETURN fstnm < lstnm COLLATE "C";
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION ifstat() --14
RETURNS text AS $$
DECLARE
ss integer;
BEGIN
ss:= 0;
IF ss = 0 THEN 
RETURN 'You have declared zero';
END IF;
END;


CREATE OR REPLACE FUNCTION ifstat (date) --15
RETURNS text 
AS 
$$ 
BEGIN 
   IF EXTRACT(DAY FROM current_date) = 1 
   THEN   
      RETURN '1st day of the Month'; 
   ELSE 
      RETURN 'Other day'; 
   END IF; 
END; 
$$ 
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION no_emp(integer,integer) RETURNS integer AS ' --16
  DECLARE
    emp_id ALIAS FOR $1;
    tot_dept ALIAS FOR $2;
    tmp_id integer;
    no_emp integer;
  BEGIN
    SELECT INTO tmp_id mngr_no FROM employee WHERE
      empno = emp_id;
    IF tmp_id IS NULL THEN
      RETURN -1;
    END IF;
    SELECT INTO no_emp count(*) FROM employee WHERE deptno=tot_dept;
    RETURN no_emp;
  
  END;

CREATE FUNCTION ret_date (crdate date) RETURNS text AS $$ --17
BEGIN 
   IF EXTRACT (MONTH FROM crdate)= 1 
   THEN RETURN 'January'; 
   ELSIF EXTRACT (MONTH FROM crdate)= 2 
   THEN RETURN 'February'; 
   ELSIF EXTRACT (MONTH FROM crdate)= 3 
   THEN RETURN 'March'; 
   ELSIF EXTRACT (MONTH FROM crdate)= 4 
   THEN RETURN 'April'; 
   ELSIF EXTRACT (MONTH FROM crdate)= 5 
   THEN RETURN 'May'; 
   ELSIF EXTRACT (MONTH FROM crdate)= 6 
   THEN RETURN 'June'; 
   ELSIF EXTRACT (MONTH FROM crdate)= 7 
   THEN RETURN 'July'; 
   ELSIF EXTRACT (MONTH FROM crdate)= 8
   THEN RETURN 'August'; 
   ELSIF EXTRACT (MONTH FROM crdate)= 9 
   THEN RETURN 'September'; 
   ELSIF EXTRACT (MONTH FROM crdate)= 10 
   THEN RETURN 'October'; 
   ELSIF EXTRACT (MONTH FROM crdate)= 11
   THEN RETURN 'November'; 
   ELSIF EXTRACT (MONTH FROM crdate)= 12
   THEN RETURN 'December'; 
   END IF; 
END; 
$$ 
LANGUAGE plpgsql
' LANGUAGE 'plpgsql';


SELECT salary, --18
     CASE WHEN department_id =90 THEN 'High Salary'             
	 WHEN department_id =100 THEN '2nd grade salary'            
	 ELSE 'Low Salary'        
	 END 
	 AS salary_status       
	 FROM employees       
	 LIMIT 15;


CREATE OR REPLACE FUNCTION myfunc1 (x integer) RETURNS text AS $$ --19
DECLARE
msg text;
BEGIN 
CASE
    WHEN x IN(2,4,6,8,10) THEN
        msg := 'value even number';
    WHEN x IN(3,5,7,9,11) THEN
        msg := 'value is odd number';
END CASE;
RETURN msg;
END; 
$$ 
LANGUAGE plpgsql


CREATE OR REPLACE FUNCTION myfunction(integer) --20
RETURNS integer AS '
  DECLARE
    nm ALIAS FOR $1;
    cub integer;
  BEGIN
    cub := nm;
    LOOP
      cub := cub * cub * cub;
      EXIT WHEN cub >= 10000;
    END LOOP;
    RETURN cub;
  END;
' LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION myfunction(integer) --21
RETURNS integer AS '
  DECLARE
   nm ALIAS FOR $1;
    cub INTEGER;
  BEGIN
   cub:=nm;
    WHILE cub <=10000 LOOP
      cub := cub * cub * cub;
    END LOOP;
    RETURN cub;
  END;
' LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION myfunction(integer) --22
RETURNS integer AS '
  DECLARE
   nm ALIAS FOR $1;
    cub INTEGER;
  BEGIN
   cub :=nm;
   FOR i IN 0..10000 LOOP
      cub := cub * cub * cub;
    END LOOP;
    RETURN cub;
  END;
' LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION myfunction(dt DATE) --23
RETURNS INTEGER 
AS 
$$ 
DECLARE ddt DATE; 
        num  INTEGER; 
        x  INTEGER; 
BEGIN 
   ddT := dt; 
   x := EXTRACT(MONTH FROM dt); 
   FOR i IN 1 .. 31 
   LOOP  
      num := i;          
      EXIT WHEN EXTRACT(MONTH FROM ddt + i * INTERVAL '1 DAY') <> x; 
   END LOOP; 
   RETURN num-1;    
END; 
$$ 
LANGUAGE PLPGSQL


CREATE OR REPLACE FUNCTION myfunction(integer) RETURNS text AS ' --24
  DECLARE
      depid ALIAS FOR $1;
    output_txt TEXT :=''\n'';
    row_data employees%ROWTYPE;
  BEGIN
    FOR row_data IN SELECT * FROM employees
    WHERE department_id = depid  ORDER BY first_name LOOP
      output_txt := output_txt || row_data.first_name || row_data.last_name || ''\n'';
    END LOOP;
    RETURN output_txt;
  END;
' LANGUAGE 'plpgsql';
	 