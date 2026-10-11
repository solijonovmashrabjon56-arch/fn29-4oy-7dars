DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(50),
    country VARCHAR(30),
    age INTEGER
);

CREATE TABLE books (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(100),
    price INTEGER,
    pages INTEGER,
    published_year INTEGER,
    author_id INTEGER REFERENCES authors(id)
);

INSERT INTO authors (full_name, country, age)
VALUES
('Abdulla Qodiriy', 'Uzbekistan', 44),
('Chingiz Aytmatov', 'Kyrgyzstan', 79),
('George Orwell', 'England', 46),
('Ernest Hemingway', 'USA', 61),
('Agatha Christie', 'England', 85),
('Jules Verne', 'France', 77),
('Mark Twain', 'USA', 74),
('Jack London', NULL, 40);

INSERT INTO books (title, price, pages, published_year, author_id)
VALUES
('O''tkan kunlar', 45000, 384, 1926, 1),
('Mehrobdan chayon', 40000, 320, 1929, 1),
('Obid ketmon', 35000, 280, 1934, 1),
('Jamila', 30000, 180, 1958, 2),
('Asrga tatigulik kun', 55000, 320, 1980, 2),
('Oq kema', 40000, 220, 1970, 2),
('Animal Farm', 35000, 112, 1945, 3),
('1984', 50000, 328, 1949, 3),
('Homage to Catalonia', 45000, 232, 1938, 3),
('The Old Man and the Sea', 40000, 128, 1952, 4),
('A Farewell to Arms', 55000, 355, 1929, 4),
('The Sun Also Rises', 48000, 260, 1926, 4),
('Murder on the Orient Express', 60000, 274, 1934, 5),
('And Then There Were None', 55000, 272, 1939, 5),
('The Mysterious Affair at Styles', 45000, 250, 1920, 5),
('Journey to the Center of the Earth', 50000, 300, 1864, 6),
('Around the World in 80 Days', 45000, 280, 1872, 6),
('Twenty Thousand Leagues Under the Sea', 65000, 430, 1870, 6),
('The Adventures of Tom Sawyer', 40000, 274, 1876, 7),
('Adventures of Huckleberry Finn', 50000, 366, 1884, 7),
('The Call of the Wild', 45000, 232, 1903, 8),
('White Fang', 40000, 298, 1906, 8);

SELECT * FROM authors;

SELECT * FROM books;

SELECT title, price, pages FROM books;

SELECT full_name, country FROM authors;

SELECT title, price AS book_price, pages AS book_pages
FROM books;

SELECT full_name AS author_name, country AS author_country
FROM authors;

SELECT * FROM books WHERE price > 50000;

SELECT * FROM books WHERE price < 40000;

SELECT * FROM books WHERE price = 50000;

SELECT * FROM books WHERE price <> 50000;

SELECT * FROM books WHERE pages > 300;

SELECT * FROM books WHERE published_year < 1900;

SELECT * FROM books
WHERE price > 40000 AND pages > 300;

SELECT * FROM books
WHERE price < 30000 OR price > 60000;

SELECT * FROM authors
WHERE country IN ('England', 'USA');

SELECT * FROM books ORDER BY price ASC;

SELECT * FROM books ORDER BY price DESC;

SELECT * FROM books ORDER BY pages DESC;

SELECT * FROM authors ORDER BY age ASC;

SELECT * FROM books
ORDER BY price DESC
LIMIT 5;

SELECT * FROM books
ORDER BY price ASC
LIMIT 5;

SELECT * FROM books
ORDER BY price DESC
LIMIT 5 OFFSET 5;

SELECT * FROM authors
ORDER BY age DESC
LIMIT 3;

SELECT * FROM books
ORDER BY price DESC
FETCH FIRST 3 ROWS ONLY;

SELECT * FROM books
ORDER BY price ASC
FETCH FIRST 5 ROWS ONLY;

SELECT * FROM books
WHERE price IN (35000, 45000, 55000);

SELECT * FROM authors
WHERE country IN ('Uzbekistan', 'USA', 'France');

SELECT * FROM books
WHERE price BETWEEN 40000 AND 55000;

SELECT * FROM books
WHERE pages BETWEEN 250 AND 400;

SELECT * FROM books
WHERE published_year BETWEEN 1900 AND 1950;

SELECT * FROM books
WHERE title LIKE 'The%';

SELECT * FROM books
WHERE title NOT LIKE 'The%'
AND title ILIKE '%the%';

SELECT * FROM authors
WHERE full_name ILIKE '%ov%';

SELECT * FROM books
WHERE title ILIKE '%World%';

SELECT * FROM authors
WHERE country IS NULL;

SELECT * FROM authors
WHERE country IS NOT NULL;

SELECT SUM(price) AS total_price
FROM books;

SELECT AVG(price) AS average_price
FROM books;

SELECT MAX(price) AS max_price
FROM books;

SELECT MIN(price) AS min_price
FROM books;

SELECT COUNT(*) AS book_count
FROM books;

SELECT AVG(pages) AS average_pages
FROM books;

SELECT title, LENGTH(title) AS title_length
FROM books
SELECT * FROM books
WHERE LENGTH(title) > 20;

SELECT * FROM authors
WHERE LENGTH(full_name) > 15;

SELECT author_id, COUNT(*) AS book_count
FROM books
GROUP BY author_id;

SELECT author_id, AVG(price) AS average_price
FROM books
GROUP BY author_id;

SELECT author_id, MAX(price) AS max_price
FROM books
GROUP BY author_id;

SELECT author_id, MIN(price) AS min_price
FROM books
GROUP BY author_id;

SELECT author_id, SUM(price) AS total_price
FROM books
GROUP BY author_id;

SELECT author_id, COUNT(*) AS book_count
FROM books
GROUP BY author_id
HAVING COUNT(*) > 2;

SELECT author_id, AVG(price) AS average_price
FROM books
GROUP BY author_id
HAVING AVG(price) > 45000;

SELECT author_id, SUM(price) AS total_price
FROM books
GROUP BY author_id
HAVING SUM(price) > 100000;

SELECT author_id, AVG(pages) AS average_pages
FROM books
GROUP BY author_id
HAVING AVG(pages) > 300;

SELECT title, price, pages
FROM books
WHERE price BETWEEN 40000 AND 55000
ORDER BY price DESC
LIMIT 5;

SELECT *
FROM books
WHERE title ILIKE '%The%'
AND price > 40000
ORDER BY price DESC;

SELECT
    author_id,
    COUNT(*) AS book_count,
    AVG(price) AS average_price,
    MAX(price) AS max_price,
    MIN(price) AS min_price
FROM books
GROUP BY author_id
HAVING COUNT(*) > 2;

SELECT
    author_id,
    COUNT(*) AS book_count
FROM books
GROUP BY author_id
HAVING COUNT(*) >= 3
ORDER BY book_count DESC
LIMIT 3;
