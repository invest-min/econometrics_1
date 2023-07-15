# Data

x <- 1:100
y <- sample(1:100,
            100,
            replace=T,
            set.seed(1234))
f <- sample(factor(c("a", "b", "c")),
            100,
            replace=T,
            set.seed(1234))
g <- sample(factor(c("a", "b", "c")),
            100,
            replace=T,
            set.seed(4321))

(df <- data.frame(x, y, f, g))

library(ggplot2)

# Scale

ggplot(df, aes(x = f, y = y, fill = g)) +
  geom_boxplot()

ggplot(df, aes(x = f, y = y, fill = g)) +
  geom_boxplot() +
  scale_x_discrete(breaks = c("a", "b", "c"),
                   labels = c("aa\naa",
                              "bb\nbb",
                              "cc\ncc")) +
  scale_y_continuous(breaks = c(0, 25, 50, 75, 100),
                     labels = c("0",
                                "25,000",
                                "50,000",
                                "75,000",
                                "100,000"))

ggplot(df, aes(x = f, y = y, fill = g)) +
  geom_boxplot() +
  scale_x_discrete(breaks = c("a", "b", "c"),
                   labels = c("aa\naa",
                              "bb\nbb",
                              "cc\ncc")) +
  scale_y_continuous(breaks = c(0, 25, 50, 75, 100),
                     labels = c("0",
                                "25,000",
                                "50,000",
                                "75,000",
                                "100,000")) +
  scale_fill_discrete(name = "group") +
  theme(legend.position = "left")

ggplot(df, aes(x = f, y = y, fill = g)) +
  geom_boxplot() +
  scale_x_discrete(breaks = c("a", "b", "c"),
                   labels = c("aa\naa",
                              "bb\nbb",
                              "cc\ncc")) +
  scale_y_continuous(breaks = c(0, 25, 50, 75, 100),
                     labels = c("0",
                                "25,000",
                                "50,000",
                                "75,000",
                                "100,000")) +
  scale_fill_discrete(name = "group") +
  theme(legend.position = "top")

ggplot(df, aes(x = f, y = y, fill = g)) +
  geom_boxplot() +
  scale_x_discrete(breaks = c("a", "b", "c"),
                   labels = c("aa\naa",
                              "bb\nbb",
                              "cc\ncc")) +
  scale_y_continuous(breaks = c(0, 25, 50, 75, 100),
                     labels = c("0",
                                "25,000",
                                "50,000",
                                "75,000",
                                "100,000")) +
  scale_fill_discrete(name = "group") +
  theme(legend.position = "bottom")

ggplot(df, aes(x = f, y = y, fill = g)) +
  geom_boxplot() +
  scale_x_discrete(breaks = c("a", "b", "c"),
                   labels = c("aa\naa",
                              "bb\nbb",
                              "cc\ncc")) +
  scale_y_continuous(breaks = c(0, 25, 50, 75, 100),
                     labels = c("0",
                                "25,000",
                                "50,000",
                                "75,000",
                                "100,000")) +
  scale_fill_discrete(name = "group") +
  theme(legend.position = c(.05, .85))

# Arrange

g1 <- ggplot(df, aes(x = x, y = y)) +
  geom_point()

g2 <- ggplot(df, aes(x = f, y = y)) +
  geom_boxplot()

g3 <- ggplot(df, aes(x = y, fill = g)) +
  geom_histogram()

g4 <- ggplot(df, aes(x = x, y = y)) +
  geom_line()

library(gridExtra)

grid.arrange(g1, g2, g3, g4, nrow = 2)

# Patchwork

library(patchwork)

g1 + g2
g3 / g4
(g1 + g2) / (g3 + g4)


rm(list=ls())
