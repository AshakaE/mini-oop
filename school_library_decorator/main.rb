# Importing other files 
require_relative './book.rb'
require_relative './classroom.rb'
require_relative './corrector.rb'
require_relative './person.rb'
require_relative './rental.rb'
require_relative './student.rb'
require_relative './teacher.rb'

Class Main
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
      puts 'Sorry, We cannot find any book!!'
    end
  end

# To list all people all_people method:
def all_people; end

# To create person create_person method:
def create_person
  puts 'Do you want to create a student (1) or a teacher (2)?'
  print 'Select (1) or (2)'
  print ' '
  selection = gets.chomp

  case selection
  when '1'
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    permission = permission.downcase == 'y'

    @people << Student.new(age, name, permission)

    puts 'student created successfully'
  when '2'
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name)

    puts 'Teacher created successfully'

  else
    puts 'invalid selection'

    nil
  end
end

# To Create a book create_book method:
def create_book; end

# To Create a rental create_book method:
def create_renatl; end

# To show all rentals all_rentals method:
def all_rentals; end
end
# To invoke main.rb
def main
  puts 'Hello there,'
  puts 'Welcome to Basic UI of School Libraray App!'
  puts 'Please choose an option by entering a number:'
  puts '1- List all books'
  puts '2- List all People'
  puts '3- Create a Person'
  puts '4- Create a Book'
  puts '5- Create a Rental'
  puts '6- List all Rentals for a given Person id'
  puts '7- Exit'
  puts ' '
  puts 'Do you want to Create a Student (1) or a teacher (2)?'
  number = gets.chomp
  puts number
end

main
