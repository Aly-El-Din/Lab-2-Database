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

INSERT INTO PUBLISHER (Name, Address, Phone)
VALUES
('Penguin Books', '375 Hudson St, New York, NY', '2123662000'),
('HarperCollins', '195 Broadway, New York, NY', '2122077000'),
('Simon & Schuster', '1230 Avenue of the Americas, New York, NY', '2126987000');

INSERT INTO BOOK (Book_id, Title, Publisher_name)
VALUES
(1, 'The Great Gatsby', 'Penguin Books'),
(2, 'To Kill a Mockingbird', 'HarperCollins'),
(3, '1984', 'Penguin Books'),
(4, 'The Catcher in the Rye', 'Simon & Schuster');

INSERT INTO BOOK_AUTHORS (Book_id, Author_name)
VALUES
(1, 'F. Scott Fitzgerald'),
(2, 'Harper Lee'),
(3, 'George Orwell'),
(4, 'J.D. Salinger');

INSERT INTO LIBRARY_BRANCH (Branch_id, Branch_name, Address)
VALUES
(1, 'Downtown Branch', '100 Main St, New York, NY'),
(2, 'Uptown Branch', '500 Broadway, New York, NY'),
(3, 'Midtown Branch', '350 5th Ave, New York, NY');


INSERT INTO BOOK_COPIES (Book_id, Branch_id, No_of_copies)
VALUES
(1, 1, 3),
(1, 2, 2),
(2, 1, 4),
(2, 3, 5),
(3, 1, 6),
(3, 2, 4),
(4, 3, 2);

INSERT INTO BORROWER (Card_no, Name, Address, Phone)
VALUES
(1001, 'John Doe', '123 Maple St, New York, NY', '2125551234'),
(1002, 'Jane Smith', '456 Oak St, New York, NY', '2125555678'),
(1003, 'Bob Johnson', '789 Pine St, New York, NY', '2125558765');


INSERT INTO BOOK_LOANS (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES
(1, 1, 1001, '2024-10-10', '2024-11-10'),
(2, 3, 1002, '2024-10-15', '2024-11-15'),
(3, 1, 1003, '2024-10-20', '2024-11-20'),
(4, 2, 1001, '2024-10-18', '2024-11-18');
