class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book

    book.rentals << self

    @person = person

    person.rentals << self
  end

  def self.create_rental
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

    puts 'Rental created successfully'
    Rental.new(date, @books[book_index], @people[person_index])
  end
end
