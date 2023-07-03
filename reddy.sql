create database reddy;

use reddy;

create table employee(
	salary int not null,
    driverId int auto_increment,
    driverName varchar(20) not null,
    dob date not null,
    primary key (driverId)
);

create table vehicle(
	regNO varchar(10) not null,
    driverId int ,
    pickup varchar(10) not null,
    destination varchar(10) not null,
    timing time,
    ticket_price int not null,
    foreign key (driverId) references employee(driverId) on delete cascade,
    primary key (regNO)
);

create table ticket(
	userName varchar(10) not null,
    pickup varchar(10) not null,
    destination varchar(10) not null,
    amount int not null,
    ticketNo int not null ,
    seatNo int not null,
    phoneNo bigint not null,
    pickupDate date not null,
    regNO varchar(10) not null,
    pickup_time time not null,
    primary key(phoneNo),
	foreign key (regNO) references vehicle(regNO) on delete cascade
);

create table clients(
	userId int not null auto_increment,
	userName varchar(10) not null,
    userPassword varchar(255) not null,
    state varchar(20) not null,
    district varchar(20) not null,
	pincode int not null,
    dob date not null,
    phoneNo bigint not null,
    gender varchar(10) not null,
    primary key (userId),
	foreign key (phoneNo) references ticket(phoneNo) on delete cascade
);


insert into employee(salary,driverName,dob) values(10000,"ashik",'2001-12-12');
insert into employee(salary,driverName,dob) values(1000,"basker",'2001-11-12');
insert into employee(salary,driverName,dob) values(100,"ravi",'2001-10-12');
insert into employee(salary,driverName,dob) values(10,"naveen",'2001-09-12');
insert into employee(salary,driverName,dob) values(1,"manoj",'2001-08-12');
select * from employee;

insert into vehicle values("0002",1,"guntur","banglore",'12:55:00',2000);
insert into vehicle values("0003",2,"srikakulam","tekali",'11:55:00',1000);
insert into vehicle values("0004",3,"ballari","sirsila",'10:55:00',3000);
insert into vehicle values("0005",4,"tuni","bunga",'09:55:00',4000);
insert into vehicle values("0006",5,"kong","godzilla",'08:55:00',5000);
select * from vehicle;

select * from ticket;
select count(seatNo) from ticket where userName="ashik";

select * from employee;
select destination from vehicle;
select userId,userName,phoneNo from clients where userName='ashik' AND userPassword=md5('12345');


SELECT dob, MIN(salary)
FROM employee
WHERE dob IS NOT NULL
GROUP BY dob
ORDER BY MIN(salary) DESC;

SELECT MAX(salary) - MIN(salary) DIFFERENCE
FROM employee;


SELECT driverId, COUNT(*)
FROM employee
GROUP BY driverId;

SELECT ROUND(MAX(salary),0) 'Maximum',
ROUND(MIN(salary),0) 'Minimum',
ROUND(SUM(salary),0) 'Sum',
ROUND(AVG(salary),0) 'Average'
FROM employee;


SELECT AVG(salary),count(*) 
FROM employee
WHERE driverId = 5;

SELECT driverId,dob,driverName, salary 
FROM employee 
WHERE salary > 
ALL (SELECT salary FROM employee WHERE driverId = '4') ORDER BY salary;

SELECT driverId, driverName 
FROM employee AS A 
WHERE salary > 
(SELECT AVG(salary) FROM employee WHERE driverId = 5);


