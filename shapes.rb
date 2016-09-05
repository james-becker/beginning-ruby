# class Square
#   def initialize(side_length)
#     @side_length = side_length
#   end

#   def area
#     @side_length * @side_length
#   end
# end

class Square
  def initialize
    if defined?(@@number_of_squares)
      @@number_of_squares += 1
    else
      @@number_of_squares = 1
    end
  end

  def Square.count
    @@number_of_squares
  end
end

a = Square.new
puts Square.count
b = Square.new
puts Square.count
c = Square.new
puts Square.count


class ParentClass
  def method1
    puts "Hello from method1 in the parent class"
  end

  def method2
    puts "Hello from method2 in the parents class"
  end
end

class ChildClass < ParentClass
  def method2
    puts "Hello from method2 in the child class"
  end
end

my_object = ChildClass.new
my_object.method2


class Person
  def initialize(name)
    @name = name
  end

  def name
    return @name
  end
end

class Doctor < Person
  def name
    "Dr. " + super
  end
end














