require 'active_record'
require_relative 'contact'
require_relative 'phone'

class ContactApp

  class InitialArgumentsError < StandardError
  end

  class DuplicateEntryError < StandardError
  end

  def initialize
    # ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.establish_connection(
      database: 'contacts',
      adapter: 'postgresql'
    )
  end

  def run
    parse_arguments
  end

  private

  # Prints out the help informaton to the screen
  def help
    puts "Here is a list of available commands:
    new  - Create a new contact
    list - List all contacts
    show (id)- Show a contact
    find - Find a contact"
  end

  # Parses the command line arguments
  def parse_arguments
    begin
      command ||= ARGV.shift
      argument ||= ARGV.shift
      # puts "#{command} #{argument} in ARGV"
      raise InitialArgumentsError, "Incorrect Number of Arguments:" unless command || ARGV.empty?
      case command.downcase
      when "help"
        help
      when "list"
        list_contacts
      when "show"
        show_contact(argument) unless argument.nil?
      when "find"
        find_contact(argument) unless argument.nil?
      when "new"
        new_contact
      else
        raise InitialArgumentsError, "That command is not available:"
      end
    rescue InitialArgumentsError, DuplicateEntryError => e
      puts e
      help
      exit
    end
  end

  # Gets the input from the user.
  def provide(input_name)
    print "Please provide a(n) #{input_name}: "
    gets.chomp
  end

  def list_contacts
    contacts = Contact.all
    contacts.each do |contact|
      puts contact.to_s
      contact.phones.each do |phone|
        puts phone.to_s
      end
    end
    puts "================="
    puts "Total records: #{contacts.count}"
  end

  def find_contact(argument)
    puts "All contacts with '#{argument}':"
    matches = []
    matches << Contact.where(firstname: argument.to_s)
    matches << Contact.where(lastname: argument.to_s)
    matches << Contact.where(email: argument.to_s)
    matches.flatten!
    matches.each { |m| puts m.to_s }
  end

  def show_contact(argument)
    contact = Contact.find(argument)
    puts contact.to_s
    contact.phones.each do |phone|
     puts phone.to_s
    end
  end

  def new_contact
    email = provide("email")
    unless Contact.where(email: email).empty?
      raise DuplicateEntryError, "Email already in Database."
    end
    firstname = provide("first name")
    lastname = provide("last name")
    new_contact = Contact.new do |contact|
      contact.firstname = firstname
      contact.lastname = lastname
      contact.email = email
    end
    new_contact.save
    get_phone_number("home", new_contact)
    get_phone_number("mobile", new_contact)
    get_phone_number("other", new_contact)
  end

  def get_phone_number(phone_type, contact)
    print "Please provide the contacts #{phone_type} phone number, or leave blank: "
    digits = gets.chomp
    new_number = Phone.new do |phone|
      phone.phone_type = phone_type
      phone.digits = digits
      phone.contact_id = contact.id
    end
    new_number.save
  end

end

ContactApp.new.run
