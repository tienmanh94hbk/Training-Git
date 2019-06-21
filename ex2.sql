

create index idx_employee_employee_age
on employee(employee_name);


create index idx_province_province_name
on province(province_name);

create index idx_province_region
on province(region);

create index idx_project_project_name
on project(project_name);


câu 8/
create index idx_employee_role
on employee(role);

cau 9/
create index idx_employee_age
on employee(age);

cau 15/(toi uu)
create view em_age as
select *
from employee
where (role='MEMBER' AND age <30 ) 
Union
select *
from employee
where (role in('LEADER','MANAGER') AND age >30 ) 