-- ================ --
-- CUSTOM SQL QUERY --
-- QUESTION 13      --
-- ================ --
--
-- Execute this file directly against the SQLite3 database from the command line.
-- From the test's root directory, type:
--
-- sqlite3 db/questions.sqlite3 < spec/13.sql
--
-- There are no automated tests for this question. You have to compare your result
-- to the expected output.

-- =============== --
-- IMPORTANT TIP
-- =============== --
--
-- The database schema is the same as before (see schema.rb).
-- It has some seeded data in all three tables that you should quickly explore first
--
-- To get familiar with the data in a quick and easy way, you can connect to the database via the SQLite3 REPL:
-- From the test's root directory, type:
--
-- sqlite3 db/questions.sqlite3

-- It is suggested that you run the three dot commands below after connecting, to make the output formatting more readable.
-- Use the .quit command to exit the REPL

-- ================= --
-- OUTPUT FORMATTING
-- ================= --
--
-- Leave the following lines in so that the output is formatted in a readable way.
.headers on
.mode column
.width 30

-- ======== --
-- QUESTION --
-- ======== --
--
-- Take the query from Question 9, and then modify it in order to:
--
-- Narrow down the results such that only books that have more than 1 lend show up
--
-- =============== --
-- EXPECTED OUTPUT --
-- =============== --
--
-- title                           num_lends
-- ------------------------------  ----------
-- Fart noises                     3
-- I Win!                          2
--
--
-- ====================== --
-- EDIT THE FOLLOWING SQL --
-- ====================== --


SELECT books.title, count(lends.book_id) AS num_lends
FROM books
LEFT JOIN lends ON (lends.book_id = books.id)
GROUP BY books.title
HAVING num_lends >= 1;
