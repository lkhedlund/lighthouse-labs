Assessment Test 2 - ActiveRecord & SQL
======================================

## Domain Models

We're modelling a simple library book management software. There are three models, `Book`, `Library`  and `Lend` in the models folder. Use the `db/schema.rb` for reference about their columns.

## FactoryGirl

FactoryGirl is a simple gem that is used specifically for creating test data for our RSpec tests.

Essentially it saves us from having to always specify column (attribute) values when creating records. The factories folder contains three files, one for each model.

Take a browse through these factories now. While doing so, please also note that for some fields another gem called Faker is used to randomly generate values so that when we create instances using our factory, they always have random data.

## ActiveRecord Queries

**Important Note**: Your queries (filtering a subset of data, sorting, etc.) should leverage the database (by using ActiveRecord calls) instead of performing the filters using Ruby's methods (such as `sort`, `select` or `detect`.)

## Questions

There are 13 questions, 4 of which are bonus, totalling 120%.

Run each test using the `rspec` command (for example, `bundle exec rspec spec/01.rb`) and make it pass.

If you'd like to run a **specific** test (to reduce the noise,) add the line number. Example:

    bundle exec rspec spec/01.rb:13

The tests are run against a database that is recreated each time you run RSpec. This should be a familiar setup, but you can look at the `spec_helper.rb` file to remind yourself how that works.

**Important Note**: Questions/tests that are imperative to make pass (are dependencies) for the rest of the questions are marked with a double star (**). In other words, you can safely skip questions that are not marked with any stars, in case you want to come back to them later.

**Important Note**: Some questions are SQL only. For these questions, please follow the instructions within the .sql (text) file. Your answer should be placed within these files.

## Mark Allocation

01. 10% **
02. 15%
03. 12%
04. 10%
05. 15%
06. 10%
07. 10%
08. 10% - SQL
09. 8%  - SQL
10. 5% (BONUS)
11. 5% (BONUS)
12. 5% (BONUS)
13. 5% (BONUS) - SQL

## Rules (IMPORTANT)

* A mark of 80% or higher is considered a PASS.
* You are allowed to Google around.
* Please do not create a public repo nor share your work in any other way with anyone during the test.
* This test is intended to take 2 hours to complete.
* No collaboration with your peers is allowed during the test.
* You will be deducted points for bad form, including improper indentation, counter intuitive or confusing code, bad naming conventions, commented out code, etc..
