--@Author: MaurosMJ

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE

  vcursor_id   INTEGER;
  vrowcount    NUMBER;
  vfirst_name  VARCHAR2(30);
  vlast_name   VARCHAR2(30);

BEGIN

  vcursor_id  :=  DBMS_SQL.OPEN_CURSOR;

  DBMS_SQL.PARSE(vcursor_id,'SELECT first_name,last_name FROM employees', DBMS_SQL.NATIVE);

  DBMS_SQL.DEFINE_COLUMN(vcursor_id,1,vfirst_name,30);

  DBMS_SQL.DEFINE_COLUMN(vcursor_id,2,vlast_name,30);

  vrowcount := DBMS_SQL.EXECUTE_AND_FETCH(vcursor_id);

  LOOP

    EXIT WHEN DBMS_SQL.FETCH_ROWS(vcursor_id) = 0;

    DBMS_SQL.COLUMN_VALUE(vcursor_id,1,vfirst_name);

    DBMS_SQL.COLUMN_VALUE(vcursor_id,2,vlast_name);

    DBMS_OUTPUT.PUT_LINE(vlast_name||', '||vfirst_name);

   END LOOP;

   DBMS_SQL.CLOSE_CURSOR(vcursor_id);

END;
	  
