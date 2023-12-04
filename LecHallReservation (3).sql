create database LecHallRes;
-- drop database LecHallRes;

use LecHallRes;

create table LectureHalls
(HallID			varchar(16)	primary key,
 HallName		varchar(16)	not null,
 MaxStudents	int);
 
insert into LectureHalls values
	("A7406", "A7 406", 200),
    ("A11201", "A11 201", 110),
    ("A11301", "A11 301",110), 
	("A7115", "A7 115", 25),
	("B1212", "B1 212", 350);
 
-- drop table LectureHalls;
-- select * from LectureHalls;
-- insert into LectureHalls values (
 
 create table Lecturer
 (LecID			varchar(16)	primary key,
  LecName		varchar(32)	not null,
  PassHash		varchar(32)	not null);
insert into Lecturer values
	("ps18092", "Sandul", "passsandul"),
    ("ps18082", "Sasanga", "passsasanga"),
    ("ps18063", "Danushi", "passdanushi");

select * from Lecturer;
-- drop table Lecturer;
-- select LecName, PassHash from lecturer where LecID = 'ps18092';
  
  create table Reserved
  (ResID		int			auto_increment	primary key,
   ResDate		date,
   StartTime	time,
   EndTime		time,
   LecID		varchar(16),
   HallID		varchar(16),
   NoOfStudents int,
   CONSTRAINT FKResLec FOREIGN KEY (LecID) REFERENCES Lecturer(LecID),
   CONSTRAINT FKResHall FOREIGN KEY (HallID) REFERENCES LectureHalls(HallID));
   
   insert into Reserved (ResDate, StartTime, EndTime, LecID, HallID, NoOfStudents) values
   ('2023-02-05', '12:00:00', '13:29:00',  "ps18092", "A7406", 174),
   ('2023-02-05', '13:00:00', '15:59:00',  "ps18092", "A11201", 93),
   ('2023-02-06', '14:30:00', '16:29:00',  "ps18082", "A11301", 67),
   ('2023-02-06', '16:00:00', '17:59:00',  "ps18082", "A7115", 13);
   
   insert into Reserved (ResDate, StartTime, EndTime, LecID, HallID, NoOfStudents) values ('2023-02-07', '13:00:00', '14:59:00',  "ps18063", "B1212", 273);

   select HallID from Reserved
   where ResDate = '2023-02-05'
   and StartTime between '13:00:00' and '15:00:00'
   or EndTime between '13:00:00' and '15:00:00';
 
   drop table Reserved;
   
select * from Reserved;

