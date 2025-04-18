create database job_portal;
use job_portal;

create table user (
id int not null unique  auto_increment, 
name varchar(50) primary key ,
email varchar(50) , 
password varchar(50),
qualification varchar(50),
role varchar(50)
);
 

select * from user; 
create  table jobs(	
id int primary key not null ,
title varchar(500), 
description varchar(3000), 
category varchar(50),
status varchar(50),
locations varchar(50),
pdate timestamp Null default now()
);
 
create  table jobs(
id int primary key not null auto_increment, 
title varchar(500), 
description varchar(3000), 
category varchar(50),
status varchar(50),
locations varchar(50),
pdate timestamp Null default now()
);

select * from jobs; 	



select * from jobs;