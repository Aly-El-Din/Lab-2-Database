create database LIBRARY;

use LIBRARY;


create table BOOK_LOANS(
	Book_id INT,
    Branch_id INT,
    Card_no INT,
	Date_out date not null,
    Due_date date not null,
    primary key (Book_id, Branch_id, Card_no),
    foreign key (book_id) references BOOK(Book_id),
    foreign key (Branch_id) references BOOK(Branch_id)
);

create table LIBRARY_BRANCH(
	Branch_id INT,
    Branch_name varchar(255) not null,
    Address varchar(500) not null,
	primary key (Branch_id),
    foreign key (Branch_id) references BOOK (Branch_id)
);

create table BORROWER(
	Card_no INT,
    Name varchar(255) not null,
    Address varchar(255),
    Phone varchar(11),
	primary key (Card_no),
    foreign key (Card_no) references BOOK_LOANS (Card_no)
);