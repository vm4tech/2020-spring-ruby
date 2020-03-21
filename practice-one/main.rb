require_relative 'my_complex.rb'

first = MyComplex.new(3,2)
second = MyComplex.new(2,3)

puts first.to_s
puts second

pp first.real
thirty = first.add(second)
puts thirty.to_s