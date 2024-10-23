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
('Penguin Books', '80 Strand, London, UK', '442078756444'),
('HarperCollins', '195 Broadway, New York, NY', '2122077000'),
('Simon & Schuster', '1230 Avenue of the Americas, New York, NY', '2126987000'),
('Macmillan', '120 Broadway, New York, NY', '2127258600');


INSERT INTO BOOK (Book_id, Title, Publisher_name)
VALUES
(18, 'To Kill a Mockingbird', 'HarperCollins'),
(19, 'The Great Gatsby', 'Penguin Books'),
(20, 'The Catcher in the Rye', 'Simon & Schuster'),
(21, '1984', 'Penguin Books'),
(22, 'Brave New World', 'Macmillan'),
(23, 'Fahrenheit 451', 'Simon & Schuster');


INSERT INTO BOOK_AUTHORS (Book_id, Author_name)
VALUES
(18, 'Harper Lee'),
(19, 'F. Scott Fitzgerald'),
(20, 'J.D. Salinger'),
(21, 'George Orwell'),
(22, 'Aldous Huxley'),
(23, 'Ray Bradbury');

INSERT INTO LIBRARY_BRANCH (Branch_id, Branch_name, Address)
VALUES
(8, 'Downtown Branch', '123 Main St, Los Angeles, CA'),
(9, 'Uptown Branch', '456 Broadway St, Los Angeles, CA'),
(10, 'Midtown Branch', '789 Pine St, San Francisco, CA');

INSERT INTO BOOK_COPIES (Book_id, Branch_id, No_of_copies)
VALUES
(18, 8, 3),
(18, 9, 5),
(19, 8, 4),
(20, 9, 2),
(21, 10, 6),
(22, 8, 3),
(23, 9, 7);


INSERT INTO BORROWER (Card_no, Name, Address, Phone)
VALUES
(1010, 'Angela Martin', '845 Maple Ave, Los Angeles, CA', '2135556789'),
(1011, 'Oscar Martinez', '152 Elm St, Los Angeles, CA', '2135559988'),
(1012, 'Kevin Malone', '321 Oak St, Los Angeles, CA', '2135557788'),
(1013, 'Meredith Palmer', '456 Palm Dr, San Francisco, CA', '4155551122');


INSERT INTO BOOK_LOANS (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES
(18, 8, 1010, '2024-10-15', '2024-11-15'),
(19, 8, 1011, '2024-10-16', '2024-11-16'),
(20, 9, 1012, '2024-10-17', '2024-11-17'),
(21, 10, 1013, '2024-10-18', '2024-11-18'),
(22, 8, 1011, '2024-10-19', '2024-11-19'),
(23, 9, 1012, '2024-10-20', '2024-11-20');


