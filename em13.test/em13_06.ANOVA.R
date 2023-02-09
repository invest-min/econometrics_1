library(tidyverse)

## One-way

# Estimation

(df <- mtcars[, c(1, 8, 9, 2, 10, 3, 4, 6)])
df$cyl <- factor(df$cyl)
str(df)

(aov <- aov(mpg ~ cyl, df))

summary(aov)
summary.lm(aov)

model.tables(aov, type = "mean")
model.tables(aov, type = "effects")

TukeyHSD(aov)
plot(TukeyHSD(aov))

# Post hoc Analysis

plot(aov)

shapiro.test(df$mpg)

bartlett.test(mpg ~ cyl, df)
fligner.test(mpg ~ cyl, df)

oneway.test(mpg ~ cyl, df)

## Two-way

# Estimation

df$gear <- factor(df$gear)

aov1 <- aov(mpg ~ cyl + gear, df)
summary(aov1)
summary.lm(aov1)

model.tables(aov1, type = "mean")
model.tables(aov1, type = "effects")

TukeyHSD(aov1)
plot(TukeyHSD(aov1))

aov2 <- aov(mpg ~ cyl * gear, df)
summary(aov2)
summary.lm(aov2)

model.tables(aov2, type = "mean")
model.tables(aov2, type = "effects")

TukeyHSD(aov2)
plot(TukeyHSD(aov2))

anova(aov1, aov2)

# Post hoc Analysis

plot(aov2)

shapiro.test(df$mpg)

bartlett.test(mpg ~ cyl, df)
fligner.test(mpg ~ cyl, df)

bartlett.test(mpg ~ gear, df)
fligner.test(mpg ~ gear, df)

## ANCOVA

aov3 <- aov(mpg ~ cyl + gear + disp, df)
summary(aov3)
summary.lm(aov3)

ols3 <- lm(mpg ~ cyl + gear + disp, df)
anova(ols3)
summary(ols3)

## MANOVA

y <- cbind(df$mpg, df$hp)

aov4 <- manova(y ~ cyl + gear + disp, df)
summary(aov4)
summary.lm(aov4)

rm(list=ls())
