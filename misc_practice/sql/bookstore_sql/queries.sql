/* Exercise 1 */

SELECT
  editions.isbn
FROM
  editions
INNER JOIN publishers ON
  publishers.id = editions.publisher_id
  WHERE
  publishers.name = 'Random House';


/* Exercise 2 */

SELECT
  editions.isbn, books.title, publishers.name
FROM
  books
INNER JOIN
  editions ON editions.book_id = books.id
INNER JOIN
  publishers ON publishers.id = editions.publisher_id
WHERE
  publishers.name = 'Random House';

/* Exercise 3 */

SELECT
  editions.isbn, books.title, publishers.name, stock.retail, stock.stock
FROM
  books
INNER JOIN
  editions ON editions.book_id = books.id
INNER JOIN
  stock ON stock.isbn = editions.isbn
INNER JOIN
  publishers ON publishers.id = editions.publisher_id
WHERE
  publishers.name = 'Random House';

/* Exercise 4 */

SELECT
  editions.isbn, books.title, publishers.name, stock.retail, stock.stock
FROM
  books
INNER JOIN
  editions ON editions.book_id = books.id
INNER JOIN
  stock ON stock.isbn = editions.isbn
INNER JOIN
  publishers ON publishers.id = editions.publisher_id
WHERE
  publishers.name = 'Random House'
AND
  stock.stock > 0;

/* Exercise 5 */

SELECT
  editions.isbn, books.title, publishers.name, stock.retail, stock.stock,
  CASE WHEN editions.type = 'h' THEN 'hardcover'
       WHEN editions.type = 'p' THEN 'paperback'
  END AS type
FROM
  books
INNER JOIN
  editions ON editions.book_id = books.id
INNER JOIN
  stock ON stock.isbn = editions.isbn
INNER JOIN
  publishers ON publishers.id = editions.publisher_id
WHERE
  publishers.name = 'Random House'
AND
  stock.stock > 0;

/* Exercise 6 */

SELECT
  books.title, editions.publication
FROM
  books
LEFT JOIN editions ON editions.book_id = books.id;

/* Exercise 7 */

SELECT
  SUM(stock)
FROM
  stock;

/* Exercise 8 */
SELECT
  AVG(cost) AS "Average Cost",
  AVG(retail) AS "Average Retail",
  AVG(retail - cost) AS "Average Profit"
FROM
  stock;

/* Exercise 9 */
SELECT
  editions.book_id
FROM
  stock
  JOIN editions ON (editions.isbn = stock.isbn)
ORDER BY stock.stock DESC
LIMIT 1;

/* Exercise 10 */

SELECT
  authors.id AS "ID",
  (authors.first_name||' '||authors.last_name) AS "Full name",
  count(books.author_id) as "Number of Books"
FROM
  authors
  JOIN books ON (books.author_id = authors.id)
GROUP BY authors.id;

/* Exercise 11 */

SELECT
  authors.id AS "ID",
  (authors.first_name||' '||authors.last_name) AS "Full name",
  count(books.author_id) as "Number of Books"
FROM
  authors
  JOIN books ON (books.author_id = authors.id)
GROUP BY authors.id
ORDER BY "Number of Books" DESC;
