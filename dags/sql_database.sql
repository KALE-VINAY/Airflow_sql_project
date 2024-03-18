create database if not exists dezyre_db;

use dezyre_db;

create table if not exists `dezyre_db`.`employees` ( emp_id int 
auto_increment primary key, 
first_name varchar(500) NOT null,
last_name varchar(500) NOT null,
hire_date date,
job_id varchar(225),
salary DECIMAL(7,2),
commission_pct DECIMAL(6,2),
manager_id int,
dept_id int );


INSERT INTO `dezyre_db`.`employees` (`emp_id`,
`first_name`,`last_name`, `hire_date`, `job_id`,
 `salary`, `commission_pct`, `manager_id`, `dept_id`)
VALUES (100,"Steven","King",'1987-06-17',"AD_PRES",24000.00,0.00,0,90),
(101,"Neena","Kochhar",'1987-06-18',"AD_VP",17000.00,0.00,100,90),
(102,"Lex","DeHaan",'1987-06-19',"AD_VP",17000.00,0.00,100,90),
(103,"Alexander","Hunold",'1987-06-20',"IT_PROG",9000.00,0.00,102,60),
(104,"Bruce","Ernst",'1987-06-21',"IT_PROG",6000.00,0.00,103,60),
(105,"David","Austin",'1987-06-22',"IT_PROG",4800.00,0.00,103,60),
(106,"Valli","Pataballa",'1987-06-23',"IT_PROG",4800.00,0.00,103,60),
(107,"Diana","Lorentz",'1987-06-24',"IT_PROG",4200.00,0.00,103,60),
(108,"Nancy","Greenberg",'1987-06-25',"FI_MGR",12000.00,0.00,101,100),
(109,"Daniel","Faviet",'1987-06-26',"FI_ACCOUNT",9000.00,0.00,108,100);


SELECT DISTINCT `job_id` from `dezyre_db`.`employees`;

SELECT COUNT( DISTINCT `job_id`) from `dezyre_db`.`employees`;

SELECT MAX(`salary`) from `dezyre_db`.`employees`;

SELECT MIN(`salary`) from `dezyre_db`.`employees`;


CREATE DATABASE dezyre_library;

use dezyre_library;

CREATE TABLE authors( id int, author_name string , country string )
ROW FORMAT DELIMITED fields terminated by ',' TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE books( id int, book_title string )
ROW FORMAT DELIMITED fields terminated by ',' TBLPROPERTIES ("skip.header.line.count"="1");

load data local inpath '/home/bigdata/Downloads/data_authors.txt' into table `dezyre_library`.`authors`;

load data local inpath '/home/bigdata/Downloads/data_books.txt' into table `dezyre_library`.`books`;







