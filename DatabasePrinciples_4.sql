/*
JACO STORM
15435194
*/


/* Q1 */
CREATE TABLE school
(
sch_id	CHAR(3) PRIMARY KEY,
sch_name VARCHAR(35)
);

CREATE TABLE lecturer
(
lecture_id	CHAR(5) PRIMARY KEY,
sch_id	CHAR(3)	REFERENCES school(sch_id),
fname	VARCHAR(15),
lname VARCHAR(10) NOT NULL,
dob DATE CHECK(dob > '01-jan-1985'),
gender CHAR(1) CHECK(gender IN('M','F')),
renumeration NUMBER(7,2)
);

/* Q2 */
INSERT INTO school VALUES('SIT','School of information Technology');
INSERT INTO school VALUES('SBS','School of Business Studies');
INSERT INTO school VALUES('SBT','School of Business of Technology');

INSERT INTO lecturer VALUES('00101','SIT','Tomasz','Ykema','01-jan-96','M',61680.50);
INSERT INTO lecturer VALUES('00104','SIT','Haley','Ross','01-jan-96','F',61650.75);
INSERT INTO lecturer VALUES('00106','SIT','Maksim','Dyankov','31-dec-96','M',71600.00);
INSERT INTO lecturer VALUES('00107','SIT','Tim','Wheatley','31-oct-95','M',81675);
INSERT INTO lecturer VALUES('00109','SIT','Priya','Prasad','15-may-95','F',66720);
COMMIT;

/* Q3 */
SELECT *
FROM school;
SELECT *
FROM lecturer;

/* Q4 */
DESCRIBE school;
DESCRIBE lecturer; 

/* Q5 */
UPDATE lecturer
SET renumeration = 0;
ROLLBACK;

/* Q6 */
SELECT sch_id,COUNT(fname)"Lecture num"
FROM lecturer
GROUP BY sch_id;

/* Q7 */
COLUMN renumeration FORMAT $99999
SELECT MAX(renumeration)"Highest Pay"
FROM lecturer
WHERE dob BETWEEN '01-jan-96' AND '31-dec-96';

/* Q8 */
SELECT gender,SUM(renumeration) "Total"
FROM lecturer
GROUP BY gender;

/* Q9 */
CREATE VIEW before95No_view AS
SELECT lecture_id, lname,dob
FROM lecturer
WHERE dob < '31-oct-95';

/* Q10 */
CREATE VIEW lecturer_school_view AS
SELECT lecture_id,lname,s.sch_name
FROM lecturer l,school s;
WHERE l.sch_id = s.sch_id

/* Q11 */
SELECT lecture_id,fname,gender,s.sch_name
FROM lecturer,school s
WHERE renumeration < 70000;

/* Q12 */
SELECT lecture_id,fname,lname
FROM lecturer
WHERE gender = 'F' AND renumeration>=65000;

/* Q13 */
UPDATE renumeration
SET renumeration = renumeration * 1.12
WHERE sch_id = 'SIT';

/* Q14 */
DELETE FROM lecturer;
DELETE FROM school
ROLLBACK;
