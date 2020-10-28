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






