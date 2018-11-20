create schema MusicJukeBoxSys

create table MusicJukeBoxSys.Customer
(
CustomerID int identity(1,1) primary key,
CustName varchar(50)not null,
Address varchar(50)not null,
DOB datetime not null,
City varchar(20)not null,
Password varchar(15)not null,
MobileNo bigint not null
);

create table MusicJukeBoxSys.Employee
(
EmployeeID int identity(1,1) primary key,
EmpName varchar(50)not null,
Address varchar(50)not null,
DOB datetime not null,
City varchar(20)not null,
Password varchar(15)not null,
MobileNo bigint not null
);

create table MusicJukeBoxSys.Album
(
AlbumID int identity(1,1)primary key, 
AlbumName varchar(50), 
Category varchar(20) not null,
No_Of_Songs int not null,
[Release Date] date not null,
Company varchar(20) not null,
Price money not null,
Language varchar(20) not null
);

drop table MusicJukeBoxSys.Album

create table MusicJukeBoxSys.Songs
(
SongID int identity(1,1) primary key,
SongName varchar(20) not null,
Singer varchar(20) not null,
Movie varchar(20) not null,
ComposedBy varchar(20) not null,
Lyrics varchar(20) not null,
Year int not null,
AlbumID int not null foreign key references MusicJukeBoxSys.Album(AlbumID),
Language varchar(20) not null
)


create proc CustomerLogin(
@custName varchar(50),
@pass varchar(15),
@ret int out
)
as 
begin
select count(*) from MusicJukeBoxSys.Customer where CustName=@custName and Password=@pass
set @ret=1
end