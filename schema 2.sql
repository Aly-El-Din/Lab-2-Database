create database LIBRARY;
use LIBRARY;

create table PUBLISHER(
     Name varchar(255),
     Address varchar(255) not null,
     Phone varchar(11) not null,
     primary key(Name)
);

create table BOOK(
    Book_id int,
    Title varchar(255),
    Publisher_name varchar(255) not null,
    foreign key(Publisher_name) references PUBLISHER(Name),
    primary key(Book_id)
);

create table BOOK_AUTHORS(
     Book_id int,
     Author_name varchar(255) not null,
     primary key(Book_id,Author_name),
     foreign key (Book_id) references BOOK(Book_id)
);

create table LIBRARY_BRANCH(
    Branch_id INT,
    Branch_name varchar(255) not null,
    Address varchar(500) not null,
    primary key (Branch_id)
);

Create table BOOK_COPIES(
    Book_id int,
    Branch_id int,
    No_of_copies int,
    primary key(Book_id,Branch_id),
    foreign key(Book_id) references BOOK(Book_id),
    foreign key(Branch_id) references LIBRARY_BRANCH(Branch_id)
);

create table BORROWER(
    Card_no INT,
    Name varchar(255) not null,
    Address varchar(255),
    Phone varchar(11),
    primary key (Card_no)
);

create table BOOK_LOANS(
    Book_id INT,
    Branch_id INT,
    Card_no INT,
    Date_out date not null,
    Due_date date not null,
    primary key (Book_id, Branch_id, Card_no),
    foreign key (Book_id) references BOOK(Book_id),
    foreign key (Branch_id) references LIBRARY_BRANCH(Branch_id),
    foreign key (Card_no) references BORROWER (Card_no) 
);

