1/
CREATE SCHEMA btc_employee

2/
CREATE TABLE province(
province_id int NOT NULL AUTO_INCREMENT,
province_name varchar(50) NOT NULL UNIQUE, 
region int NOT NULL ,
CONSTRAINT CHK_region CHECK (region=1 OR region=2 OR region=3),
PRIMARY KEY (province_id));

3/
CREATE TABLE employee (
employee_id int NOT NULL AUTO_INCREMENT, 
employee_name varchar(50) NOT NULL, 
age int NOT NULL, province_id int NOT NULL, 
role varchar(25) CHECK (role = 'MEMBER' OR role='LEADER' OR role='MANAGER'),
CONSTRAINT CHK_age CHECK (age>16 AND age<70),
PRIMARY KEY(employee_id), 
FOREIGN KEY(province_id) REFERENCES province(province_id));

4/
CREATE TABLE project(
project_id int NOT NULL AUTO_INCREMENT, 
project_name varchar(50) NOT NULL UNIQUE, 
PRIMARY KEY (project_id));

5/
CREATE TABLE employee_on_project(
id int NOT NULL AUTO_INCREMENT, 
employee_id int, 
project_id int,
FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
FOREIGN KEY (project_id) REFERENCES project(project_id),
CONSTRAINT UC_ep UNIQUE (project_id,employee_id),
PRIMARY KEY(id));

6/
select province_name  
from province   
where region=1;

7/
select count(province_name)
from province
group by region;

8/
select *  
from employee  
where role!='MANAGER'  
oder by role;

9/
SELECT employee.employee_name  
FROM employee 
INNER JOIN employee_on_project 
ON employee.employee_id = employee_on_project.employee_id 
WHERE age<= 30   
ORDER BY project_id;

10/
SELECT project_id, COUNT(employee_name)
FROM employee
INNER JOIN employee_on_project
ON employee.employee_id = employee_on_project.employee_id
WHERE employee_name ='anh'
GROUP BY employee_on_project.project_id;

11/
SELECT employee_on_project.project_id,
AVG(age)
FROM employee
INNER JOIN employee_on_project
ON employee.employee_id = employee_on_project.employee_id
GROUP BY employee_on_project.project_id;

12/
SELECT employee_name,project_name
FROM ((employee e
INNER JOIN employee_on_project ep
ON e.employee_id = ep.employee_id)
INNER JOIN project p
ON p.project_id = ep.project_id);

14/
select region ,employee_name,project_name,province_name,(case
when region=1 then "BAC" 
when region=2 then "TRUNG" 
else "NAM" end) region  
from province p
inner join employee e
on e.province_id = p.province_id
inner join employee_on_project ep
on ep.employee_id = e.employee_id
inner join project
on ep.project_id = project.project_id
group by ep.project_id
having project.project_name = 'Universal' OR project.project_name = 'Mayo' 
order by region;

15/
create view em_age as
select employee_name, age, role
from employee
where (role='MEMBER' AND age <30 ) OR (role !='MEMBER' AND age>30)
order by age;

16/
select employee_name, age
from employee
where age>30;

17/
select p.project_name, (max(age)-min(age)) diff 
from employee e 
inner join employee_on_project ep 
on ep.employee_id = e.employee_id 
left join project p 
on p.project_id = ep.project_id 
group by ep.project_id  
order by diff DESC 
limit 1;

18/
select e.employee_name
from employee as e
inner join employee_on_project as ep
on e.employee_id = ep.employee_id
where ep.project_id='';