-- IMPORTANT NOTES
-- HAVING -> groups, WHERE -> rows
-- FOREIGN KEY must be a primary key in the original table

CREATE DATABASE UNIVERSITY

CREATE TABLE DEPARTMENT(
DEPT_NAME VARCHAR(50),
PRIMARY KEY(DEPT_NAME));

CREATE TABLE EMPLOYEE(
ID INT PRIMARY KEY,
AGE INT UNSIGNED NOT NULL CHECK (AGE >= 18),
EMAIL VARCHAR(50) UNIQUE,
dept_name VARCHAR(50) DEFAULT "NEW COMER",
NAME VARCHAR(50),
FOREIGN KEY (dept_name) references DEPARTMENT(DEPT_NAME) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO DEPARTMENT VALUES ("ELECTRICAL");
INSERT INTO DEPARTMENT VALUES ("ELECTRICAL 1");
INSERT INTO DEPARTMENT VALUES ("MECHANICAL");
INSERT INTO DEPARTMENT VALUES ("NEW COMER");
INSERT INTO EMPLOYEE VALUES (1, 24, "shaado@gmail.com", "ELECTRICAL", "Shaado");
INSERT INTO EMPLOYEE VALUES (2, 31, "cheeda@gmail.com","MECHANICAL", "Cheeda");
INSERT INTO EMPLOYEE(ID, AGE, NAME, EMAIL) VALUES (3, 25, "Maaja", "maaja@gmail.com");
INSERT INTO EMPLOYEE VALUES (4, 24, "kaaka@gmail.com", "ELECTRICAL", "Kaaka");
INSERT INTO EMPLOYEE VALUES (5, 24, "teepu@gmail.com", "ELECTRICAL", "Teepu");

-- SELECT * FROM DEPARTMENT
-- SELECT * FROM EMPLOYEE
-- SELECT AGE FROM EMPLOYEE
-- SELECT ID, AGE FROM EMPLOYEE
-- SELECT DISTINCT AGE FROM EMPLOYEE
-- SELECT * FROM EMPLOYEE WHERE AGE > 30;
-- SELECT * FROM EMPLOYEE WHERE AGE > 30 AND NAME = "Cheeda"
-- SELECT * FROM EMPLOYEE WHERE AGE > 30 OR NAME = "Cheeda"
-- SELECT * FROM EMPLOYEE WHERE AGE BETWEEN 20 AND 30 --20 and 30 are included as well
-- SELECT * FROM EMPLOYEE WHERE dept_name IN ("ELECTRICAL", "MECHANICAL", "CIVIL")
-- SELECT * FROM EMPLOYEE WHERE dept_name NOT IN ("ELECTRICAL")
-- SELECT * FROM EMPLOYEE LIMIT 3
-- SELECT * FROM EMPLOYEE WHERE AGE > 10 LIMIT 3
-- SELECT * FROM EMPLOYEE ORDER BY AGE DESC
-- SELECT * FROM EMPLOYEE ORDER BY AGE DESC LIMIT 3
-- SELECT MAX(AGE) FROM EMPLOYEE
-- SELECT dept_name, count(NAME) FROM EMPLOYEE GROUP BY dept_name
-- SELECT AGE, NAME FROM EMPLOYEE WHERE dept_name = "ELECTRICAL" GROUP BY AGE, NAME HAVING AGE < 30 ORDER BY AGE ASC

-- UPDATE EMPLOYEE SET dept_name="ELECTRICAL 1" WHERE dept_name="ELECTRICAL";
-- SELECT * FROM EMPLOYEE

-- UPDATE EMPLOYEE SET AGE=AGE+1;
-- SELECT * FROM EMPLOYEE

-- DELETE FROM EMPLOYEE WHERE AGE < 30;
-- SELECT * FROM EMPLOYEE;

-- DELETE FROM EMPLOYEE; -- All table data deleted
-- SELECT * FROM EMPLOYEE;

-- ALTER TABLE EMPLOYEE ADD COLUMN GENDER VARCHAR(10);
-- SELECT * FROM EMPLOYEE;
-- ALTER TABLE EMPLOYEE DROP COLUMN GENDER;
-- SELECT * FROM EMPLOYEE;

-- ALTER TABLE EMPLOYEE RENAME TO EMPLOYEES;
-- ALTER TABLE EMPLOYEES CHANGE COLUMN ID EMP_ID INT;
-- SELECT * FROM EMPLOYEES;

-- ALTER TABLE EMPLOYEE MODIFY COLUMN NAME CHAR(50);
-- SELECT * FROM EMPLOYEE;

-- TRUNCATE TABLE EMPLOYEE;  // Table exists, data deleted
-- SELECT * FROM EMPLOYEE;
-- DROP TABLE EMPLOYEE;
-- SELECT * FROM EMPLOYEE;

-- SELECT NAME FROM EMPLOYEE INNER JOIN DEPARTMENT ON EMPLOYEE.dept_name=DEPARTMENT.DEPT_NAME;
-- SELECT * FROM EMPLOYEE as E INNER JOIN DEPARTMENT as D ON E.dept_name=D.DEPT_NAME;
-- SELECT NAME FROM EMPLOYEE LEFT JOIN DEPARTMENT ON EMPLOYEE.dept_name=DEPARTMENT.DEPT_NAME;
