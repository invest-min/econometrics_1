library(tidyverse)

# Simple and Polynomial

(df <- mtcars[, c(1, 8, 9, 2, 10, 3, 4, 6)])

with(df, plot(disp, mpg))

lm(df$mpg ~ df$disp)
lm(mpg ~ disp, df)

df %>%
  ggplot(aes(x = disp, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm")

df %>%
  ggplot(aes(x = disp, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) +
  geom_smooth(se = F, color = "red")

lm(mpg ~ disp + 0, df)
lm(mpg ~ disp - 1, df)

lm(log(mpg) ~ disp, df)

lm(mpg ~ disp + disp ^ 2, df)
lm(mpg ~ disp + I(disp ^ 2), df)
lm(mpg ~ poly(disp, 2, raw = T), df)

# Dummy Variable

plot(df$vs, df$mpg)
lm(mpg ~ vs, df)

plot(df$cyl, df$mpg)
lm(mpg ~ cyl, df)

str(df$cyl)
df$cyl <- factor(df$cyl)
str(df$cyl)

plot(df$cyl, df$mpg)
lm(mpg ~ cyl, df)

plot(df$gear, df$mpg)
lm(mpg ~ factor(gear), df)

# Multiple

lm(mpg ~ disp + cyl, df)

df %>%
  ggplot(aes(x = disp, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) +
  facet_wrap(~ cyl)

lm(mpg ~ disp + cyl + disp:cyl, df)
lm(mpg ~ disp * cyl, df)
lm(mpg ~ (disp + cyl) ^ 2, df)

lm(mpg ~ disp * hp * cyl, df)
lm(mpg ~ (disp + hp + cyl) ^ 3, df)
lm(mpg ~ (disp + hp + cyl) ^ 2, df)

lm(mpg ~ ., df)

# Result

ols1 <- lm(mpg ~ disp + hp, df)
ols2 <- lm(mpg ~ disp + hp + cyl, df)

summary(ols1)
summary(ols2)

anova(ols1)
anova(ols2)
anova(ols1, ols2)

summary(ols2)$r.squared
deviance(ols2)
logLik(ols2)
AIC(ols2)
BIC(ols2)

coef(ols2)
confint(ols2)

fitted(ols2)
resid(ols2)

library(broom)
tidy(ols2)
augment(ols2)
glance(ols2)

# Subset Selection

lm(mpg ~ disp, subset = 1:30, df)
lm(mpg ~ disp, df, subset = cyl == "4")

step(ols2, direction = "both")
step(ols2, direction = "forward")
step(ols2, direction = "backward")

library(leaps)

fit <- regsubsets(mpg ~ ., df)

summary(fit)
plot(fit)
plot(fit, scale = "adjr2")

fit <- regsubsets(mpg ~ ., df, nvmax = 5)

summary(fit)
plot(fit)
plot(fit, scale = "adjr2")

library(MASS)

fit_full <- lm(mpg ~ ., df)
fit_null <- lm(mpg ~ 1, df)

stepAIC(fit_null,
        scope = list(lower = fit_null, upper = fit_full),
        trace = F)

stepAIC(fit_full,
        scope = list(lower = fit_null, upper=fit_full),
        trace=F)

rm(list=ls())
