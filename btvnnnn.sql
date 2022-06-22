create database TongHopCSDL;

create table Student(
RN int primary key,
Name varchar(255),
Age int,
Status varchar(255)
);
create table Test(
TestID int primary key,
Name varchar(255)
);
create table StudentTest(
RN int,
foreign key(RN) references student(RN),
TestID int,
foreign key(TestID) references Test(TestID),
Date datetime,
Mark float
);
drop table studenttest;
insert into student values (1,'Nguyễn Hồng Hà',20,1);
insert into student values (2,'Truong Ngoc Anh',30,2);
insert into student values (3,'Tuan Minh',25,3);
insert into student values (4,'Dan Truong',22,3);

insert into Test values (1,'EPC');
insert into Test values (2,'DWMX');
insert into Test values (3,'SQL1');
insert into Test values (4,'SQL2');

insert into StudentTest values (1,1,'2006-07-17',8);
insert into StudentTest values (1,2,'2006-07-18',5);
insert into StudentTest values (1,3,'2006-07-19',7);
insert into StudentTest values (2,1,'2006-07-17',7);
insert into StudentTest values (2,2,'2006-07-18',4);
insert into StudentTest values (2,3,'2006-07-19',2);
insert into StudentTest values (3,1,'2006-07-17',10);
insert into StudentTest values (3,3,'2006-07-18',1);


-- cau2

select student.Name , test.Name,studenttest.Mark,studenttest.Date
from studenttest join student on student.RN= studenttest.RN
 join test on test.TestID = studenttest.TestID;
 
 -- cau 3
 
 select *from student where student.RN not in (select student.RN from studenttest);
 
 -- cau 4
 
 select * from studenttest where studenttest.Mark<5;
 
 -- cau 5 
 
 select student.name, avg(Mark) as 'diemtb'  from studenttest join student on student.RN = studenttest.Rn
 group by Name order by avg(Mark) desc;
 
 -- cau 6
  select student.name, avg(Mark) as 'diem cao nhat'  from studenttest join student on student.RN = studenttest.Rn
 group by Name order by avg(Mark) desc limit 1 ;
 
 -- cau 7
 select test.Name, max(Mark) as 'max mark' from studenttest join test on studenttest.TestID = test.TestID
 group by test.Name order by Name ;
 
 -- cau 8
 
 select student.Name,test.Name from studenttest join test on studenttest.TestID = test.TestID
 join student on studenttest.RN =student.RN where ;
 
 -- cau 9 
 
 update student set age = age + 1 where RN>0;
 
 -- cau 10
 alter table student add column statuss varchar(10);
 
 -- cau 11
 
 update student set status = 'young' where age<30 and RN>0;
 update student set status = 'old' where age>30 and RN>0;
 
 -- cau 12