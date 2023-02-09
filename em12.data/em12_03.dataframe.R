# index

(d <- data.frame(x = c("a", "b", "c", "d", "e"),
                 y = c(1, 2, 3, 4, 5)))

d[1]
d[[1]]
str(d[1])
str(d[[1]])

d["x"]
d[["x"]]

d[c(2, 1)]
d[[c(2, 1)]]
d[[2]][[1]]

d$x
d$x[1]

d[d$y <= 3,]
(d1 <- d[d$y <= 3,])
(d2 <- d[d$y >= 3,])

d[1,]
d[,1]
d[1,1]

# duplicated, complete cases

(d <- data.frame(x=c("a", "b", "c", "c", "d", NA),
                 y=c(1, 2, 3, 3, 4, 5)))
duplicated(d)
df[!duplicated(d),]
which(duplicated(d))

complete.cases(d)
(d <- d[complete.cases(d),])

# subset

(d <- data.frame(d, c = c(1, 0, 0, 1, 1)))
subset(d, subset = y >= 3)
subset(d, subset = y >= 3, select = c("y", "c"))
subset(d, subset = y >= 3 & c == 1)
subset(d, subset = y >= mean(y))

# sample

sample(d, 5, replace=T)
sample(d, 5)

set.seed(1234)
i <- sample(nrow(d), 5)
d[i,]

# with, within

(d <- data.frame(a = 1:5, b = 6:10))

d$a * d$b
with(d, a * b)

with(d, {
  ab <- a * b
  plot(a, ab)
})
ab

with(d, {
  ab <<- a * b
  plot(a, ab)
})
ab

d$ab1 <- d$a * d$b
d
(d <- within(d, ab2 <- a * b))

# apply

(m <- matrix(1:12, 3))
apply(m, 1, max)
apply(m, 2, min)

(a <- array(1:24, c(3, 4, 2)))
apply(a, 1, paste, collapse = ",")
apply(a, 2, paste, collapse = ",")
apply(a, c(1, 2), paste, collapse = ",")
apply(a, 3, paste, collapse = ",")

# lapply, sapply

(l <- list(x = 1:10, y = 11:18, z = 21:29))
lapply(l, length)
unlist(lapply(l, length))
sapply(l, length)

lapply(l, mean)
lapply(l, sd)
lapply(l, range)

sapply(l, mean)
sapply(l, sd)
sapply(l, range)

lapply(d, length)
sapply(d, length)

lapply(d, mean)
lapply(d, sd)
lapply(d, range)

sapply(d, mean)
sapply(d, sd)
sapply(d, range)

# mapply

x <- 1:10
y <- 11:20

mapply(sum, x, y)

# tapply, table

(d <- data.frame(d, c = c(1,1,0,0,0)))
with(d, tapply(b, c, mean))

(d <- data.frame(d, d = c(1,0,1,0,1)))
with(d, tapply(b, list(x = c, y = d), mean))

summary(d)
by(d, d$b, summary)

table(d$c)
table(d$c, d$d)
table(cut(d$b, 3))

rm(list=ls())
