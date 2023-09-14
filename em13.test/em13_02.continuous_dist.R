library(tidyverse)

# Normal

dnorm(0, mean = 0, sd = 1)
pnorm(0, mean = 0, sd = 1)
qnorm(0.5, mean = 0, sd = 1)
rnorm(10, mean = 0, sd = 1)

dnorm(0, mean = 10, sd = 5)
pnorm(0, mean = 10, sd = 5)
qnorm(0.5, mean = 10, sd = 5)
rnorm(10, mean = 10, sd = 5)

integrate(dnorm, -Inf, 1.65)
pnorm(1.65)
qnorm(0.95)

integrate(dnorm, -Inf, 1.96)
pnorm(1.96)
qnorm(0.975)

ggplot(data.frame(x = c(-3, 3)), aes(x)) +
  stat_function(fun = dnorm) +
  labs(title = "Standard Normal Distribution")

ggplot(data.frame(x = c(-3, 3)), aes(x)) +
  stat_function(fun = dnorm, args = list(mean = 1, sd = 0.5)) +
  labs(title = expression(list(mu == 1, sigma == .5)))

ggplot(data.frame(x = c(-3, 3)), aes(x)) +
  stat_function(fun = pnorm) +
  labs(title = "Cumulative Standard Normal Distribution")

ggplot(data.frame(x = rnorm(1000))) +
  geom_histogram(aes(x = x, y = stat(density)), bins = 20) +
  stat_function(fun = dnorm, color = "red", size = 1)

# Cauchy

dcauchy(0, location = 0, scale = 1)
pcauchy(0, location = 0, scale = 1)
qcauchy(0.5, location = 0, scale = 1)
rcauchy(10, location = 0, scale = 1)

ggplot(data.frame(x = c(-7, 7)), aes(x)) +
  stat_function(aes(color = "N(0, 1)"),
                fun = dnorm,
                size = 1.2) +
  stat_function(aes(color = "cauchy(0, 1)"),
                fun = dcauchy,
                size = 1.2)

# t

dt(0, df = 10)
pt(0, df = 10)
qt(0.5, df = 10)
rt(10, df = 10)

ggplot(data.frame(x = c(-7, 7)), aes(x)) +
  stat_function(aes(color = "t(1)"),
                fun = dt,
                args = list(df = 1), size = 1.2) +
  stat_function(aes(color = "t(2)"),
                fun = dt,
                args = list(df = 2), size = 1.2) +
  stat_function(aes(color = "t(Inf)"),
                fun = dt,
                args = list(df = Inf), size = 1.2)

ggplot(data.frame(x = c(-7, 7)), aes(x)) +
  stat_function(aes(color = "t(1)"),
                fun = dt,
                args = list(df = 1), size = 1.2) +
  stat_function(aes(color = "t(2)"),
                fun = dt,
                args = list(df = 2), size = 1.2) +
  stat_function(aes(color = "t(Inf)"),
                fun = dt,
                args = list(df = Inf), size = 1.2) +
  stat_function(aes(color = "N(0, 1)"),
                fun = dnorm,
                linetype = "dashed",
                size = 1.2) +
  stat_function(aes(color = "cauchy(0, 1)"),
                fun = dcauchy,
                linetype = "dashed",
                size = 1.2)

# Exponential: time to event, E(x) = 1 / lambda

dexp(1, rate = 1)
pexp(1, rate = 1)
qexp(0.632, rate = 1)
rexp(10, rate = 1)

ggplot(data.frame(x = c(0, 4)), aes(x)) +
  stat_function(aes(color = "rate = 1"),
                fun = dexp,
                size = 1.2) +
  stat_function(aes(color = "rate = 2"),
                fun = dexp,
                args = list(rate = 2),
                size = 1.2) +
  stat_function(aes(color = "rate = 3"),
                fun = dexp,
                args = list(rate = 3),
                size = 1.2) +
  labs(title = "Exponential Distribution", color = "")

# F

df(1, df1 = 1, df2 = 1)
pf(1, df1 = 1, df2 = 1)
qf(0.5, df1 = 1, df2 = 1)
rf(10, df1 = 1, df2 = 1)

df1 <- function(x) df(x, df1 = 1, df2 = 1)
df3 <- function(x) df(x, df1 = 3, df2 = 1)
df5 <- function(x) df(x, df1 = 5, df2 = 1)

ggplot(data.frame(x = c(0, 5)), aes(x)) +
  stat_function(aes(color = "df = 1, 1"),
                fun = df1) +
  stat_function(aes(color = "df = 3, 1"),
                fun = df3) +
  stat_function(aes(color = "df = 5, 1"),
                fun = df5) +
  labs(title = "F Distribution", color = "")

# Chi-Squared

dchisq(1, df = 1)
pchisq(1, df = 1)
qchisq(.683, df = 1)
rchisq(10, df = 1)

dchisq1 <- function(x) dchisq(x, df = 1)
dchisq2 <- function(x) dchisq(x, df = 2)
dchisq3 <- function(x) dchisq(x, df = 3)

ggplot(data.frame(x = c(0, 7)), aes(x)) +
  stat_function(aes(color = "df = 1"),
                fun = dchisq1) +
  stat_function(aes(color = "df = 2"),
                fun = dchisq2) +
  stat_function(aes(color = "df = 5"),
                fun = dchisq3) +
  labs(title = "Chi-Squared Distribution")

rm(list=ls())
