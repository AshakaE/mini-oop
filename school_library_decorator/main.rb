require_relative "./student"
require_relative "./teacher"
require_relative "./book"
require_relative "./rental.rb"

# Creating class to have blueprints for objects
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # To show all books all_books method:
  def all_books
    if @books.length.positive?
      @books.each { |book| puts "title: #{book.title}, Author: #{book.author}" }
    else
      puts 'Sorry! Cannot find any book.'
    end
  end

  # To list all people all_people method:
  def all_people
    if @books.length.positive?
      @people.each do |person|
        puts "name: #{person.name}, age: #{person.age}, id: #{person.id}"
      end
    else
      puts 'Sorry! cannot find person'
    end
  end

  # To create person create_person method
  def create_person
    puts 'Do you want to create a student or a teacher?'
    puts 'For student press 1 and for teacher press 2'
    entry = gets.chomp

    case entry
    when '1'
      puts 'name: '
      name = gets.chomp

      puts 'age: '
      age = gets.chomp

      @people << Student.new(name, age)

      puts 'Student has been created successfully'
    when '2'
      print 'name: '
      name = gets.chomp

      print 'age: '
      age = gets.chomp

      print 'subject: '
      subject = gets.chomp
      @people << Teacher.new(name, age, subject)

      puts 'Teacher has been created successfully'

    else
      puts 'Invalid Enrty.'
      puts 'Select 1 for student and 2 for teacher'
    end
  end

  # To Create a book create_book method:
  def create_book
    print 'title: '
    title = gets.chomp

    print 'author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book has been created successfully'
  end

  # To Create a rental create_rental method:
  def create_rental
    puts 'Please select a book from the folowing list'
    @books.each_with_index do |book, index|
      puts "#{index}) title: '#{book.title}', author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts 'Please select a person from the following list'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] name: #{person.name}, age: #{person.age}, id: #{person.id}"
    end
    person_index = gets.chomp.to_i

    print 'date: '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  # To show all rentals all_rentals method:
  def all_rentals
    print 'id: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'rentals:'
    rentals.each do |rental|
      puts "book '#{rental.book.title}' by #{rental.book.author}, date: #{rental.date}"
    end
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
      app.all_books
    when '2'
      app.all_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.all_rentals
    when '7'
      puts 'Thank you for using the app!'
    end
    puts "\n"
  end
end

main
