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







