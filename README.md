# Benchmarks

This project is to test different constructions that can be used in an api client. 
In restful_resource we use OpenObject but the implementation might not be the best memory wise

# How to run

run `bundle exec benchmark help` to get more information about how to run the project

# Interesting tests to run

- How much memory creating the object takes?

  `./benchmark exec 1000 --creation --no-access --tests=memory`

- How long does it take just to create the objects?

  `./benchmark exec 1000 --creation --no-access --tests=ips`

- How much memory is used, how fast the implementation, when the object is accessed?

  `./benchmark exec 1000 --access_per_iteration=1`

  `./benchmark exec 1000 --access_per_iteration=10`

- How much memory is used when trying to access the object using hash notation?

  `./benchmark exec 1000 --hash_symbol_access --no-access --access_per_iteration=1`

  `./benchmark exec 1000 --hash_symbol_access --no-access --access_per_iteration=10`
