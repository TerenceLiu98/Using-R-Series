##################
###Example One ###
##################
# Create a sequence of numbers from $3$ to $30$ in steps of $3$
example_1 <- seq(3, 30, by = 3)

##################
###Example Two ###
##################
# Create a sequence of number from $1$ to $30$ 
# that does not include the numbers that where 
# mentioned above(those that are divisible by $3$)
# solution one 
example_2 <- seq(1, 30, by = 1)
example_2 [-intersect(example_1, example_2)]