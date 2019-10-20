/* Project 2a */
/* Jaco Storm */
/*  15435194  */

CREATE TABLE staff
(
staff_id CHAR(2) PRIMARY KEY,
first_name  VARCHAR(20),
last_name VARCHAR(20),
role VARCHAR(15) CHECK(role IN('GP','Surgeon','Reception','GP Intern','Nurse','Senior Nurse','Nurse Intern','Marketing')),
gender CHAR(1) CHECK(gender IN('M','F')),
date_joined DATE NOT NULL,
date_left DATE
);

INSERT INTO staff VALUES('1','Tyrian','Lannister','GP','M','21-Apr-2013',NULL);
INSERT INTO staff VALUES('2','Cersei','Lannister','Reception','F','27-Apr-2013',NULL);
INSERT INTO staff VALUES('3','Jon','Snow','Surgeon','M','14-May-2013',NULL);	
INSERT INTO staff VALUES('4','Sansa','Stark','Marketing','F','14-May-2013',NULL);	
INSERT INTO staff VALUES('5','Daenerys','Targaryen','Reception','F','23-Mar-2014',NULL);
INSERT INTO staff VALUES('6','Petyr','Baelish','Nurse','M','17-Sep-2014',NULL);	
INSERT INTO staff VALUES('7','Arya','Stark','Senior Nurse','F','18-Oct-2015',NULL);
INSERT INTO staff VALUES('8','Joffrey','Baratheon','Marketing','M','23-Jan-2016','24-Jun-2016');
INSERT INTO staff VALUES('9','Roose','Bolton','Marketing','M','3-Feb-2016',NULL);
INSERT INTO staff VALUES('10','Margaery','Tyrell','GP','F','4-Dec-2016','17-Aug-2017');
INSERT INTO staff VALUES('11','Samwell','Tarly','Nurse','Intern','M','27-Mar-2017',NULL);
INSERT INTO staff VALUES('12','jaco','storm','Nurse Intern','M','7-Apr-2018',NULL);


CREATE TABLE speciality
(
spec_id CHAR(4) PRIMARY KEY,
spec_name VARCHAR(25),
spec_notes VARCHAR(100)
);

INSERT INTO speciality VALUES('0123','General','onsultancy	 Includes	all	areas	as	a	GP');
INSERT INTO speciality VALUES('0124','Emergency	Care','Can	perform	minor	surgeries');
INSERT INTO speciality VALUES('0125','Vaccination','Generally	taken	care	of	by	a	nurse');
INSERT INTO speciality VALUES('0126','Tests','Collect	samples	for	testing	as	required	by	GP	or	Surgeon');
INSERT INTO speciality VALUES('0127','Repeat','Prescription	 Generally	taken	care	of	by	a	nurse');

CREATE TABLE charges
(
chrg_code CHAR(7) PRIMARY KEY,
chrg_desc VARCHAR(80) NOT NULL,
duration NUMBER(2) CHECK(duration<60) NOT NULL,
hourly_rate NUMBER(4,2) CHECK(hourly_rate<95.99)
);

INSERT INTO charges VALUES('0081','General GP consultation for registered	patients','20','$180');
INSERT INTO charges VALUES('0082','General GP consultation for casual patients','20','$360');
INSERT INTO charges VALUES('0085','Emergency Medical Care for registered or casual patients','30','$0');
INSERT INTO charges VALUES('0086','Vaccination or Test collection for registered patients','15','$0');
INSERT INTO charges VALUES('0088','Vaccination or Test collection for casual patients','15','$40');
INSERT INTO charges VALUES('0089','Repeat Prescription','5','$5');

CREATE TABLE staff_speciality
(
staff_id CHAR(2) PRIMARY KEY REFERENCES staff(staff_id),
spec_id CHAR(4) REFERENCES speciality(spec_id),
date_qualified DATE NOT NULL,
valid_till_date DATE,
details VARCHAR(100)
);

INSERT INTO staff_speciality VALUES('1','0123','24-Apr-2014','23-Apr-2024','General Practitioner license renewed');
INSERT INTO staff_speciality VALUES('1','0124','14-May-2016','14-Nov-2021','Certified only to assist a surgery');
INSERT INTO staff_speciality VALUES('3','0124','01Aug-2015','31-Jul-2020','Special certification in	emergency care');
INSERT INTO staff_speciality VALUES('6','0125','25-Jul-2017','24-Jul-2019','Renewed	license');
INSERT INTO staff_speciality VALUES('7','0124','01-Aug-2015','31-Jul-2020','Can	assist a surgeon in	emergency care');
INSERT INTO staff_speciality VALUES'(7','0126','17-Jul-2015','16-Jul-2020','Renewed	license');
INSERT INTO staff_speciality VALUES('11','0127','01-Aug-2017','31-Aug-2018','Intern	under training');
INSERT INTO staff_speciality VALUES('12','0127','03-Aug-2017','02-Sep-2018','Intern	under training');

CREATE TABLE consultation
(
chrg_code CHAR(7) PRIMARY KEY REFERENCES charges(chrg_code),
staff_id CHAR(2)  REFERENCES staff(staff_id),
date_consulted DATE NOT NULL,
start_time NUMBER(4,2),
patient_no char(7)
);

INSERT INTO consultation VALUES('0082','1','1-Sep-2017','8.30','A012345');
INSERT INTO consultation VALUES('0085','3','4-Sep-2017','9.45','N333333');
INSERT INTO consultation VALUES('0085','7','6-Sep-2017','9.45','I445566');
INSERT INTO consultation VALUES('0086','7','6-Sep-2017','10.30','K222333');
INSERT INTO consultation VALUES('0089','12','7-Sep-2017','10.45','A343434');

