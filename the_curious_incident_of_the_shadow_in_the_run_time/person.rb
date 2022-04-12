require "pry-byebug"

class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    binding.pry

    puts name.inspect
    puts defined?(name).inspect
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end

Person.new("Matz").say_name
# Person.new.say_name
