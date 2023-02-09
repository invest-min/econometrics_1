# Matrix

(m1 <- matrix(1:12, nrow=4))
(m2 <- matrix(1:12, nrow=4, byrow=T))
(m3 <- cbind(m1, m2))
(m4 <- rbind(m1, m2))

(v1 <- c(11, 12, 13, 14))
(v2 <- c(21, 22, 23, 24))
(v3 <- c(31, 32, 33, 34))

(cbind(v1, v2, v3))
(cbind(v1, v1, v1))
(m <- cbind(m1, v1))

nrow(m)
ncol(m)
length(m)
str(m)

m[1,] # Vector
m[1,, drop=F] # Matrix
m[1:2,]
m[c(1, 3),]
m[-1,]

m[,1] # Vector
m[,1, drop=F] # Matrix
m[, 1:2]
m[, c(1, 3)]
m[, -1]

m[1, 1]
m[1, 1] <- 111
m

# Array

(a <- array(1:24, c(3, 4, 2)))

length(a)
str(a)

a[,,1]
a[1,,1]
a[, 1, 1]
a[1, 1, 1]
a[1, 1, 1, drop=F]

# List

(l <- list())

l[[1]] <- 1
l[[2]] <- "a"
l[[3]] <- T
l[[4]] <- 1:3
l[[5]] <- matrix(1:9, 3)
l[[6]] <- mean
l

length(l)
str(l)

names(l) <- c("a", "b", "c")
l

l[1]
class(l[1])
l[1] * 10
l["a"] * 10

l[[1]]
class(l[[1]])
l[[1]] * 10
l[["a"]] * 10

l$a
class(l$a)
l$a * 10

l[c(1, 2)]
l[-1]
l[c(T, F, T, F, T, F)]

(l <- list(a=1, b=2, c=list(d=3, e=4)))

l[[1]]
l[["a"]]
l[["b"]]
l[["c"]]
l[["c"]][["d"]]
l[["c"]][["e"]]
l$c$e

l[[1]] <- 10
l
l[["a"]] <- 20
l
l$a <- 30
l

l[c("a", "b")] <- NULL
l

rm(list=ls())
