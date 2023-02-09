# Numeric

2 + 3
2 - 3
2 * 3
2 / 3

7 / 3
7 %/% 3
7 %% 3

2 + 3 * 3
(2 + 3) * 3
2 - 3 / 3
(2 - 3) / 3

-3 ^ 2
(-3) ^ 2
3 ^ (-2)
3 ^ (1 / 2)
sqrt(3)

exp(1)
log(2.72)
log10(10)
log2(2)
log(9, 3)

pi
sin(pi/2)
cos(pi)
tan(pi/4)

factorial(3)
choose(3, 2)

abs(-3)

ceiling(pi)
ceiling(-pi)
floor(pi)
floor(-pi)
round(pi, 2)
signif(pi, 2)

# Logical

-3.14 == 3.14
-3.14 != 3.14
-3.14 >= 3.14
-3.14 <= 3.14

-3.14 == 3.14 & 3.14 == 3.14
-3.14 == 3.14 | 3.14 == 3.14

(-3.14 == 3.14) + (-3.14 != 3.14)
(-3.14 == 3.14) * (-3.14 != 3.14)
(-3.14 == 3.14 | 3.14 == 3.14) * 3

1:6 > 3
sum(1:6 > 3)
mean(1:6 > 3)
any(1:6 > 3)
all(1:6 > 3)

sqrt(2)^2
sqrt(2)^2 == 2
identical(sqrt(2)^2, 2)
all.equal(sqrt(2)^2, 2)

# Vector

1:3 + 1:3
1:3 - 1:3
1:3 * 1:3
1:3 / 1:3

1:3 + 10
1:3 + 1:5

length(1:10)
nchar(1:10)

sum(1:10)
mean(1:10)
median(1:10)
prod(1:10)

min(1:10)
max(1:10)
range(1:10)
diff(range(1:10))

diff(1:10)
diff(1:10, 2)
diff(1:10, 3)

library(dplyr)
lag(1:10)
lag(1:10, 2)
lead(1:10)
lead(1:10, 2)

quantile(1:10, 0.25)
quantile(1:10, 0.75)
IQR(1:10)

summary(1:10)

cumsum(1:10)
cumprod(1:10)
cummin(1:10)
cummax(1:10)

var(1:10)
sd(1:10)
cor(1:10, 10:1)

v <- c(1, 2, 3, 4, NA)
sum(v)
sum(v, na.rm=T)
sum(na.omit(v))

sum(c(T, F, T))
mean(c(T, F, T))
table(c(T, F, T))

# Matrix and Array

(m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2))

rowSums(m)
colSums(m)
rowMeans(m)
colMeans(m)

matrix(1:6, 2) + matrix(1:6, 2)
matrix(1:6, 2) - matrix(1:6, 2)
matrix(1:6, 2) * matrix(1:6, 2)
matrix(1:6, 2) / matrix(1:6, 2)

matrix(1:6, 2) + 10
matrix(1:6, 2) + matrix(1:6, 3)

matrix(1:6, 2) %*% matrix(1:6, 3)

solve(matrix(1:4, 2))
solve(matrix(1:4, 2), c(5, 6))

t(matrix(1:6, 2))

diag(matrix(1:4, 2))
diag(c(1, 4))
diag(2)

eigen(matrix(1:4, 2))

array(1:12, c(2, 3, 2)) + array(1:12, c(2, 3, 2))
array(1:12, c(2, 3, 2)) - array(1:12, c(2, 3, 2))
array(1:12, c(2, 3, 2)) * array(1:12, c(2, 3, 2))
array(1:12, c(2, 3, 2)) / array(1:12, c(2, 3, 2))

array(1:12, c(2, 3, 2)) + 10

# Dataframe

(d <- as.data.frame(m))

colMeans(d)
colSums(d)
rowMeans(d)
rowSums(d)

df1 <- data.frame(x=c(1, 2, 3), y=c(4, 5, 6))
df2 <- data.frame(v=c(4, 5, 6), w=c(1, 2, 3))

df1 + df2
df1 - df2
df1 * df2
df1 / df2

df1 <- data.frame(x=c(1, 2, 3), y=c("a", "b", "c"))
df2 <- data.frame(v=c(4, 5, 6), w=c("d", "e", "f"))

df1 + df2

# Inf, NaN, NA

3/0

Inf + Inf
Inf * Inf
Inf * (-Inf)
Inf + 1

is.infinite(3/0)

Inf - Inf
Inf / Inf
log(-1)

NaN + NaN
NaN - NaN
NaN * NaN
NaN / NaN
NaN + 1

is.nan(log(-1))

NA + NA
NA - NA
NA * NA
NA / NA
NA + 1

NA + 1 == NA
is.na(NA + 1)

is.na(c(1, 2, 3, 4, NA))
sum(is.na(c(1, 2, 3, 4, NA)))
mean(is.na(c(1, 2, 3, 4, NA)))
table(is.na(c(1, 2, 3, 4, NA)))

na.omit(c(1, 2, 3, 4, NA))
na.omit(data.frame(x=c(1, 2, 3, 4, NA), y=c(NA, 4, 3, 2, 1)))

rm(list=ls())
