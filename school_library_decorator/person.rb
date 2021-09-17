require './corrector'

class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(parent_permission, name = 'Unknown', age = 0)
    @id = Random.rand(1..1000)
    @corrector = Corrector.new
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(date, person)
    Rental.new(self, date, person)
  end

  def self.all_people(people)
    if people.length.positive?
      people.each do |person|
        puts "name: #{person.name}, age: #{person.age}, id: #{person.id}"
      end
    else
      puts 'Sorry! cannot find person'
    end
  end

  def self.create_person
    puts 'Do you want to create a student or a teacher?'
    puts 'For student press 1 and for teacher press 2'
    entry = gets.chomp

    case entry
    when '1'
      puts 'name: '
      name = gets.chomp

      puts 'age: '
      age = gets.chomp

      print 'Do you have parent permission?'
      permission = gets.chomp
      permission = permission.downcase == 'Y'

      
      puts 'Student has been created successfully'
      @people << Student.new(name, age, permission)
    when '2'
      print 'name: '
      name = gets.chomp

      print 'age: '
      age = gets.chomp

      print 'subject: '
      subject = gets.chomp
      
      puts 'Teacher has been created successfully'
      @people << Teacher.new(name, age, subject)
    else
      puts 'Invalid Enrty.'
      puts 'Select 1 for student and 2 for teacher'
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
