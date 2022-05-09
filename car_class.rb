require 'pry'
class Car
  KEY = "hello"
  $carCount = 0
  attr_accessor :brand, :color
  @@number_of_cars = 0

  def initialize(brand, color)
    @brand = brand
    @color = color
    @engine_started = false
    @@number_of_cars += 1
    $carCount += 1
  end

  def start
    @engine_started = true
  end

  def stop
    @engine_started = false
  end

  def self.count
    @@number_of_cars
  end
end
myCar = Car.new("toyota", "red")
binding.pry
myCar = Car.new("volvo", "blue")
