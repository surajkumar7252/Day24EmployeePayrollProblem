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

#UseCase 10 : Updating Employee Data.


insert into employee_payroll (NAME, DEPARTMENT,PHONE_NUMBER, GENDER, basic_pay, deductions, TAXABLE_PAY, INCOME_TAX, NET_PAY, START) values
('Terisa', 'Marketing',878987898789, 'F', 15000000.00, 5000000.00, 10000000.00,1000000.00, 20000000.00, '2017-10-05');
update employee_payroll set DEPARTMENT='Finance' where NAME='Terisa';

#UseCase 11 : ER representation.

create table organisation(
ORGANISATION_ID int unsigned not null auto_increment,
ORGANISATION_NAME varchar(250) not null,
primary key(ORGANISATION_ID)
);

insert into organisation (ORGANISATION_NAME) values ('ADAPT');
insert into organisation (ORGANISATION_NAME) values ('Bridgelabs');

create table employee(
PERSONAL_ID int unsigned not null auto_increment,
EMP_NAME varchar(250) not null,
ORGANISATION_ID int unsigned not null,
PHONE_NUMBER varchar(250) not null,
ADDRESS varchar(250) not null,
GENDER char(1),
START date not null, 
primary key (PERSONAL_ID),
foreign key (ORGANISATION_ID) references organisation(ORGANISATION_ID)
);


insert into employee (EMP_NAME,ORGANISATION_ID,PHONE_NUMBER,ADDRESS,GENDER,START) values ('Suraj', 2, '88888899999','Dhanbad', 'M','20-10-16');
insert into employee (EMP_NAME,ORGANISATION_ID,PHONE_NUMBER,ADDRESS,GENDER,START) values ('ravi', 1, '8855223366','Gaya', 'M','12-09-17');


create table department(
ID int unsigned not null auto_increment,
DEP_NAME varchar(250) not null,
primary key(ID)
);

insert into department (DEP_NAME) values ('Sales');
insert into department (DEP_NAME) values ('Marketing');
insert into department (DEP_NAME) values ('Finance');



create table payroll(
PERSONAL_ID int unsigned not null,
BASIC_PAY double not null,
DEDUCTIONS double not null,
TAXABLE_INCOME double not null,
INCOME_TAX double not null,
NET_PAY double not null,
foreign key (PERSONAL_ID) references employee(PERSONAL_ID)
);

insert into payroll (PERSONAL_ID, BASIC_PAY, DEDUCTIONS, TAXABLE_INCOME, INCOME_TAX, NET_PAY) values 
(1, 800000.00, 3500000.00,4200000.00,1300000.00,8000000.00);
insert into payroll (PERSONAL_ID, BASIC_PAY, DEDUCTIONS, TAXABLE_INCOME, INCOME_TAX, NET_PAY) values 
(1, 750000.00, 4000000.00,4300000.00,1200000.00,8500000.00);

create table employee_dept(
PERSONAL_ID int unsigned not null,
ID int unsigned not null,
foreign key (PERSONAL_ID) references employee(PERSONAL_ID),
foreign key (ID) references department(ID)
);
insert into employee_dept (PERSONAL_ID, ID) values (1, 1);
insert into employee_dept(PERSONAL_ID, ID) values (2,2);


select GENDER,sum(NET_PAY) from employee inner join payroll on employee.PERSONAL_ID=payroll.PERSONAL_ID  group by GENDER ;
select GENDER,avg(NET_PAY) from employee inner join payroll on employee.PERSONAL_ID=payroll.PERSONAL_ID  group by GENDER ;
select GENDER,min(NET_PAY) from employee inner join payroll on employee.PERSONAL_ID=payroll.PERSONAL_ID  group by GENDER ;
select GENDER,max(NET_PAY) from employee inner join payroll on employee.PERSONAL_ID=payroll.PERSONAL_ID  group by GENDER ;
select GENDER,count(NET_PAY) from employee inner join payroll on employee.PERSONAL_ID=payroll.PERSONAL_ID  group by GENDER ;


