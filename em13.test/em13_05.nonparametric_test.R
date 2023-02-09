library(tidyverse)

# One Sample

(df <- mtcars[, c(1, 8, 9, 2, 10, 3, 4, 6)])

wilcox.test(df$mpg,
            mu = 15,
            conf.level = 0.95,
            conf.int = T,
            alternative=c("two.sided"))

# Two Samples

wilcox.test(df$mpg ~ df$vs,
            mu = 0,
            conf.level = 0.95,
            conf.int = T,
            alternative = c("two.sided"))

(mpg1 <- df$mpg[df$vs == 0])
(mpg2 <- df$mpg[df$vs == 1])

wilcox.test(mpg1, mpg2,
            mu = 0,
            conf.level = 0.95,
            conf.int = T,
            alternative = c("two.sided"))

ks.test(mpg1, mpg2)

# Normality

ggplot(df, aes(x = mpg)) +
  geom_histogram(bins = 10)

shapiro.test(df$mpg)

ggplot(df, aes(sample = mpg)) +
  geom_qq() +
  geom_qq_line()

df$ln_mpg <- log(df$mpg)

ggplot(df, aes(x = ln_mpg)) +
  geom_histogram(bins = 10)

shapiro.test(df$ln_mpg)

ggplot(df, aes(sample = ln_mpg)) +
  geom_qq() +
  geom_qq_line()

rm(list=ls())
