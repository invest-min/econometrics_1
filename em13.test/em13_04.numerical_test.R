library(tidyverse)

# Mean: One Sample

(df <- mtcars[, c(1, 8, 9, 2, 10, 3, 4, 6)])

summary(df$mpg)

t.test(df$mpg,
       mu = 20,
       conf.level = 0.95,
       alternative = c("two.sided"))

t.test(df$mpg,
       mu = 15,
       conf.level = 0.95,
       alternative = c("two.sided"))

t.test(df$mpg,
       mu = 15,
       conf.level = 0.95,
       alternative = c("less"))

t.test(df$mpg,
       mu = 15,
       conf.level = 0.95,
       alternative = c("greater"))

# Mean: Two Samples

t.test(df$mpg ~ df$vs,
       var.equal = T,
       conf.level = 0.95,
       alternative=c("two.sided"))

var.test(df$mpg ~ df$vs,
         ratio = 1,
         conf.level = 0.95,
         alternative = c("two.sided"))

t.test(df$disp ~ df$vs,
       var.equal = F,
       conf.level = 0.95,
       alternative = c("two.sided"))

(mpg1 <- df$mpg[df$vs == 0])
(mpg2 <- df$mpg[df$vs == 1])

t.test(mpg1, mpg2,
       var.equal = T,
       conf.level = 0.95,
       alternative = c("two.sided"))

var.test(mpg1, mpg2,
         ratio = 1,
         conf.level = 0.95,
         alternative = c("two.sided"))

t.test(mpg1, mpg2,
       var.equal = F,
       conf.level = 0.95,
       alternative=c("two.sided"))

# Mean: Paired Samples

df$hp2 <- df$hp * 1.2
(y <- c(df$hp, df$hp2))
(x <- factor(rep(c(1, 2), c(32, 32))))

t.test(y ~ x,
       paired = T,
       conf.level = 0.95,
       alternative = c("two.sided"))

t.test(df$hp, df$hp2,
       paired = T,
       conf.le3el = 0.95,
       alternative = c("two.sided"))

var.test(df$hp, df$hp2,
         ratio = 1,
         conf.level = 0.95,
         alternative = c("two.sided"))

# Proportion: One Sample

prop.test(x = 16,
          n = 50,
          p = 0.3,
          conf.level = 0.95,
          alternative = c("two.sided"))

binom.test(x = 16,
           n = 50,
           p = 0.3,
           conf.level = 0.95,
           alternative = c("two.sided"))

# Proportion: Two Samples

prop.test(x = c(16, 19),
          n = c(50, 50),
          conf.level = 0.95,
          alternative=c("two.sided"))

# Variance: Two Samples

var.test(df$hp, df$hp2)

# Correlation

cor(data.frame(df$mpg, df$disp, df$wt))

cor.test(df$mpg, df$disp)
cor.test(~ df$mpg + df$disp)

library(psych)

corr.test(data.frame(df$mpg, df$disp, df$wt))
print(corr.test(data.frame(df$mpg, df$disp, df$wt)),
      short = F)
pairs.panels(data.frame(df$mpg, df$disp, df$wt))

library(corrgram)

corrgram(data.frame(df$mpg, df$disp, df$wt))

library(GGally)

ggcorr(data.frame(df$mpg, df$disp, df$wt),
       label = T,
       label_round = 2)

ggpairs(data.frame(df$mpg, df$disp, df$wt))

rm(list=ls())
