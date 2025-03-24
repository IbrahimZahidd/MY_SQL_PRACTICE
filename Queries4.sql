                                       -- TABLES:

CREATE TABLE STUDENT(
  SURNAME VARCHAR(20),
  GIVEN_NAMES VARCHAR(50),
  STUDENT_ID INT,
  DOB DATE,
  AGE INT UNSIGNED NOT NULL CHECK(AGE>=18),
  EMAIL VARCHAR(50) UNIQUE,
  PRIMARY KEY(STUDENT_ID)
);

CREATE TABLE PROGRAM (
  NAME VARCHAR(50) UNIQUE,
  CREDIT_POINTS INT,
  PROGRAM_ID INT,
  PRIMARY KEY(PROGRAM_ID)
);

-- 000 means program_id not assigned to course yet
CREATE TABLE COURSE(
  NAME VARCHAR(50) UNIQUE,
  CREDIT_POINTS VARCHAR(50),
  COURSE_ID INT,
  PROGRAM_ID INT DEFAULT 000, 
  PRIMARY KEY(COURSE_ID),
  FOREIGN KEY (PROGRAM_ID) REFERENCES PROGRAM(PROGRAM_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

                                       -- RELATIONS:

CREATE TABLE ATTEMPTS(
  YEAR INT,
  MARK INT,
  SEMESTER VARCHAR(20),
  STUDENT_ID INT,
  COURSE_ID INT,
  PRIMARY KEY (STUDENT_ID, COURSE_ID, SEMESTER),
  FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(STUDENT_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (COURSE_ID) REFERENCES COURSE(COURSE_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ENROLL(
  STUDENT_ID INT,
  PROGRAM_ID INT,
  PRIMARY KEY (STUDENT_ID, PROGRAM_ID),
  FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(STUDENT_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (PROGRAM_ID) REFERENCES PROGRAM(PROGRAM_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

                                       -- INSERT DATA INTO TABLES

INSERT INTO STUDENT (SURNAME, GIVEN_NAMES, STUDENT_ID, DOB, AGE, EMAIL) 
VALUES ('Smith', 'John', 1, '2000-05-10', 25, 'john.smith@email.com');

INSERT INTO STUDENT (SURNAME, GIVEN_NAMES, STUDENT_ID, DOB, AGE, EMAIL) 
VALUES ('Doe', 'Jane', 2, '1998-08-25', 27, 'jane.doe@email.com');

INSERT INTO STUDENT (SURNAME, GIVEN_NAMES, STUDENT_ID, DOB, AGE, EMAIL) 
VALUES ('Brown', 'Michael', 3, '2001-01-15', 24, 'michael.brown@email.com');

INSERT INTO STUDENT (SURNAME, GIVEN_NAMES, STUDENT_ID, DOB, AGE, EMAIL) 
VALUES ('Taylor', 'Emily', 4, '1999-12-30', 26, 'emily.taylor@email.com');

INSERT INTO STUDENT (SURNAME, GIVEN_NAMES, STUDENT_ID, DOB, AGE, EMAIL) 
VALUES ('Wilson', 'David', 5, '2002-03-10', 23, 'david.wilson@email.com');

INSERT INTO STUDENT (SURNAME, GIVEN_NAMES, STUDENT_ID, DOB, AGE, EMAIL) 
VALUES ('Shawn', 'Rhoden', 6, '2000-08-11', 25, 'shawn.rhoden@email.com');

INSERT INTO PROGRAM (NAME, CREDIT_POINTS, PROGRAM_ID) 
VALUES ('Computer Science', 120, 1);

INSERT INTO PROGRAM (NAME, CREDIT_POINTS, PROGRAM_ID) 
VALUES ('Mathematics', 90, 2);

INSERT INTO PROGRAM (NAME, CREDIT_POINTS, PROGRAM_ID) 
VALUES ('Physics', 100, 3);

INSERT INTO PROGRAM (NAME, CREDIT_POINTS, PROGRAM_ID) 
VALUES ('Engineering', 150, 4);

INSERT INTO PROGRAM (NAME, CREDIT_POINTS, PROGRAM_ID) 
VALUES ('Biology', 110, 5);

INSERT INTO COURSE (NAME, CREDIT_POINTS, COURSE_ID, PROGRAM_ID) 
VALUES ('Data Structures', '4', 101, 1);

INSERT INTO COURSE (NAME, CREDIT_POINTS, COURSE_ID, PROGRAM_ID) 
VALUES ('Calculus I', '3', 102, 2);

INSERT INTO COURSE (NAME, CREDIT_POINTS, COURSE_ID, PROGRAM_ID) 
VALUES ('Classical Mechanics', '4', 103, 3);

INSERT INTO COURSE (NAME, CREDIT_POINTS, COURSE_ID, PROGRAM_ID) 
VALUES ('Introduction to Engineering', '5', 104, 4);

INSERT INTO COURSE (NAME, CREDIT_POINTS, COURSE_ID, PROGRAM_ID) 
VALUES ('Genetics', '3', 105, 5);

INSERT INTO COURSE (NAME, CREDIT_POINTS, COURSE_ID, PROGRAM_ID)  
VALUES ('Algorithms', '4', 106, 1);

INSERT INTO COURSE (NAME, CREDIT_POINTS, COURSE_ID, PROGRAM_ID)  
VALUES ('Linear Algebra', '3', 107, 2);

INSERT INTO COURSE (NAME, CREDIT_POINTS, COURSE_ID, PROGRAM_ID)  
VALUES ('Thermodynamics', '4', 108, 3);

INSERT INTO COURSE (NAME, CREDIT_POINTS, COURSE_ID, PROGRAM_ID)  
VALUES ('Electrical Circuits', '5', 109, 4);

INSERT INTO COURSE (NAME, CREDIT_POINTS, COURSE_ID, PROGRAM_ID)  
VALUES ('Microbiology', '3', 110, 5);


INSERT INTO ATTEMPTS (YEAR, MARK, SEMESTER, STUDENT_ID, COURSE_ID) 
VALUES (2022, 85, 'Spring', 1, 101);

INSERT INTO ATTEMPTS (YEAR, MARK, SEMESTER, STUDENT_ID, COURSE_ID) 
VALUES (2022, 78, 'Fall', 2, 102);

INSERT INTO ATTEMPTS (YEAR, MARK, SEMESTER, STUDENT_ID, COURSE_ID) 
VALUES (2023, 92, 'Spring', 3, 103);

INSERT INTO ATTEMPTS (YEAR, MARK, SEMESTER, STUDENT_ID, COURSE_ID) 
VALUES (2023, 88, 'Fall', 4, 104);

INSERT INTO ATTEMPTS (YEAR, MARK, SEMESTER, STUDENT_ID, COURSE_ID) 
VALUES (2023, 90, 'Spring', 5, 105);

INSERT INTO ATTEMPTS (YEAR, MARK, SEMESTER, STUDENT_ID, COURSE_ID) 
VALUES (2025, 91, 'Spring', 6, 101);

INSERT INTO ENROLL (STUDENT_ID, PROGRAM_ID)
VALUES (6,1);

INSERT INTO ENROLL (STUDENT_ID, PROGRAM_ID) 
VALUES (1, 1);

INSERT INTO ENROLL (STUDENT_ID, PROGRAM_ID) 
VALUES (2, 2);

INSERT INTO ENROLL (STUDENT_ID, PROGRAM_ID) 
VALUES (3, 3);

INSERT INTO ENROLL (STUDENT_ID, PROGRAM_ID) 
VALUES (4, 4);

INSERT INTO ENROLL (STUDENT_ID, PROGRAM_ID) 
VALUES (5, 5);

INSERT INTO ENROLL (STUDENT_ID, PROGRAM_ID) 
VALUES (3, 1);  -- Student 3 (Michael Brown) in Computer Science

INSERT INTO ENROLL (STUDENT_ID, PROGRAM_ID) 
VALUES (4, 2);  -- Student 4 (Emily Taylor) in Mathematics

-- Adding students to Physics program (Program ID 3)
INSERT INTO ENROLL (STUDENT_ID, PROGRAM_ID) 
VALUES (5, 3);  -- Student 5 (David Wilson) in Physics

INSERT INTO ENROLL (STUDENT_ID, PROGRAM_ID) 
VALUES (1, 3);  -- Student 1 (John Smith) in Physics

-- Adding students to Engineering program (Program ID 4)
INSERT INTO ENROLL (STUDENT_ID, PROGRAM_ID) 
VALUES (2, 4);  -- Student 2 (Jane Doe) in Engineering

INSERT INTO ENROLL (STUDENT_ID, PROGRAM_ID) 
VALUES (3, 4);  -- Student 3 (Michael Brown) in Engineering

-- Adding students to Biology program (Program ID 5)
INSERT INTO ENROLL (STUDENT_ID, PROGRAM_ID) 
VALUES (4, 5);  -- Student 4 (Emily Taylor) in Biology


-- UPDATE ATTEMPTS SET YEAR = 2024 WHERE STUDENT_ID = 1;
-- SELECT * FROM ATTEMPTS;

-- UPDATE ATTEMPTS SET MARK = 97 WHERE STUDENT_ID = 2;
-- SELECT * FROM ATTEMPTS;

  -- DELETE FROM ATTEMPTS WHERE SEMESTER = "Spring";
  -- SELECT * FROM ATTEMPTS;
  
  -- DELETE FROM STUDENT WHERE SURNAME = "Smith";
  -- SELECT * FROM STUDENT;
  -- To check if student with STUDENT_ID = 1 is gone
  -- SELECT * FROM ENROLL; 
  
-- Left joining two tables ENROLL & STUDENT to get one big table
-- SELECT 
--   * 
-- FROM 
--   STUDENT s
-- LEFT JOIN ENROLL e ON s.STUDENT_ID = e.STUDENT_ID

/*Retrieve the list of students with their enrolled programs, 
including students who may not be enrolled in any program yet.*/

-- SELECT 
--     s.SURNAME, 
--     s.GIVEN_NAMES, 
--     p.NAME AS PROGRAM_NAME
-- FROM 
--     STUDENT s
-- LEFT JOIN ENROLL e ON s.STUDENT_ID = e.STUDENT_ID
-- LEFT JOIN PROGRAM p ON e.PROGRAM_ID = p.PROGRAM_ID;

/*Get a list of students, the programs they are enrolled in, 
and the courses associated with those programs.*/

-- SELECT 
--     s.SURNAME, 
--     s.GIVEN_NAMES, 
--     p.NAME AS PROGRAM_NAME,
--     c.NAME AS COURSE_NAME
-- FROM 
--     STUDENT s
-- LEFT JOIN ENROLL e ON s.STUDENT_ID = e.STUDENT_ID
-- LEFT JOIN PROGRAM p ON e.PROGRAM_ID = p.PROGRAM_ID
-- LEFT JOIN COURSE c ON p.PROGRAM_ID = c.PROGRAM_ID;

-- SELECT 
--     s1.STUDENT_ID AS STUDENT_ID_1,
--     s1.SURNAME AS SURNAME_1,
--     s1.GIVEN_NAMES AS GIVEN_NAMES_1,
--     s1.DOB AS DOB_1,
--     s2.STUDENT_ID AS STUDENT_ID_2,
--     s2.SURNAME AS SURNAME_2,
--     s2.GIVEN_NAMES AS GIVEN_NAMES_2,
--     s2.DOB AS DOB_2
-- FROM 
--     STUDENT s1
-- JOIN 
--     STUDENT s2 
--     ON YEAR(s1.DOB) = YEAR(s2.DOB)  -- Compare students born in the same year
-- WHERE 
--     s1.STUDENT_ID < s2.STUDENT_ID;  -- Avoid duplicate pairs
