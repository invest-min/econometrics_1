library(tidyverse)

# Concept of Parametric Test

ggplot(data.frame(x = c(-3, 3)), aes(x)) +
  stat_function(fun = dnorm) +
  geom_vline(xintercept = qnorm(0.025), col = "red") +
  geom_vline(xintercept = qnorm(0.975), col = "red") +
  labs(title = "Standard Normal Distribution")

# confidence level / confidence interval
# significance level / significance probability (p-value)
# two-sided test / one-sided test

ggplot(data.frame(x = c(-3, 3)), aes(x)) +
  stat_function(fun = dnorm) +
  geom_vline(xintercept = qnorm(0.95), col = "red") +
  labs(title = "Standard Normal Distribution")

# Independence

mtcars
str(mtcars)
?mtcars

(df <- mtcars[, c(1, 8, 9, 2, 10, 3, 4, 6)])

(tb1 <- with(df, table(vs, am)))
(tb2 <- with(df, table(cyl, gear)))

chisq.test(df$vs, df$am)
chisq.test(df$vs, df$am, simulate.p.value = T)

chisq.test(df$cyl, df$gear)
chisq.test(df$cyl, df$gear, simulate.p.value = T)

chisq.test(tb2)
chisq.test(tb2, simulate.p.value = T)

fisher.test(tb2,
            conf.level = 0.95,
            alternative = c("two.sided"))
fisher.test(tb2,
            conf.level = 0.95,
            alternative = c("two.sided"),
            simulate.p.value = T)

library(vcd)

assocstats(tb1)
mosaic(tb1, shade = T)

assocstats(tb2)
mosaic(tb2, shade = T)

# Goodness of fit

apply(tb2, 1, sum)
apply(prop.table(tb2), 1, sum)

chisq.test(apply(tb2, 1, sum))
chisq.test(apply(tb2, 1, sum),
           c(0.3, 0.2, 0.4))
chisq.test(apply(tb2, 1, sum),
           c(0.3, 0.2, 0.4),
           simulate.p.value = T)

rm(list=ls())
