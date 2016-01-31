Ruby Assessment Test: YOU SUNK MY BATTLESHIP!!
==============================================

                                _/|     _/|-++'
                            +  +--|    |--|--|_ |-
                         { /|__|  |/\__|  |--- |||__/
                        +---------------___[}-_===_.'____                 /\
          _         ____`-' ||___-{]_| _[}-  |     |_[___\==--            \/   _
     __..._|___--==/___]_|__|_____________________________[___\==--____,------' .7
    |                                                          HMCS LIGHTHOUSE  /
     \_________________________________________________________________________|

## Introduction

Welcome to the Navy! Simulated navy, that is. Everyone's favourite board game, Battleship, has come to Lighthouse Labs.

We have deployed a state-of-the-art frigate, the HMCS Lighthouse, to take out the opponent's ships. Your mission is to write the code necessary to send them to Davy Jones' Locker.

This assessment test has 7 required questions and should be completed in 2 hours. 

There is an additional bonus question, worth 10%. Therefore the maximum you can score on this test is 110%.

**Please read this document very carefully before starting.**

## Mark Allocation

01. 20%
02. 20%
03. 10%
04. 10%
05. 10%
06. 10%
07. 20%
08. 10% (BONUS)

## Tips (read in full!)

Read the `board.rb` code first and make sure you understand everything in there, especially the GRID.

Note: `%w{}` is just fancy syntax that allows us to create an array of strings.

So `%w{a b c}` translates to `['a', 'b', 'c']`

If you have questions about what tests are expecting, feel free to ask.

The test file names describe what is being implemented.

Run `bundle install` to get started.

Run `bundle exec rspec spec/01_*.rb` to run first test suite. 

The CONSTANTS (eg: `MAX_X`) are just variables. You should use them instead of hard coding that value. Feel free to define others.

Remember to just define `attr_reader` for each of your instance variables to start. Since these define getter and setter (reader and writer) methods for each of your instance variables, don't redefine those methods manually.

## Your Mission

Run each set of tests (specs) using rspec from the project's root directory via command line: `bundle exec rspec spec/01_*.rb`.

The task will will output the results of the test and initially we will see a bunch of failing tests.

Your goal is the make all the tests pass, before proceeding onto the next step.

**Steps:**

1. Read the CODE for the spec file that you ran.
2. Understand what tests it contains and what each test in that file is expecting.
3. Start implementing your code to satisfy each test.
4. Run the test suite using the same `bundle exec rspec` command, to ensure that you are seeing more and more passing tests.
5. Repeat steps 1 through 4 until all tests pass for that suite.

Once all the tests are passing for that suite, run the next suite.

Example: `bundle exec rspec spec/02_*.rb`

When you are done implementing all the code, you can simply run `bundle exec rspec spec/*` to run all the tests at once, and make sure everything is working as expected.

## Marking

Even if you make all the tests pass, you may lose marks for incorrectly implementing the solution (eg: incorrect use of OOP).

This test is created such that there are indeed correct right ways to implement your app, and incorrect ways.

You can also lose marks for bad form. Some Examples of bad form include:

* Improper or confusing naming of variables, methods, etc.
* Improper indentation
* Overly verbose code that could be implemented much more simply in Ruby
* Not writing code in the "Ruby Way". (Example: using camel casing for variable or method names instead of underscores)

**Note:** Hard coding the behaviour of a method to simply make the current tests pass but not actually fulfilling the goal/responsibility of the method will *not* count as a valid solution, warranting no part marks at all.

## Other Important Notes:

* Do not modify the code in the `spec` folder.
* The tests will require you to create new classes as you progress. These will need to be created in the same folder as `ship.rb`: the `lib` folder.
* You **are allowed** to google around.
* Please do not create a public repo nor share your work in any other way with anyone during the test.
* This test is intended to take 2 hours to complete.
