# Type, Mode, Class

1
1L
T
TRUE
a
"a"
Sys.Date()

typeof(1)
typeof(1L)
typeof(T)
typeof("a")
typeof(Sys.Date())

mode(1)
mode(1L)
mode(T)
mode("a")
mode(Sys.Date())

class(1)
class(1L)
class(T)
class("a")
class(Sys.Date())

# Structure: Vector, Matrix, Array, Dataframe, List

# Vector

c(1, 2, 3, 4, 5, 6)
c(T, F, T, T, F, F)
c("a", "b", "c", "d", "e", "f")
c(1, 2, 3, "d", "e", "f")
c(T, F, T, "d", "e", "f")

str(c(1, 2, 3, 4, 5, 6))
str(c(T, F, T, T, F, F))
str(c("a", "b", "c", "d", "e", "f"))
str(c(1, 2, 3, "d", "e", "f"))
str(c(T, F, T, "d", "e", "f"))

c1 <- c(1, 2, 3)
(c2 <- c(c1, 4, 5, 6))
(c3 <- append(c1, c(4, 5, 6)))
(c4 <- append(c1, c(4, 5, 6), after=1))

1:10
seq(1, 10)
seq(10)
seq(1, 10, by = 2)
seq(1, 10, length = 4)

seq(along = c3)
seq_along(c3)

rep(1, times = 5)
rep(1:3, times = 2)
rep(1:3, each = 2)
rep(1:3, each = 2, times = 3)
rep(c("a", "b"), times = c(2, 3))
rep(1:3, length = 5)

x <- scan()
x
y <- scan(what = "character")
y

c5 <- c("a", "b", "c")
names(c1) <- c5
c1

c(a = 1, b = 2, c = 3)

c(1)
1

# Matrix

matrix(c(1, 2, 3, 4, 5, 6), nrow = 2)
matrix(c(T, F, T, T, F, F), ncol = 2)
matrix(c("a", "b", "c", "d", "e", "f"), 3, byrow = T)
matrix(c(1, 2, 3, "d", "e", "f"), 3)
matrix(c(T, F, T, "d", "e", "f"), 3)

str(matrix(c(1, 2, 3, 4, 5, 6), nrow = 2))
str(matrix(c(T, F, T, T, F, F), ncol = 2))
str(matrix(c("a", "b", "c", "d", "e", "f"), 3, byrow = T))
str(matrix(c(1, 2, 3, "d", "e", "f"), 3))
str(matrix(c(T, F, T, "d", "e", "f"), 3))

(m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2))
dim(m)
dim(m) <- c(3, 2)
m

rownames(m) <- c("a", "b", "c")
colnames(m) <- c("x", "y")
m

# Array

array(1:12, c(2, 3, 2))
str(array(1:12, c(2, 3, 2)))

a <- 1:24
dim(a) <- c(3, 4, 2)
a
dim(a)
str(a)

# Dataframe

data.frame(x = c(1, 2, 3), y = c("d", "e", "f"))
str(data.frame(x = c(1, 2, 3), y = c("d", "e", "f")))

(d <- data.frame(x = c("a", "b", "c", "d", "e"),
                 y = c(1, 2, 3, 4, 5)))

x <- c("a", "b", "c", "d", "e")
y <- c(1, 2, 3, 4, 5)
(d <- data.frame(x, y))

(m <- matrix(1:6, 2))
(d <- as.data.frame(m))
colnames(m) <- paste0("x", 1:3)
(d <- as.data.frame(m))

(l <- list(1:3, c("a", "b", "c")))
(d <- as.data.frame(l))
(l <- list(x = 1:3, y = c("a", "b", "c")))
(d <- as.data.frame(l))

dim(d)
nrow(d)
ncol(d)
length(d)

(d <- as.data.frame(m))

names(d)
colnames(d)
rownames(d)

names(d) <- paste0("z", 1:3)
rownames(d) <- paste0("n", 1:2)
d

rownames(d) <- NULL
d

# List

l <- list(1:6, array(1:12, c(2, 3, 2)), list(T, "a"))
str(l)

names(l)
names(l) <- c("a", "b", "c")
names(l)
str(l)
l

# Transformation

(v <- 1:6)
is.vector(v)

as.matrix(v)
matrix(v, 2)
v

as.data.frame(v)
data.frame(v)
as.data.frame(matrix(v, 2))
v

as.list(v)
unlist(as.list(v))
list(v)
unlist(list(v))
v

(m <- matrix(v, 2))
is.matrix(m)

as.vector(m)
as.data.frame(m)
as.list(m)

(d <- data.frame(x=1:3, y=4:6))
is.data.frame(d)
str(d)

as.vector(d)
as.matrix(d)
as.vector(as.matrix(d))
as.list(d)

(l <- list(1:3, 4:6))
is.list(l)

as.vector(l)
unlist(l)

matrix(l)
matrix(unlist(l), 2)

as.data.frame(l)

rm(list=ls())
