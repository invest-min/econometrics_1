library(tidyverse)

(df <- mtcars[, c(1, 8, 9, 2, 10, 3, 4, 6)])
ols <- lm(mpg ~ disp + hp, df)

# Interval

summary(df$disp)
summary(df$hp)

x <- data.frame(disp = 200:300, hp = 100:200)

(n <- predict(ols, x, interval = c("none"), level = 0.95))
(c <- predict(ols, x, interval = c("confidence"), level = 0.95))
(p <- predict(ols, x, interval = c("prediction"), level = 0.95))

plot(c[, "fit"], type = "l", xlim=c(0, 101), ylim=c(15, 25))
lines(c[, "lwr"], type = "l", col = "blue")
lines(c[, "upr"], type = "l", col = "blue")

plot(p[, "fit"], type = "l", xlim=c(0, 101), ylim=c(10, 30))
lines(p[, "lwr"], type = "l", col = "blue")
lines(p[, "upr"], type = "l", col = "blue")

# Performance

library(caret)

set.seed(1)
dp <- createDataPartition(df$mpg, p = 0.5, list = F)
train <- df %>% slice(dp)
test <- df %>% slice(-dp)

fit <- lm(mpg ~ disp + hp, train)
pred <- predict(fit, test)

defaultSummary(data.frame(obs = test$mpg, pred = pred))

data.frame(obs = test$mpg, pred = pred) %>%
  ggplot(aes(x = obs, y = pred)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1)

rm(list=ls())
