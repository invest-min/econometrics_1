# Data

x <- 1:20
y <- c(1,3,2,2,5,4,3,6,5,5,7,6,7,9,6,8,9,11,14,10)
f <- sample(factor(c("a", "b", "c")),
            20,
            replace = T,
            set.seed(1234))
g <- sample(factor(c("a", "b", "c")),
            20,
            replace = T,
            set.seed(4321))

(df <- data.frame(x, y, f, g))

library(ggplot2)

# Point

ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(df, aes(x = x, y = y)) +
  geom_point(shape = 19, color = "black", size = 1.5) +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

?points

ggplot(df, aes(x = x, y = y)) +
  geom_point(shape = 21, color = "blue", size = 3) +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(df, aes(x = x, y = y, shape = f, color = g)) +
  geom_point() +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(df, aes(x = x, y = y)) +
  geom_point(aes(shape = f, color = g)) +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

# Line

ggplot(df, aes(x = x, y = y)) +
  geom_line() +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(df, aes(x = x, y = y)) +
  geom_line(linetype = "solid", color = "black", size = .5) +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

?lines

ggplot(df, aes(x = x, y = y)) +
  geom_line(linetype = "dashed", color = "blue", size = 1) +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(df, aes(x = x, y = y)) +
  geom_line(linetype = "dotted", color = "red", size = 2) +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

# Smooth

ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  geom_line() +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  geom_smooth() +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

# Text

ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  geom_smooth() +
  geom_text(label = f) +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  geom_smooth() +
  geom_text(label = f,
            hjust = 0,
            vjust = 0) +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  geom_smooth() +
  geom_text(label = f,
            hjust = 0,
            vjust = 0,
            nudge_x = .1,
            nudge_y = .1) +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  geom_smooth() +
  geom_text(label = f,
            hjust = 0,
            vjust = 0,
            nudge_x = .1,
            nudge_y = .1,
            size = 5) +
  labs(x = "xxx",
       y = "yyy",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

rm(list=ls())
