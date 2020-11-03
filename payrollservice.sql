# UseCase 1 : Creating a Payroll Service DB.

create database payroll_service;
show databases;
use payroll_service;

#UseCase 2 : Creating an employee payroll Table.

create table employee_payroll(
ID  int unsigned  Not Null auto_increment,
NAME  varchar(250) Not Null,
SALARY double Not Null,
START date Not Null,
primary key(ID)); 

#UseCase 3 : Creating Payroll Data in the table.

insert into employee_payroll(NAME,SALARY,START) values ('Surajmal Kumar',50000.00,'2020-09-16'),
                                                        ('Prakash',85000.00,'2016-06-14'),
                                                        ('Raushan',91000.00,'2018-02-23');

#UseCase 4 : Retrieving all employee payroll data added to payroll service DB.

select * from employee_payroll;

#UseCase 5 : Retrieving salary data for an employee joined between a date range.

select SALARY from employee_payroll where START between cast('2016-06-10' as date) and date(now());
select SALARY from employee_payroll where START between cast('2016-06-10' as date) and  cast('2018-11-11' as date);

#UseCase 6 : Adding GENDER column to the table and updating the rows to reflect the correct Employee Gender.

alter table employee_payroll add GENDER char(1) after NAME;
update employee_payroll set GENDER = 'M' where ID =1;
update employee_payroll set GENDER = 'M' where NAME ='Raushan';
update employee_payroll set GENDER = 'M' where NAME ='Prakash';

#UseCase 7 : finding sum,average,minimum,maximum,count to do analysis by GENDER.

select sum(SALARY) from employee_payroll where GENDER ='M' group by GENDER ASC;
select avg(SALARY) from employee_payroll where GENDER ='M' group by GENDER ASC;
select min(SALARY) from employee_payroll where GENDER ='M' group by GENDER ASC;
select max(SALARY) from employee_payroll where GENDER ='M' group by GENDER ASC;
select count(SALARY) from employee_payroll where GENDER ='M' group by GENDER ASC;
select sum(SALARY) from employee_payroll where GENDER ='M' group by GENDER desc;
select avg(SALARY) from employee_payroll where GENDER ='M' group by GENDER desc;
select min(SALARY) from employee_payroll where GENDER ='M' group by GENDER desc;
select max(SALARY) from employee_payroll where GENDER ='M' group by GENDER desc;
select count(SALARY) from employee_payroll where GENDER ='M' group by GENDER desc;

#UseCase 8 : Extending Employee Payroll Data.

alter table employee_payroll add ADDRESS varchar(250) after NAME;
alter table employee_payroll alter ADDRESS set default 'NON';
alter table employee_payroll add PHONE_NUMBER varchar(250) not null after ADDRESS;
alter table employee_payroll add DEPARTMENT varchar(250) not null  after address;

select * from employee_payroll;
#UseCase 9 : Extending Employee Payroll Data.

alter table employee_payroll add basic_pay double not null after DEPARTMENT ;
alter table employee_payroll add deductions double not null after basic_pay;
alter table employee_payroll add TAXABLE_PAY double not null after deductions;
alter table employee_payroll add INCOME_TAX double not null after TAXABLE_PAY;
alter table employee_payroll add NET_PAY double not null after INCOME_TAX;