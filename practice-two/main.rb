require_relative 'auto.rb'
require_relative 'fleet.rb'

require 'json'
json_data = File.read(file_name)
ruby_objects = JSON.parse(json_data)


Nissan_Passat = Auto.new("Nissan","Passat",2020,8)
Lada_Priora = Auto.new("Lada","Priora",1,5)
Mersedes_Benz_AMG_GT = Auto.new("Mersedes Benz","AMG GT",2018,16)

# puts Nissan_Passat.to_s
# puts Lada_Priora.to_s
# puts Mersedes_Benz_AMG_GT.to_s

autos = Fleet.new()

autos.add(Nissan_Passat)
autos.add(Lada_Priora)