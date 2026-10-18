create database Hospital
use Hospital

create table Department
(name varchar(50) ,
id int primary key)

create table Doctor
(id int primary key,
name varchar(50),
specilization varchar(50),
phone varchar(50) ,
Dept_id int , 
foreign key (Dept_id) references Department (id))


create table Patient
(id int primary key,
name varchar(50) , 
birth date,
address varchar(50),
phone varchar(50))


create table Diagnosis
(id int primary key,
notes varchar(50),
description varchar(50),
P_id int ,foreign key (p_id) references Patient(id))



create table appointment
(date date,
time time,
statues varchar(50),
doc_id int ,foreign key (doc_id) references Doctor(id),
p_id int , foreign key (p_id) references Patient (id),
diag_id int , foreign key (diag_id) references Diagnosis(id),
id int primary key)


create table Room
(num int primary key,
type varchar(50),
capacity int)

create table Assigne
(p_id int ,foreign key (p_id) references Patient (id),
room_num int,foreign key (room_num) references Room(num),
primary key(p_id, room_num))