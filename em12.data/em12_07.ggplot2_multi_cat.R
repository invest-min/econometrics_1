# Data

y <- sample(1:100, 100, replace=T, set.seed(1234))
f <- sample(factor(c("a", "b", "c")),
            100,
            replace=T,
            set.seed(1234))
g <- sample(factor(c("a", "b", "c")),
            100,
            replace=T,
            set.seed(4321))

(df <- data.frame(y, f, g))

library(ggplot2)

# Category_Category

ggplot(df, aes(x = f)) +
  geom_bar() +
  labs(x = "fff")

ggplot(df, aes(x = f, fill = g)) +
  geom_bar() +
  labs(x = "fff")

ggplot(df, aes(x = f, fill = g)) +
  geom_bar(position = "stack") +
  labs(x = "fff")

ggplot(df, aes(x = f, fill = g)) +
  geom_bar(position = "dodge") +
  labs(x = "fff")

ggplot(df, aes(x = f, fill = g)) +
  geom_bar(position = "dodge2") +
  labs(x = "fff")

ggplot(df, aes(x = f, fill = g)) +
  geom_bar(position = "fill") +
  labs(x="fff")

ggplot(df, aes(x = f, fill = g)) +
  geom_bar(position = "fill") +
  labs(x = "fff", y = "proportion")
  
# Numeric_Category

ggplot(df, aes(x = f, y = y)) +
  geom_boxplot()

ggplot(df, aes(x = f, y = y)) +
  geom_boxplot(fill = "salmon",
               color = "dimgrey",
               notch = T)

ggplot(df, aes(x = f, y = y)) +
  geom_boxplot() +
  geom_point(size = 3)

ggplot(df, aes(x = f, y = y)) +
  geom_boxplot() +
  geom_point(size = 3, position = "jitter")

ggplot(df, aes(x = f, y = y)) +
  geom_boxplot() +
  geom_point(size = 3, alpha = .5, position = "jitter")

ggplot(df, aes(x = f, y = y)) +
  geom_boxplot() +
  geom_point(size = 3, alpha = .5, position = "jitter") +
  geom_rug()

# Facet

ggplot(df, aes(y = y)) +
  geom_boxplot() +
  geom_rug() +
  facet_wrap(~ f)

ggplot(df, aes(y = y)) +
  geom_boxplot() +
  geom_rug() +
  facet_wrap(~ f, nrow = 3)

ggplot(df, aes(x = y)) +
  geom_density() +
  geom_rug() +
  facet_grid(f ~ .)

ggplot(df, aes(x = y)) +
  geom_density() +
  geom_rug() +
  facet_grid(. ~ f)

ggplot(df, aes(x = y)) +
  geom_density() +
  geom_rug() +
  facet_grid(f ~ g)

ggplot(df, aes(x = y)) +
  geom_density() +
  geom_rug() +
  facet_grid(g ~ f)

rm(list=ls())
