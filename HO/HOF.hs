--Basic intro on higher-order funcs

map2 f [] = []
map2 f (x:xs) = (f x):(map2 f xs)

abs2 [] = []
abs2 (x:xs) = (abs x):(abs2 xs)

absHO = map abs

sum2 [] = 0
sum2 (x:xs) = x + (sum2 xs)


