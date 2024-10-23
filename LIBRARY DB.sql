create database LIBRARY;
use LIBRARY;
create table PUBLISHER(
     Name varchar(255),
     Address varchar(255),
     Phone varchar(11),
     primary key(Name));
create table BOOK(
    Book_id int,
    Title varchar(255),
    Publisher_name varchar(255),
    foreign key(Publisher_name) references PUBLISHER(Name),
    primary key(Book_id));
    
 create table BOOK_AUTHORS(
     Book_id int,
     Author_name varchar(255),
     primary key(Book_id,Author_name));

Create table BOOK_COPIES(
Book_id int,
Branch_id int,
No_of_copies int,
primary key(Book_id,Branch_id),
foreign key(Book_id) references BOOK(Book_id),
foreign key(Branch_id) references LIBRARY_BRANCH(Branch_id));
    
    

