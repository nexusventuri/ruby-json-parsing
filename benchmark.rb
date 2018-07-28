require_relative 'lib/requires'
n = 2_002

json_string = File.read('derivative_with_options.json')

#Bench::Parsing.run(json_string, n)
#Bench::Creation.run(json_string, n)
1..3.times do |x|
  Bench::Access.run(json_string, n, x)
end
#Bench::CreationAndAccess.run(json_string, n)

