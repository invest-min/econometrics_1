# Data

y <- sort(sample(1:100,
                 100,
                 replace=T,
                 set.seed(1234)))
f <- sample(factor(c("a", "b", "c")),
            100,
            replace=T,
            set.seed(1234))

(df <- data.frame(y, f))

library(ggplot2)

# Numeric

ggplot(df, aes(x = y)) +
  geom_histogram()

ggplot(df, aes(x = y)) +
  geom_histogram(bins = 10)

ggplot(df, aes(x = y)) +
  geom_histogram(bins = 10,
                 fill = "skyblue",
                 color = "darkgrey",
                 size=1)

ggplot(df, aes(x = y)) +
  geom_histogram(bins = 10,
                 fill = "skyblue",
                 color = "darkgrey",
                 size=1) +
  labs(x = "YYY",
       y = "Frequency",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(df, aes(x = y)) +
  geom_density()

ggplot(df, aes(x = y)) +
  geom_density(fill = "skyblue",
               color = "darkgrey",
               size = 1) +
  labs(x = "YYY",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(df, aes(x = y)) +
  geom_boxplot()

ggplot(df, aes(y = y)) +
  geom_boxplot()

ggplot(df, aes(y = y)) +
  geom_boxplot(fill = "skyblue",
               color = "darkgrey",
               size = 1) +
  labs(y = "YYY",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(df, aes(y = y)) +
  geom_boxplot(fill = "skyblue",
               color = "darkgrey",
               size = 1,
               notch = T) +
  labs(y = "YYY",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

# Categorical

ggplot(df, aes(x = f)) +
  geom_bar()

ggplot(df, aes(x = f)) +
  geom_bar(fill = "skyblue",
           color = "darkgrey",
           size = 1) +
  labs(x = "fff",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(df, aes(x = f)) +
  geom_bar(stat = "count",
           fill = "skyblue",
           color = "darkgrey",
           size=1) +
  labs(x = "fff",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

(tb <- as.data.frame(table(df$f)))

ggplot(tb, aes(x = Var1, y = Freq)) +
  geom_bar(fill = "skyblue",
           color = "darkgrey",
           size = 1) +
  labs(x = "fff",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(tb, aes(x = Var1, y = Freq)) +
  geom_col(fill = "skyblue",
           color = "darkgrey",
           size = 1) +
  labs(x = "fff",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

ggplot(tb, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity",
           fill = "skyblue",
           color = "darkgrey",
           size = 1) +
  labs(x = "fff",
       title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

rm(list=ls())
