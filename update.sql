# Žanrų lentelė
CREATE TABLE Genres (
	genreId int(11) NOT NULL AUTO_INCREMENT, 
	description varchar(255),
	PRIMARY KEY (`genreId`)
);
# Žanro laukas knygų lentelėje
ALTER TABLE Books ADD genreId int(11) DEFAULT NULL;
# Sukuriamas žanras
INSERT INTO Genres (description) VALUES ('Programming');
# Nustatomi knygų žanrai
UPDATE Books SET genreId = 1 WHERE 1 = 1;

# Knygų-Autorių asociacinė lentelė
CREATE TABLE BookAuthors (bookId int(11) NOT NULL, authorId int(11) NOT NULL);
# Užpildoma asociacinė lentelė pagal esamus duomenis
INSERT INTO BookAuthors (bookId, authorId) SELECT bookId, authorId FROM Books;
# Nebereikalingas authorId stulpelis Books lentelėje
ALTER TABLE Books DROP COLUMN authorId;
# Pridedami prie knygų antri autoriai
INSERT INTO BookAuthors (bookId, authorId)
  SELECT Books.bookId, Authors.authorId
  FROM Books, Authors
  WHERE Books.title = 'Regular Expressions Cookbook, 2nd Edition' && Authors.name = ' Jan Goyvaerts'
;
INSERT INTO BookAuthors (bookId, authorId)
  SELECT Books.bookId, Authors.authorId
  FROM Books, Authors
  WHERE Books.title = 'Head First Networking' && Authors.name = ' Al Anderson'
;

# Išrenkamos knygos su jų autoriais, jei daugiau nei vienas autorius atskiriama kableliu
SELECT title, GROUP_CONCAT(Authors.name)
FROM Books
  LEFT JOIN BookAuthors
    ON Books.bookId = BookAuthors.bookId
  LEFT JOIN Authors
    ON BookAuthors.authorId = Authors.authorId GROUP BY Books.bookId;
# Lietuviškos raidės knygos pavadinime 
ALTER TABLE Books MODIFY title VARCHAR(255) CHARACTER SET utf8;

INSERT INTO Authors (name) VALUES ('Balys Sruoga');
INSERT INTO Genres (description) VALUES ('Memoirs');
INSERT INTO Books (title, year, genreId) 
  SELECT 'Dievų miškas', 1957, Genres.genreId
  FROM Genres WHERE Genres.description = 'Memoirs';
INSERT INTO BookAuthors (bookId, authorId) 
  SELECT Books.bookId, Authors.authorId 
  FROM Books, Authors 
  WHERE Books.title = 'Dievų miškas' && Authors.name = 'Balys Sruoga';
