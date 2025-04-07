CREATE TABLE Library (
    Book_title VARCHAR2(100),
    Book_type VARCHAR2(50),
    Author_name VARCHAR2(50),
    Year_of_pub NUMBER,
    Subject VARCHAR2(50),
    No_of_copies NUMBER
);

INSERT INTO Library (Book_title, Book_type, Author_name, Year_of_pub, Subject, No_of_copies)
VALUES ('Programming in Java', 'Java', 'Balagurusamy', 2005, 'Computer Science', 10);

INSERT INTO Library (Book_title, Book_type, Author_name, Year_of_pub, Subject, No_of_copies)
VALUES ('Learn SQL Fast', 'SQL', 'James Watt', 2018, 'Databases', 7);

INSERT INTO Library (Book_title, Book_type, Author_name, Year_of_pub, Subject, No_of_copies)
VALUES ('Database Systems', 'SQL', 'C.J. Date', 2002, 'Databases', 12);

INSERT INTO Library (Book_title, Book_type, Author_name, Year_of_pub, Subject, No_of_copies)
VALUES ('Advanced Java Programming', 'Java', 'Herbert Schildt', 2010, 'Computer Science', 8);

INSERT INTO Library (Book_title, Book_type, Author_name, Year_of_pub, Subject, No_of_copies)
VALUES ('SQL for Beginners', 'SQL', 'Balagurusamy', 2008, 'Databases', 5);


SELECT Book_title, Book_type, Author_name FROM Library
WHERE Author_name = 'Balagurusamy' AND Book_type = 'Java';

SELECT Author_name, Book_type, Year_of_pub FROM Library WHERE Year_of_pub > 2000;

SELECT Subject, SUM(No_of_copies) FROM Library GROUP BY Subject;

SELECT * FROM Library GROUP BY Book_title;

CREATE VIEW SQL_books AS
SELECT * FROM Library WHERE Book_title LIKE '%SQL%';