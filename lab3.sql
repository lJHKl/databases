create database lab3;

create table departments (
  code   integer primary key,
  name   varchar(255) not null,
  budget decimal      not null
);

create table employees (
  ssn integer primary key,
  name varchar(255) not null,
  lastname varchar(255) not null,
  department integer not null,
  city varchar(255),
  foreign key (department) references departments(code)
);

create table customers(
  id serial primary key,
  name varchar(255) not null,
  lastname varchar(255) not null,
  city varchar(255)
);

INSERT INTO departments(code,name,budget) VALUES(14,'IT',65000);
INSERT INTO departments(code,name,budget) VALUES(37,'Accounting',15000);
INSERT INTO departments(code,name,budget) VALUES(59,'Human Resources',240000);
INSERT INTO departments(code,name,budget) VALUES(77,'Research',55000);
INSERT INTO departments(code,name,budget) VALUES(45,'Management',155000);
INSERT INTO departments(code,name,budget) VALUES(11,'Sales',85000);

INSERT INTO employees(ssn,name,lastname,department, city) VALUES('123234877','Michael','Rogers',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('152934485','Anand','Manikutty',14, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('222364883','Carol','Smith',37, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('326587417','Joe','Stevens',37, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332154719','Mary-Anne','Foster',14, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332569843','George','ODonnell',77, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('546523478','John','Doe',59, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('631231482','David','Smith',77, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('654873219','Zacary','Efron',59, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('745685214','Eric','Goldsmith',59, 'Atyrau');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657245','Elizabeth','Doe',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657246','Kumar','Swamy',14, 'Almaty');

INSERT INTO customers(name,lastname, city) VALUES('John','Wills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Garry','Foster', 'London');
INSERT INTO customers(name,lastname, city) VALUES('Amanda','Hills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('George','Doe', 'Tokyo');
INSERT INTO customers(name,lastname, city) VALUES('David','Little', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Shawn','Efron', 'Astana');
INSERT INTO customers(name,lastname, city) VALUES('Eric','Gomez', 'Shymkent');
INSERT INTO customers(name,lastname, city) VALUES('Elizabeth','Tailor', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Julia','Adams', 'Astana');

select lastname from employees;

select distinct on(lastname) * from employees;

select * from employees where lastname = 'Smith';

select * from employees where lastname= 'Smith' or lastname = 'Doe';

select * from employees where department = 14;

select * from employees where department = 37 or department = 77;

select sum(budget) FROM departments;

select department, count(*) from employees group by department;

select department from employees group by department having count(*) >2;

select name from departments order by budget desc limit 1 offset 1;

select name, lastname from employees where department=(SELECT code from departments order by budget asc limit 1);

select name from employees where city='Almaty' union all select name from customers where city = 'Almaty';

select name from departments where budget > 60000 order by budget asc, code desc;

update departments set budget = budget*0.9 where budget = (Select budget from departments order by budget asc limit 1)
returning *;

update employees set department = 14 where department = 77 returning *;

delete from employees as emp where emp.department=14;


delete from employees *;
select * from employees;