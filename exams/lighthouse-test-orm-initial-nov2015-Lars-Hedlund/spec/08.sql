-- ================ --
-- CUSTOM SQL QUERY --
-- QUESTION 8       --
-- ================ --
--
-- Execute this file directly against the SQLite3 database from the command line.
-- From the test's root directory, type:
--
-- sqlite3 db/questions.sqlite3 < spec/08.sql
--
-- There are no automated tests for this question. You have to compare your result
-- to the expected output.

-- =============== --
-- IMPORTANT TIPS
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
.width 30, 25, 17

-- ======== --
-- QUESTION --
-- ======== --
--
-- Write a SQL query that returns ALL books (title and author) as well as the name of the library to which they belong to
--
-- =============== --
-- EXPECTED OUTPUT --
-- =============== --
--
-- title                           author                     name
-- ------------------------------  -------------------------  -----------------
-- I Win!                          U. Lose                    Burnaby Library
-- Robots                          Anne Droid
-- Fart noises                     Hugh Jass                  Burnaby Library
-- Tug of War                      Paul Hard
-- Life's not fair!                Y. Me                      Burnaby Library
-- Golly Gosh!                     G. Whiz                    Surrey Library
-- Parachuting                     Hugo First                 Surrey Library
-- I'm Fine                        Howard Yu
-- Fifty Yards to the Outhouse     Willy Makit & Betty Wont   Surrey Library
-- The Palace Roof has a Hole      Lee King
--
-- ====================== --
-- EDIT THE FOLLOWING SQL --
-- ====================== --

SELECT books.title, books.author, libraries.name
FROM books
LEFT OUTER JOIN libraries ON (books.library_id = libraries.id);
