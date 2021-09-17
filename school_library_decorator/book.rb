class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(self, date, person)
  end

  def self.create_book
    print 'title: '
    title = gets.chomp

    print 'author: '
    author = gets.chomp

    puts 'Book has been created successfully'
    Book.new(title, author)
  end

  def self.all_books(books)
    if books.length.positive?
      books.each { |book| puts "title: #{book.title}, Author: #{book.author}" }
    else
      puts 'Sorry! Cannot find any book.'
    end
  end

end
