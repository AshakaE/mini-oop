require './corrector'

class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

def initialize(name="Unknown",age=0, parent_permission: true)
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

  private

  def of_age?
    @age >= 18
  end
end
