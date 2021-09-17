# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

# Creating class to have blueprints for objects
class App
  attr_accessor :books,:people,:rentals
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

end

def start_prompts
  puts 'Hello there,'
  puts 'Welcome to Basic UI of School Libraray App!'
  puts 'Please choose an option by entering a number:'
  puts '1- List all books.'
  puts '2- List all People.'
  puts '3- Create a Person.'
  puts '4- Create a Book.'
  puts '5- Create a Rental.'
  puts '6- List all Rentals for a given Person id.'
  puts '7- Exit.'
end

# To invoke main.rb
def main
  app = App.new
  entry = nil

  while entry != '7'
    start_prompts
    entry = gets.chomp
    puts entry

    case entry
    when '1'
      Book.all_books(app.books)
    when '2'
      Person.all_people(app.people)
    when '3'
      new_person = Person.create_person
      app.people << new_person if new_person
    when '4'
      app.books = Book.create_book
    when '5'
      @rental << Rental.create_rental(app.books,app.people)
    when '6'
      Rental.all_rentals(app.rentals)
    when '7'
      puts 'Thank you for using the app!'
    end
    puts "\n"
  end
end

main
# rubocop: enable Metrics/MethodLength
# rubocop: enable Metrics/CyclomaticComplexity
