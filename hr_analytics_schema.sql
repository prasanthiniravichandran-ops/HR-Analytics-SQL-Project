use hr_analytics;

-- Fetch Emp_ID, Employee Name, Aadhar & PAN details

select * from emp_master_table;

select count(*) from emp_master_table;
select * from emp_master_table limit 5;

Alter table emp_master_table
modify Emp_ID varchar(10) not null;

Alter table emp_master_table
Add primary key (Emp_ID);

Select Emp_ID, Emp_name, Aadhar_No, PAN_No,Personal_Mail_ID
from emp_master_table;

--  Employees working in a specific location

select Emp_ID, Emp_name, Location
from emp_master_table
where location = "Chennai";

-- Employees joined after a given year

Select Emp_ID, Emp_Name,DOJ
from emp_master_table
where DOJ > "2023-01-01";

-- Change the department of an employee

Update emp_master_table
set department = "HR"
where emp_id = "A015";
select Emp_ID, Emp_name, Department from emp_master_table;


-- Fetch emp_official mail & CTC

Select * from Em_official;

Alter table Em_Official
modify Emp_ID varchar(10) not null;

Alter table em_official
ADD Foreign key (Emp_Id) 
references emp_master_table (Emp_id);

select e.Emp_id, e.emp_name,o.official_email,o.CTC
FROM Emp_master_table as e
JOIN em_official as o
on e.emp_id=o.emp_id;

-- Employees working more than average hours

SELECT Emp_ID, Total_Hours
FROM emp_Working_Hours
WHERE Total_Hours > (SELECT AVG(Total_Hours) FROM emp_Working_Hours);


-- Fetch all candidate Name, Applied Depatment, Interview Date;

select * from recruit;

select candidate_Name, Applied_Department,Interview_status
from Recruit;

-- Candidates applied for HR department

select candidate_Name, Candidate_Mail
from Recruit
where Applied_Department="hr";

-- Experienced candidates (more than 3 years)

select candidate_name, Applied_Position, Experience
from Recruit
where Experience >3;

-- Interview status summary

select Interview_status, count(*) As candiate_count
from recruit
group by Interview_status;

-- Candidates sorted by experience

select candidate_name, Experience
from recruit
order by Experience desc;

-- Active client projects

select * from client_database;

select Client_Name, Project_Name, Project_status
from Client_database
where Project_status="In Progress";

-- Total project cost per clients

select client_name, sum(project_Cost) as Total_Project_Cost
from Client_database
group by client_name;

-- Projects started after 2023-10-10

select Project_Name, Start_Date
from client_database
where start_date> "2023-10-10";

-- Attendance records

select * from attendance;
Select AttendanceID, Attendance_Date, Attendance_Status
from Attendance;


-- Total working days per employee

select Emp_ID, count(*) as Working_Days
from attendance
group by Emp_ID;

-- Employees with or without attendance records

select e.Emp_ID, e.Emp_name, a.attendance_date
from emp_master_table e
left join attendance a
on e.emp_ID= a.Emp_Id;

-- Employees with more than 20 working days
select emp_id, count(*) as wokring_days
from attendance
group by emp_id
having count(*)>01;

-- Employees working more than 9 hours

select * from emp_working_hours;

ALTER TABLE emp_working_hours
MODIFY Total_Hours TIME;

select Emp_ID, Total_Hours
from emp_working_hours
where Total_hours > "08:15:00";

-- Late coming employees

Alter table emp_working_hours
modify In_time Time, 
modify Out_time time;

select Emp_ID, IN_Time
from emp_working_hours
where IN_Time > "09:20:00";

select * from emp_working_hours;

-- Work status classification based on working hours

select Emp_Id, Total_hours,
case
when Total_hours >="09:00:00" then "Over Time"
when Total_hours >="08:00:00" then "Daily hours"
else "Half day"
End as Working_hours
from emp_working_hours;

-- Monthly payroll details

SELECT Emp_ID, Payroll_Month, Payroll_Year, Net_Salary
FROM Payroll; 

-- Highest paid employee

select * from payroll;

select Emp_Id, Net_Salary
from payroll
order by(Net_salary) Desc
Limit 1;

-- Salary category classification

select Emp_ID, Net_salary,
case
when Net_salary>="80000" then "Highest Salary"
when Net_salary>="50000" then "Average Salary"
when Net_salary>="30000" then "Medium Salary"
else "Low salary"
end as Salary_category
from payroll;

-- Appraisal details

SELECT Emp_ID, Appraisal_Month, Appraisal_Percentage
FROM Appraisal;

-- High appraisal employees

select Emp_Id, Appraisal_Percentage
from Appraisal
where Appraisal_Percentage >= "15%";

-- Performance review details
SELECT Emp_ID, Performance_Rating, Review_Date
FROM Review_Table;

-- Resigned with EXIT Reason
SELECT Emp_ID, Exit_Reason
FROM Emp_Attrition;

-- Employees eligible for rehire

SELECT DISTINCT Rehire_Eligibility
FROM Emp_Attrition;


SELECT Emp_ID, Rehire_Eligibility
FROM Emp_Attrition
WHERE UPPER(TRIM(Rehire_Eligibility)) = 'YES';

-- Net profit or loss per period

Select Period,
Profit_Loss AS Net_Profit
from pnl_summar_review;





