library(tidyverse)

# Bernoulli

sample(c("H", "T"), size = 1, replace = T)
sample(c("H", "T"), size = 1, replace = T, prob = c(0.2, 0.8))

a <- sample(c("H", "T"),
            size = 10,
            replace = T)
table(a)

b <- sample(c("H", "T"),
            size = 10,
            replace = T,
            prob = c(0.2, 0.8))
table(b)

# Binomial

dbinom(5, size = 10, prob = 0.5)
pbinom(5, size = 10, prob = 0.5)
qbinom(0.5, size = 10, prob = 0.5)
rbinom(10, size = 10, prob = 0.5)

sum(dbinom(0:5, size = 10, prob = 0.5))
pbinom(5, size = 10, prob = 0.5)
qbinom(0.623, size = 10, prob = 0.5)

x <- 0:10
y = dbinom(x, size = 10, prob = 0.5)
plot(x, y, pch = 19)

plot(x, y = dbinom(x, size = 10, prob = 0.5),
     pch = 19, col = "red")

df <- data.frame(x, y)

df %>% ggplot(aes(x, y)) +
  geom_col() +
  labs(title="Binomial Distribution")

tibble(x, y = dbinom(x, size = 10, prob = 0.5)) %>% 
  ggplot(aes(x, y)) +
  geom_col(fill = "blue") +
  labs(title = "Binomial Distribution")

tibble(x, y = dbinom(x, size = 10, prob = 0.3)) %>% 
  ggplot(aes(x, y)) +
  geom_col(fill = "blue") +
  labs(title = "Binomial Distribution")

tibble(x, y = dbinom(x, size = 10, prob = 0.1)) %>% 
  ggplot(aes(x, y)) +
  geom_col(fill = "blue") +
  labs(title = "Binomial Distribution")

tibble(x = 0:100, y = dbinom(x, size = 100, prob = 0.1)) %>% 
  ggplot(aes(x, y)) +
  geom_col(fill = "blue") +
  labs(title = "Binomial Distribution")

# Poisson: events to time, E(x) = lambda

n <- 10
p <- 0.5
(lambda <- n * p)

dpois(5, lambda = lambda)
ppois(5, lambda = lambda)
qpois(0.5, lambda = lambda)
rpois(10, lambda = lambda)

tibble(x = 0:n, y = dpois(x, lambda = lambda)) %>% 
  ggplot(aes(x, y)) +
  geom_col(fill = "blue") +
  labs(title = "Poisson Distribution")

tibble(x = 0:n, y = dpois(x, lambda = lambda / 5)) %>% 
  ggplot(aes(x, y)) +
  geom_col(fill = "blue") +
  labs(title = "Poisson Distribution")

n; p
dbinom(5, size = n, prob = p)
dpois(5, lambda = lambda)

n <- 100
p <- 0.01
(lambda <- n * p)

dbinom(5, size = n, prob = p)
dpois(5, lambda = lambda)

rm(list=ls())
