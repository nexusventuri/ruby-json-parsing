require_relative 'lib/requires'
n = 100_002

json_string = File.read('derivative_with_options.json')

#Bench::Parsing.run(json_string, n)
#Bench::Creation.run(json_string, n)
#Bench::Access.run(json_string, n)
Bench::CreationAndAccess.run(json_string, n)

