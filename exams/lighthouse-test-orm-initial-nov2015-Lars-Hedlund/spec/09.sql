-- ================ --
-- CUSTOM SQL QUERY --
-- QUESTION 9       --
-- ================ --
--
-- Execute this file directly against the SQLite3 database from the command line.
-- From the test's root directory, type:
--
-- sqlite3 db/questions.sqlite3 < spec/09.sql
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
-- Write a SQL query that returns ALL books' titles, and the number of times they have been checked out.
--
-- You can assume that the book titles are unique.
--
-- PART B: Order the results such that books with the more # of lends appear at the top (by popularity)
--
-- =============== --
-- EXPECTED OUTPUT --
-- =============== --
--
-- title                           num_lends
-- ------------------------------  -------------------------
-- Fart noises                     3
-- I Win!                          2
-- Fifty Yards to the Outhouse     1
-- Parachuting                     1
-- Golly Gosh!                     0
-- I'm Fine                        0
-- Life's not fair!                0
-- Robots                          0
-- The Palace Roof has a Hole      0
-- Tug of War                      0
--
-- ====================== --
-- EDIT THE FOLLOWING SQL --
-- ====================== --

SELECT books.title, count(lends.book_id) AS num_lends
FROM books
LEFT JOIN lends ON (lends.book_id = books.id)
GROUP BY books.title;
