# 3.
# a)
INSERT into Authors (name) values ('Antanas Škėma'),
('Simonas Daukantas'),
('Vincas Kudirka'),
('Kazys Binkis');
# b) 
INSERT into Books (authorid, title, year) values (8, 'Balta drobulė', 1968),
(9, 'Darbai senųjų lietuvių ir žemaičių', 1912),
(10, 'Dievų miškas', 1957),
(11, 'Atžalynas', 1937);
# c)
SELECT Books.title, Authors.name FROM Books LEFT JOIN Authors ON Books.authorId = Authors.authorId;
# d)
UPDATE Books SET authorId = 8 WHERE authorId = 9;
# e) 1.
SELECT Authors.name, COUNT( Books.bookId ) AS kiekis FROM Authors LEFT JOIN Books ON Authors.authorId = Books.authorId GROUP BY Authors.authorId;
# e) 2.
SELECT Authors.name, COUNT( Books.bookId ) AS kiekis FROM Authors INNER JOIN Books ON Authors.authorId = Books.authorId GROUP BY Authors.authorId;
# f)
DELETE FROM Authors WHERE 1 = 1 ORDER BY authorId DESC LIMIT 4;
# g)
DELETE Books FROM Books LEFT JOIN Authors ON Books.authorId = Authors.authorId WHERE Authors.authorId IS NULL;
