# To show all books all_books method: 
def all_books   
end
# To list all people all_people method: 
def all_people
end
# To create person create_person method: 
def create_person
end
# To Create a book create_book method:
def create_book
end
# To Create a rental create_book method:
def create_renatl
end
# To show all rentals all_rentals method: 
def all_rentals
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
