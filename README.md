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

On my computer the above tests give me the following results:

## How much memory creating the object takes?

```
***************************************************
*             Executing 1000 times                *
*             Accessing 5 times                   *
***************************************************
params: hash_access false, hash_symbol_access: false, creation: true, access: false

## Memory

Calculating -------------------------------------
          Hash gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
       Ostruct gets:     1.800M memsize (     1.800k retained)
                         2.000k objects (     2.000  retained)
                         0.000  strings (     0.000  retained)
            OO gets:     1.840M memsize (     1.840k retained)
                         3.000k objects (     3.000  retained)
                         0.000  strings (     0.000  retained)
            EO gets:     1.800M memsize (     1.800k retained)
                         2.000k objects (     2.000  retained)
                         0.000  strings (     0.000  retained)
            PO gets:    23.420M memsize (    15.801M retained)
                       102.090k objects (   421.000  retained)
                         0.000  strings (     0.000  retained)

Comparison:
          Hash gets::          0 allocated
       Ostruct gets::    1800000 allocated - Infx more
            EO gets::    1800000 allocated - Infx more
            OO gets::    1840000 allocated - Infx more
            PO gets::   23420200 allocated - Infx more
```

## How long does it take just to create the objects?

```
***************************************************
*             Executing 1000 times                *
*             Accessing 5 times                   *
***************************************************
params: hash_access false, hash_symbol_access: false, creation: true, access: false

## Ips

Warming up --------------------------------------
          Hash gets:     6.000  i/100ms
       Ostruct gets:     9.000  i/100ms
            OO gets:     9.000  i/100ms
            EO gets:    10.000  i/100ms
            PO gets:     1.000  i/100ms
Calculating -------------------------------------
          Hash gets:     63.909  (± 3.1%) i/s -    324.000  in   5.077099s
       Ostruct gets:     98.505  (± 1.0%) i/s -    495.000  in   5.025301s
            OO gets:     96.078  (± 1.0%) i/s -    486.000  in   5.058599s
            EO gets:    100.881  (± 1.0%) i/s -    510.000  in   5.055668s
            PO gets:     11.695  (± 8.6%) i/s -     59.000  in   5.066882s

Comparison:
            EO gets::      100.9 i/s
       Ostruct gets::       98.5 i/s - 1.02x  slower
            OO gets::       96.1 i/s - 1.05x  slower
          Hash gets::       63.9 i/s - 1.58x  slower
            PO gets::       11.7 i/s - 8.63x  slower

```

## How much memory is used, how fast the implementation, when the object is accessed?

Access all fields once

```
***************************************************
*             Executing 1000 times                *
*             Accessing 1 times                   *
***************************************************
params: hash_access false, hash_symbol_access: false, creation: false, access: true

## Ips

Warming up --------------------------------------
          Hash gets:    31.000  i/100ms
       Ostruct gets:    28.000  i/100ms
            OO gets:     8.000  i/100ms
            EO gets:    28.000  i/100ms
            PO gets:    28.000  i/100ms
Calculating -------------------------------------
          Hash gets:    318.845  (± 0.3%) i/s -      1.612k in   5.055849s
       Ostruct gets:    286.414  (± 2.4%) i/s -      1.456k in   5.086858s
            OO gets:     84.326  (± 2.4%) i/s -    424.000  in   5.032448s
            EO gets:    283.926  (± 2.1%) i/s -      1.428k in   5.032141s
            PO gets:    281.323  (± 2.5%) i/s -      1.428k in   5.079130s

Comparison:
          Hash gets::      318.8 i/s
       Ostruct gets::      286.4 i/s - 1.11x  slower
            EO gets::      283.9 i/s - 1.12x  slower
            PO gets::      281.3 i/s - 1.13x  slower
            OO gets::       84.3 i/s - 3.78x  slower


## Memory

Calculating -------------------------------------
          Hash gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
       Ostruct gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
            OO gets:     1.760M memsize (     0.000  retained)
                        44.000k objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
            EO gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
            PO gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)

Comparison:
          Hash gets::          0 allocated
       Ostruct gets::          0 allocated - same
            EO gets::          0 allocated - same
            PO gets::          0 allocated - same
            OO gets::    1760000 allocated - Infx more
```

Access all fields 10 times

```
***************************************************
*             Executing 1000 times                *
*             Accessing 10 times                  *
***************************************************
params: hash_access false, hash_symbol_access: false, creation: false, access: true

## Ips

Warming up --------------------------------------
          Hash gets:     2.000  i/100ms
       Ostruct gets:     2.000  i/100ms
            OO gets:     1.000  i/100ms
            EO gets:     2.000  i/100ms
            PO gets:     2.000  i/100ms
Calculating -------------------------------------
          Hash gets:     32.231  (± 3.1%) i/s -    162.000  in   5.032494s
       Ostruct gets:     27.090  (± 7.4%) i/s -    136.000  in   5.057397s
            OO gets:      8.633  (± 0.0%) i/s -     44.000  in   5.098749s
            EO gets:     24.523  (± 8.2%) i/s -    122.000  in   5.011578s
            PO gets:     26.167  (± 7.6%) i/s -    132.000  in   5.074041s

Comparison:
          Hash gets::       32.2 i/s
       Ostruct gets::       27.1 i/s - 1.19x  slower
            PO gets::       26.2 i/s - 1.23x  slower
            EO gets::       24.5 i/s - 1.31x  slower
            OO gets::        8.6 i/s - 3.73x  slower


## Memory

Calculating -------------------------------------
          Hash gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
       Ostruct gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
            OO gets:    17.600M memsize (     0.000  retained)
                       440.000k objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
            EO gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
            PO gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)

Comparison:
          Hash gets::          0 allocated
       Ostruct gets::          0 allocated - same
            EO gets::          0 allocated - same
            PO gets::          0 allocated - same
            OO gets::   17600000 allocated - Infx more
```

## How much memory is used when trying to access the object using hash notation?

Access all fields once

```
***************************************************
*             Executing 1000 times                *
*             Accessing 1 times                   *
***************************************************
params: hash_access false, hash_symbol_access: true, creation: false, access: false

## Ips

Warming up --------------------------------------
          Hash gets:    31.000  i/100ms
       Ostruct gets:    38.000  i/100ms
            OO gets:     7.000  i/100ms
            EO gets:    50.000  i/100ms
            PO gets:    21.000  i/100ms
Calculating -------------------------------------
          Hash gets:    319.344  (± 1.3%) i/s -      1.612k in   5.048830s
       Ostruct gets:    398.902  (± 2.0%) i/s -      2.014k in   5.051065s
            OO gets:     77.818  (± 1.3%) i/s -    392.000  in   5.038186s
            EO gets:    503.427  (± 0.6%) i/s -      2.550k in   5.065500s
            PO gets:    215.433  (± 0.9%) i/s -      1.092k in   5.069185s

Comparison:
            EO gets::      503.4 i/s
       Ostruct gets::      398.9 i/s - 1.26x  slower
          Hash gets::      319.3 i/s - 1.58x  slower
            PO gets::      215.4 i/s - 2.34x  slower
            OO gets::       77.8 i/s - 6.47x  slower


## Memory

Calculating -------------------------------------
          Hash gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
       Ostruct gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
            OO gets:     3.520M memsize (     0.000  retained)
                        88.000k objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
            EO gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
            PO gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)

Comparison:
          Hash gets::          0 allocated
       Ostruct gets::          0 allocated - same
            EO gets::          0 allocated - same
            PO gets::          0 allocated - same
            OO gets::    3520000 allocated - Infx more
```

Access all fields 10 times once

```
***************************************************
*             Executing 1000 times                *
*             Accessing 10 times                  *
***************************************************
params: hash_access false, hash_symbol_access: true, creation: false, access: false

## Ips

Warming up --------------------------------------
          Hash gets:     3.000  i/100ms
       Ostruct gets:     4.000  i/100ms
            OO gets:     1.000  i/100ms
            EO gets:     5.000  i/100ms
            PO gets:     2.000  i/100ms
Calculating -------------------------------------
          Hash gets:     32.937  (± 0.0%) i/s -    165.000  in   5.009610s
       Ostruct gets:     40.646  (± 2.5%) i/s -    204.000  in   5.020811s
            OO gets:      7.963  (± 0.0%) i/s -     40.000  in   5.023484s
            EO gets:     51.596  (± 0.0%) i/s -    260.000  in   5.039351s
            PO gets:     21.259  (± 4.7%) i/s -    108.000  in   5.088790s

Comparison:
            EO gets::       51.6 i/s
       Ostruct gets::       40.6 i/s - 1.27x  slower
          Hash gets::       32.9 i/s - 1.57x  slower
            PO gets::       21.3 i/s - 2.43x  slower
            OO gets::        8.0 i/s - 6.48x  slower


## Memory

Calculating -------------------------------------
          Hash gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
       Ostruct gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
            OO gets:    35.200M memsize (     0.000  retained)
                       880.000k objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
            EO gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)
            PO gets:     0.000  memsize (     0.000  retained)
                         0.000  objects (     0.000  retained)
                         0.000  strings (     0.000  retained)

Comparison:
          Hash gets::          0 allocated
       Ostruct gets::          0 allocated - same
            EO gets::          0 allocated - same
            PO gets::          0 allocated - same
            OO gets::   35200000 allocated - Infx more
```
