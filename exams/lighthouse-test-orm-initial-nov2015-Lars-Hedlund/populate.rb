# NOTE: No need for you to run this - For teachers only

require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

require 'active_record'
require 'factory_girl'
require 'faker'
require 'database_cleaner'

require './models/library'
require './models/book'
require './models/lend'

require './factories/libraries'
require './factories/books'
require './factories/lends'

# Connect to the DB
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/questions.sqlite3'
)

# Recreate the database
ActiveRecord::Migration.suppress_messages do
  require './db/schema.rb'
end


@library1 = FactoryGirl.create :library, name: 'Burnaby Library'
@library2 = FactoryGirl.create :library, name: 'Surrey Library'
@library3 = FactoryGirl.create :library, name: 'Richmond Library'

@bookA = FactoryGirl.create :book, library: @library1, title: 'I Win!', author: 'U. Lose'
@bookB = FactoryGirl.create :book, library: nil, title: 'Robots', author: 'Anne Droid'
@bookC = FactoryGirl.create :book, library: @library1, title: 'Fart noises', author: 'Hugh Jass'
@bookD = FactoryGirl.create :book, library: nil, title: 'Tug of War', author: 'Paul Hard'
@bookE = FactoryGirl.create :book, library: @library1, title: "Life's not fair!", author: 'Y. Me'

@lendA1 = FactoryGirl.create :lend, book: @bookA, library: @library1,
  checkout: 10.days.ago,
  due: 5.days.ago,
  checkin: 2.days.ago,
  extended: true

@lendA2 = FactoryGirl.create :lend, library: @library1, book: @bookA,
  checkout: 1.day.ago,
  due: 1.days.from_now,
  checkin: nil,
  extended: false

@lendC1 = FactoryGirl.create :lend, library: @library1, book: @bookC,
  checkout: 20.days.ago,
  due: 18.days.ago,
  checkin: 18.days.ago,
  extended: false

@lendC2 = FactoryGirl.create :lend, library: @library1, book: @bookC,
  checkout: 10.days.ago,
  due: 3.days.ago,
  checkin: 4.days.ago,
  extended: true

@lendC3 = FactoryGirl.create :lend, library: @library1, book: @bookC,
  checkout: 1.days.ago,
  due: 3.days.ago,
  checkin: 1.days.ago,
  extended: false

@bookF = FactoryGirl.create :book, library: @library2, title: "Golly Gosh!", author: 'G. Whiz'
@bookG = FactoryGirl.create :book, library: @library2, title: "Parachuting", author: 'Hugo First'
@bookH = FactoryGirl.create :book, library: nil, title: "I'm Fine", author: 'Howard Yu'
@bookH = FactoryGirl.create :book, library: @library2, title: "Fifty Yards to the Outhouse", author: 'Willy Makit & Betty Wont'
@bookI = FactoryGirl.create :book, library: nil, title: "The Palace Roof has a Hole", author: 'Lee King'


@lendG1 = FactoryGirl.create :lend, library: @library2, book: @bookG,
  checkout: 1.days.ago,
  due: 3.days.from_now,
  checkin: nil,
  extended: true

@lendH1 = FactoryGirl.create :lend, library: @library2, book: @bookH,
  checkout: 2.days.ago,
  due: 2.days.from_now,
  checkin: Date.today,
  extended: true

