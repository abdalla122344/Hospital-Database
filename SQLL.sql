use Hospital
insert into Department
values('cardiology',1),('pediatrics',2),('neurology',3),('orthopedics',4)
select* from Department

insert into Doctor
values(101,'ahmed ali','cardiologist','01012345678',1),
(102,'sara hassan','pediatrician','01123456789',2),
(103,'omar mohamed','neurologist','01234567890',3),
(104,'Mona Samir','Orthopedic','01534567890',4),
(105,'Youssef Adel','Cardiologist','01098765432',1)
select* from Doctor

insert into Patient
values(201,'Ali Hassan','2005-03-15','Cairo','01011112222'),
(202,'Mariam Ahmed','2007-07-20','Giza','01122223333'),
(203,'Youssef Mohamed','2004-11-10','Cairo','01233334444')
select* from Patient

insert into Diagnosis
values(301,'Regular follow-up','High blood pressure',201),
(302,'Needs rest' ,'Migraine',202),
(303,'Medication prescribedm','Heart problem',203)
select* from Diagnosis


insert into appointment
values('2026-08-01','09:00:00','Completed',101,201,301,401),
('2026-08-02','10:30:00','Completed',102,202,302,402),
('2026-08-03','11:00:00','Completed',103,203,303,403)
select* from appointment


insert into Room
values(1,'icu',2),
(2,'private',1),
(3,'general',4),
(4,'emergency',2)
select* from Room


insert into Assigne
values(201,1),
(202,2),
(203,3)
select* from Assigne


--questions

select* from Patient

select name ,specilization
from Doctor

select name 
from Patient
where address='cairo'

select * 
from Doctor
where specilization='cardiologist'

select name,birth,id
from Patient
order by birth asc


--level 2
select*
from Patient
where address='Cairo' and birth>'2005-01-01'


select* 
from Doctor
where specilization in ('Cardiologist','Neurologist')

select* 
from Patient
where id>202

select*
from appointment
where statues='Completed'

select*
from appointment
where date>'2026-08-02'

select D.name, Dep.name
from Doctor D
join Department Dep
on D.Dept_id=Dep.id

select P.name,D.description
from Patient P
join Diagnosis D
on P.id=D.P_id

select D.name as doc_name, P.name as patient_name,A.statues
from appointment A
join Patient P
on A.p_id=P.id
join Doctor D
on A.doc_id=D.id


select A.date,Doc.name,Dept.name,P.name,D.description
from appointment A
join Doctor Doc
on A.doc_id=Doc.id
join Department Dept
on Dept.id=Doc.Dept_id
join Patient P
on A.p_id=P.id
join Diagnosis D
on A.diag_id=D.id

select DOC.name,Dept.name
from Doctor Doc
join Department Dept
on Doc.Dept_id=Dept.id
where Doc.specilization='Cardiologist'

--level3

select DOC.name,Dept.name
from Doctor Doc
join Department Dept
on Doc.Dept_id=Dept.id

select P.name,D.description
from Patient P
join Diagnosis D
on P.id=D.P_id

select A.date,A.statues,Doc.name,P.name
from appointment A
join Doctor Doc
on A.doc_id=Doc.id
join Patient P
on A.p_id=P.id

select A.date,Doc.name,P.name,Dept.name,Diag.description
from appointment A
join Doctor Doc
on A.doc_id=Doc.id
join Patient P
on A.p_id=P.id
join Department Dept
on Doc.Dept_id=Dept.id
join Diagnosis Diag
on A.diag_id=Diag.id

select DOC.name,Dept.name
from Doctor Doc
join Department Dept
on Doc.Dept_id=Dept.id
where Doc.specilization='Cardiologist'

--level 4
select P.name,D.description
from Patient P
left join Diagnosis D
on P.id=D.P_id


select Dept.name,Doc.name
from Department Dept
left join Doctor Doc
on Dept.id=Doc.Dept_id

select P.name,A.statues
from Patient P
join appointment A
on P.id=A.p_id
where A.statues='Completed'

select Doc.name,A.date
from Doctor Doc
join appointment A
on Doc.id=A.doc_id
where A.date='2026-08-03'

select A.date,Doc.name,P.name,Dept.name,A.statues
from appointment A
join Doctor Doc
on A.doc_id=Doc.id
join Patient P
on A.p_id=P.id
join Department Dept
on Doc.Dept_id=Dept.id
where A.statues='Completed'

--level 5
select Dept.name,count(Doc.name)
from Department Dept
join Doctor Doc
on Dept.id=Doc.Dept_id
group by Dept.name

select Doc.name,count(A.id)
from Doctor Doc
join appointment A
on Doc.id=A.doc_id
group by Doc.name

select address,count(name)
from Patient 
group by address

--level 6
select Doc.name
from Doctor Doc
left join appointment A
on Doc.id=A.doc_id
where A.id is null

select P.name
from Patient P
join appointment A
on P.id=A.P_id
where A.statues='Scheduled'

select Dept.name,count(A.id)
from Department Dept
join Doctor Doc
on Dept.id=Doc.Dept_id
join appointment A
on Doc.id=A.doc_id
group by Dept.name 

select Doc.name,count(A.id)
from Doctor Doc
join appointment A
on Doc.id=A.doc_id
group by Doc.name
having count(A.id)>2

select Doc.name,Dept.name,P.name,Diag.description,A.date,A.statues
from appointment A
join Doctor Doc
on A.doc_id=Doc.id
join Department Dept
on Dept.id=Doc.Dept_id
join Patient P
on A.p_id=P.id
join Diagnosis Diag
on Diag.id=A.diag_id

--level 7
select Dept.name, Doc.name
from Department Dept
right join Doctor Doc
on Dept.id=Doc.Dept_id

select P.name,Diag.description
from Patient P
full outer join Diagnosis Diag
on P.id=Diag.P_id

select Doc.name,R.num as Room_id
from Doctor Doc
cross join Room R

select R.num,P.name
from Room R
left join Assigne A
on R.num=A.room_num
left join Patient P
on A.p_id=P.id

select Doc.name,Dept.name,P.name,R.num
from Doctor Doc
join appointment App
on Doc.id=App.doc_id
join Department Dept
on Doc.Dept_id=Dept.id
join Patient P
on P.id=App.p_id
join Assigne Ass
on Ass.p_id=P.id
join Room R
on R.num=Ass.room_num

select name from Doctor 
union 
select name from Patient 

select name from Doctor 
union All
select name from Patient 

select top 1 capacity
from Room
order by capacity desc

select top 1 capacity
from Room
order by capacity asc

select sum(capacity)
from Room

select count(num)
from Room

select name,birth,
case
  when birth<'2006-01-01'
    then 'older'
    else 'younger'
 end as age_group
 from Patient

 select id,statues,
 case
   when statues='Completed'
     then 'Finished'
     else  'Upcoming'
     end as APP_type
  from Appointment

  select Doc.name,Dept.name,Count(A.id)
  from Doctor Doc
  left join appointment A
  on Doc.id=A.doc_id
  join Department Dept
  On Doc.Dept_id=Dept.id
  group by Doc.name,Dept.name


  --level 8
  select name
  from Doctor 
  where specilization=(select specilization
                       from Doctor
                       where name='Ahmed Ali')

  select name from Patient
  where birth<(select avg(birth) from Patient)

  select name 
  from Doctor
