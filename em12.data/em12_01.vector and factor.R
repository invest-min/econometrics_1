# Index

(v <- seq(1, 10, by=2))
v[3]
v[1:3]
v[c(1, 1, 5, 3)]

(i <- 5:1)
v[i]

v[-1]
v[-length(v)]

v[1] <- 9
v

v[6] <- 11
v

v[10] <- 11
v

v[c(7, 8, 9)] <- 10
v

v <= 5
v[v <= 5]

v[v %% 2 == 0]

seq_along(v)
v[seq_along(v) %% 3 == 0]

v
which(v <= 5)
v[which(v <= 5)]
which.min(v)
v[which.min(v)]
which.max(v)
v[which.max(v)]

(v <- c(5, 6, 4))
rank(v)
order(v)

sort(v)
sort(v, decreasing=T)

names(v) <- c("a", "b", "c")
v
v[1]
v["a"]

# Duplicated

(v <- c(1, 2, 3, 3, 4, 4, 5))
duplicated(v)
v[duplicated(v)]
which(duplicated(v))
v[which(duplicated(v))]

# Cut, Set

v

cut(v, 2)
summary(cut(v, 2))

cut(v, c(0, 3, 5))
table(cut(v, c(0, 3, 5)))
cut(v, c(0, 3, 5), labels = c("a", "b"))
table(cut(v, c(0, 3, 5), labels = c("a", "b")))

x <- 1:7
y <- 4:10

union(x, y)
intersect(x, y)
setdiff(x, y)
setdiff(y, x)

is.element(3, x)
is.element(3, y)
is.element(intersect(x, y), x)
is.element(setdiff(y, x), x)

# Sample

sample(1:10, 9)
sample(1:10, 9, replace=T)
sample(1:10, 9, replace=T)
sample(1:10, 9, replace=T, set.seed(1234))
sample(1:10, 9, replace=T, set.seed(1234))

# Factor

(v <- c("M", "M", "F", "F", "M"))
(f <- factor(v))

summary(v)
summary(f)
as.numeric(f)

(f <- factor(v, level=c("M", "F", "U")))
summary(f)
table(f)

levels(f)
levels(f) <- c("M", "F", "D")
f
nlevels(f)

factor(f)
as.factor(f)

(f <- factor(v, order=T))
(f <- factor(v, order=T, level = c("M", "F")))

(v <- c(1, 2, 2, 1, 1))
(f <- factor(v, levels = c(1, 2), labels = c("M", "F")))

(v <- c("a", "b", "b", "c", "a", "c", "c", "c", "a", "c"))
table(v)
(f <- factor(v))
table(f)

library(forcats)

fct_inorder(f)
fct_infreq(f)

fct_relevel(f, "c", "b", "a")
fct_relevel(f, "c")
fct_relevel(f, "c", after = 1)
fct_relevel(f, "a", after = Inf)

(y <- c(1, 3, 2, 4, 4, 5, 3, 3, 6, 7))

fct_reorder(v, y) # median
fct_reorder(v, y, .fun = mean) # mean
fct_reorder(v, y, .fun = mean, .desc=T)

fct_recode(v, z = "a", z = "c")

rm(list=ls())
