# Numeric

(x <- c(1:20, 6:15, 10, 11, 12))

summary(x)
table(x)

plot(x)
plot(density(x))

hist(x)
boxplot(x)

# Numeric + Numeric

(y <- x^2)

table(x, y)
table(cut(x, 4), cut(y, 4))

plot(x, y)
plot(y ~ x)

(df <- data.frame(x, y))
summary(df)
plot(df)

# Categorical

length(x)

(f <- sample(factor(c("a", "b", "c")),
             33,
             replace = T,
             set.seed(1234)))

summary(f)
table(f)

plot(f)
barplot(table(f))
pie(table(f))

# Categorical + Categorical

(g <- sample(factor(c("a", "b", "c")),
             33,
             replace = T,
             set.seed(4321)))

table(f, g)

margin.table(table(f, g), margin = 1)
margin.table(table(f, g), margin = 2)
margin.table(table(f, g))

addmargins(table(f, g), margin = 1)
addmargins(table(f, g), margin = 2)
addmargins(table(f, g))

prop.table(table(f, g), margin = 1)
addmargins(prop.table(table(f, g), margin = 1))
prop.table(table(f, g), margin = 2)
addmargins(prop.table(table(f, g), margin = 2))
prop.table(table(f, g))
addmargins(prop.table(table(f, g)))

xtabs(~ f + g)

plot(f, g)

# Numeric + Categorical

plot(f, y)
plot(y ~ f)

(df <- data.frame(df, f, g))

summary(df)

plot(df)
pairs(df, panel = panel.smooth)

# Time Series

plot(y)

(yt <- ts(y))

str(yt)

plot(yt)
plot.ts(y)

# Titles and Types

(x <- x[1:20])
(y <- y[1:20])

plot(x, y,
     main = "Main Title",
     sub = "Sub Title",
     xlab = "xxx",
     ylab = "yyy")

plot(x, y, type = "p")
plot(x, y, type = "l")
plot(x, y, type = "b")
plot(x, y, type = "o")
plot(x, y, type = "s")
plot(x, y, type = "h")

# Adding Points and Lines

plot(x, y, type = "l")

points(x, y)
points(x, y, col = "red")
points(x, y, col = "red", pch = 1, cex = 1)
points(x, y, col = "red", pch = 19, cex = 2)

plot(x, y, type = "l")

lines(x, y)
lines(x, y, col = "blue", lty = "dashed", lwd = 2)
lines(x, y, col = "red", lty = "dotted", lwd = 4)
lines(x, fitted(lm(y ~ x)))

abline(h = 200, col = "red", lwd = 3, lty = "dashed")
abline(v = 10, col = "blue", lwd = 3, lty = "dotted")
abline(v = mean(x), h = mean(y),
       col = "purple", lwd = 3, lty = "dotted")
abline(lm(y ~ x), col = "black")

plot(x, y, type = "n")
grid()
lines(x, y, col="blue")
points(x, y, pch=19, col="red")

# Axes and Boundaries

plot(x, y, las = 0)
plot(x, y, las = 1)
plot(x, y, las = 2)
plot(x, y, las = 3)

plot(x, y, bty = "o")
plot(x, y, bty = "l")

plot(x, y, xlim=c(0, 10), ylim=c(0, 100))

# Legend and Text

plot(x, y, type = "l", col = "red")
abline(h = 200, col = "blue")

legend("topleft",
       inset = .03,
       title = "y ~ x",
       legend = c("red", "blue"),
       lty = c("solid", "solid"),
       col = c("red", "blue"))

text(2, 20,
     font = 1, col = "red", cex = 1.0,
     labels = "text1")
text(5, 50,
     font = 3, col = "blue", cex = 1.2,
     labels = "text2")

text(x, y,
     font = 1, col = "darkgrey", cex = 1.0,
     labels = y)
text(x, y,
     font = 1, col = "black", cex = 1.0, pos = 1,
     labels = y)
text(x, y,
     font = 1, col = "yellow", cex = 1.0, pos = 2,
     labels = y)
text(x, y,
     font = 1, col = "skyblue", cex = 1.0, pos = 3,
     labels = y)
text(x, y,
     font = 1, col = "magenta", cex = 1.0, pos = 4,
     labels = y)

# Margins

help(par)

par("mai")

plot(x, y,
     main="Main Title",
     sub="Sub Title",
     xlab="xxx",
     ylab="yyy")

default_mai <- par("mai")
par("mai" = c(1, 2, 1, 2))

plot(x, y,
     main="Main Title",
     sub="Sub Title",
     xlab="xxx",
     ylab="yyy")

par("mai" = default_mai)

plot(x, y,
     main="Main Title",
     sub="Sub Title",
     xlab="xxx",
     ylab="yyy")

par("mar")

default_mar <- par("mar")
par("mar" = c(1, 1, 1, 1))

plot(x, y,
     main="Main Title",
     sub="Sub Title",
     xlab="xxx",
     ylab="yyy")

par("mar" = default_mar)

plot(x, y,
     main="Main Title",
     sub="Sub Title",
     xlab="xxx",
     ylab="yyy")

# Rows and Columns

par("mfrow")
par("mfrow" = c(2, 2))

plot(x)
plot(y)
plot(f)
plot(g)

par("mfrow" = c(1, 1))

par("mfcol")
par("mfcol" = c(2, 2))

plot(x)
plot(y)
plot(f)
plot(g)

par("mfcol"=c(1, 1))

rm(list=ls())
