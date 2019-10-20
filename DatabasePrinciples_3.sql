/* 
 Project 2B
 Jaco Storm
 15435194   
*/

-- Q1
SELECT *
FROM staff
WHERE date_joined < '17‐Sep‐14';
-- Q2
SELECT *
FROM staff
WHERE date_left IS NOT NULL;
-- Q3
SELECT chrg_code "Charge Code", chrg_desc "Description", hourly_rate "Hourly Rate"
FROM charges
WHERE chrg_desc IN 'casual';
-- Q4
SELECT chrg_code"Charge Code", chrg_desc  "Description", hourly_rate "Hourly Rate"
FROM charges
WHERE chrg_desc NOT IN 'casual';
-- Q5

SELECT MAX(hourly_rate) "Highest Rate",MIN(hourly_rate)"Lowest Rate",AVG(hourly_rate)"Average Rate"
FROM charges;
-- Q6
SELECT chrg_code "Charge Code",hourly_rate "Hourly Rate",duration "Duration",hourly_rate*duration/60 "duration Charge"
FROM charges;
-- Q7
SELECT staff_id "Staff ID", spec_id  "Speciality Id", date_qualified,valid_till_date,valid_till_date - date_qualified "Days Valid"
FROM staff_speciality;
-- Q8
SELECT staff_id "Staff ID",chrg_code "Charge Code",date_consulted "date consulted",patient_no "Patient Number",date_consulted + 25"Due Date"
FROM consultation;
-- Q9
SELECT COUNT(staff_id)
FROM staff_speciality;
SELECT COUNT(staff_id)
FROM staff;
SELECT COUNT(spec_id)
FROM speciality;
SELECT COUNT(chrg_code)
FROM charges;
SELECT COUNT(consultation)
FROM chrg_code;
-- Q10
SELECT staff_id "Staff ID", spec_id  "Speciality Id",spec_name "Speciality Name", date_qualified "Date Qualified", valid_till_date "Date Valid Till"
FROM speciality,staff_speciality
WHERE speciality.spec_id = staff_speciality.spec_id;
-- Q11
SELECT staff_id "Staff ID", patient_no "Patient Number",date_consulted "Date Consulted", start_time "start time", hourly_rate "hourly rate"
FROM consultation, charges;
-- Q12
SELECT staff_id "Staff ID", first_name || last_name "Staff Full Name",spec_id "Speciality Id"
FROM staff,speciality
WHERE gender = 'M';
-- Q13
SELECT staff_id "Staff ID",spec_name "Speciality Name",spec_notes "Speciality Notes"
FROM staff,speciality
WHERE spec_notes = "Surge" OR "surge";

