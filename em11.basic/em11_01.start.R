# Basic Operations

2 + 3
2 - 3
2 * 3
2 / 3

2 + 3 * 3
(2 + 3) * 3
2 - 3 / 3
(2 - 3) / 3

3 ^ 2
3 ^ (-2)
3 ^ (1 / 2)
sqrt(3)

# Assignment

a <- 2
b <- 3
a + b

c <- a + b
c

c1 <- a - b
c2 <- a * b
c3 <- a / b
c1; c2; c3

a = 2
a

plot(a, b)

assign(x, 10)
assign("x", 10)
x

x <- "y"
assign(x, 10)
x
y

get("y")
get(x)
get(y)

(x <- c("x1", "x2", "x3"))
get("x")
get("x")[1]

# Objects

ls()
ls.str()

rm(a)
ls()

rm(list = ls(pattern = "c"))
ls()

rm(list = ls())
ls()

save.image()
q()
