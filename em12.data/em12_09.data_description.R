### Numeric Data

library(tidyverse)

df <- mtcars

str(df)
head(df)
summary(df)

## One Variable

# Summarize

summary(df$mpg)

df %>% summarise(n = n(),
                 na = sum(is.na(mpg)),
                 mean = mean(mpg, na.rm = T),
                 median = median(mpg, na.rm = T),
                 min = min(mpg, na.rm = T),
                 max = max(mpg, na.rm = T),
                 range = diff(range(mpg, na.rm = T)),
                 q1 = quantile(mpg, .25),
                 q3 = quantile(mpg, .75))

# Box Plot

gp <- ggplot(df, aes(x = "", y = mpg)) +
  geom_boxplot() +
  labs(x = "")
gp

gp + coord_flip()

ggplot_build(gp)
str(ggplot_build(gp)[[1]][[1]])
ggplot_build(gp)[[1]][[1]]$outliers[[1]]

# Histogram and Density Plot

gp <- ggplot(df, aes(x = mpg))
gp + geom_histogram()
gp + geom_histogram(bins = 10)
gp + geom_histogram(binwidth = 5)

gp + geom_density()
gp + geom_density(fill = "skyblue") +
  geom_rug() +
  xlim(0, 50)

gp <- ggplot(df, aes(x = mpg, y = stat(density))) +
  geom_histogram(fill = "skyblue", bins = 10) +
  geom_density(color = "red") +
  xlim(0, 50)
gp

gp <- ggplot(df, aes(x = mpg, y = stat(density))) +
  geom_density(color = "red") +
  geom_histogram(fill = "skyblue", alpha = .5, bins = 10) +
  xlim(0, 50)
gp

## By Factor

# Summarize

df %>% group_by(cyl) %>% 
  summarise(n = n(),
            na = sum(is.na(mpg)),
            mean = mean(mpg, na.rm = T),
            median = median(mpg, na.rm = T),
            min = min(mpg, na.rm = T),
            max = max(mpg, na.rm = T),
            range = diff(range(mpg, na.rm = T)),
            q1 = quantile(mpg, .25),
            q3 = quantile(mpg, .75))

# Box Plot

gp <- ggplot(df, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot() +
  scale_x_discrete(labels=c("four", "six", "eight"))
gp

# Histogram and Density

gp <- ggplot(df, aes(x = mpg)) +
  geom_histogram(bins = 10) +
  facet_wrap(~ cyl)
gp

gp <- ggplot(df, aes(x = mpg)) +
  geom_histogram(bins = 10) +
  facet_wrap(~ cyl, ncol = 1)
gp

gp <- ggplot(df, aes(x = mpg, fill = factor(cyl))) +
  geom_histogram(bins = 10, alpha = 0.5)
gp

gp <- ggplot(df, aes(x = mpg)) +
  geom_density() +
  xlim(0, 50) +
  facet_wrap(~ cyl)
gp

gp <- ggplot(df, aes(x = mpg)) +
  geom_density() +
  xlim(0, 50) +
  facet_wrap(~ cyl, ncol = 1)
gp

gp <- ggplot(df, aes(x = mpg, fill=factor(cyl))) +
  geom_density(alpha = 0.5) +
  xlim(0, 50)
gp

## Two Variables

# Correlation

attach(df)

cor(mpg, disp, use="everything", method=c("pearson"))
cor(mpg, disp, use="complete", method=c("pearson"))
cor(mpg, disp, use="everything", method=c("kendall"))
cor(mpg, disp, use="everything", method=c("spearman"))

cor(df[, 1:3], use="everything", method=c("pearson"))

detach(df)

# Scatter Plot

gp <- ggplot(df, aes(x = mpg, y = disp)) +
  geom_point(shape = 21,
             color = "red",
             fill = "red",
             size = 3)
gp

gp + geom_smooth()
gp + geom_smooth(se = F)

gp + geom_smooth(method = "lm")
gp + geom_smooth(method = "lm", se = F)

gp + geom_hline(aes(yintercept = mean(disp)),
                color = "red") +
  geom_vline(aes(xintercept = mean(mpg)),
             color = "blue") +
  geom_abline(aes(slope = -10, intercept = 500),
              color = "green")

gp <- ggplot(df,
             aes(x = mpg, y = disp, color = cyl, fill=gear)) +
  geom_point(shape = 21, size = 3)
gp

gp + geom_smooth()
gp + geom_smooth(se = F)

gp + geom_smooth(method = "lm")
gp + geom_smooth(method = "lm", se = F)

gp + geom_text(aes(label = hp),
               nudge_x = 1, nudge_y = 5)

gp + facet_wrap(~ cyl, ncol = 3, dir = "v")

## Many Variables: GGally

library(GGally)

ggcorr(df[1:3],
       method = c("pairwise", "pearson"),
       label = T,
       label_round = 2)

ggpairs(df[1:3],
        lower = list(continuous = "smooth"))

### Categorical Data

## One Variable

# Table

(tb <- with(df, table(cyl)))
(tb <- xtabs(~ cyl, df))

(prop.table(tb))

# Bar chart

plot(tb)
(tb <- as.data.frame(tb))
plot(tb)

gp <- ggplot(tb, aes(x = cyl, y = Freq)) +
  geom_col() +
  labs(x = "cyl", y="frequency")
gp

gp <- ggplot(df) +
  geom_bar(aes(x = cyl)) +
  labs(x = "cyl")
gp

gp <- ggplot(df) +
  geom_bar(aes(x = cyl,
               y = stat(prop),
               group = 1),
           fill = "skyblue") +
  labs(x="cyl", y="Proportion")
gp

gp + coord_flip()

## Two Variables

# Table

(tb <- with(df, table(cyl, gear)))
(tb <- xtabs(~ cyl + gear, data = df))

margin.table(tb, 1)
margin.table(tb, 2)
margin.table(tb)

apply(tb, 1, sum)
apply(tb, 2, sum)

(addmargins(tb))

prop.table(tb)

(addmargins(prop.table(tb)))

library(gmodels)

(with(df, CrossTable(cyl, gear)))

# Bar Chart

gp <- ggplot(as.data.frame(tb),
             aes(x = cyl, y = Freq, fill = gear)) +
  geom_col()
gp

gp <- ggplot(df, aes(x = cyl, fill = gear)) +
  geom_bar()
gp

df$gear <- factor(df$gear)
str(df)

gp <- ggplot(df, aes(x = cyl, fill = gear)) +
  geom_bar()
gp

gp <- ggplot(df, aes(x = cyl, fill = gear)) +
  geom_bar(position = "dodge")
gp

gp <- ggplot(df, aes(x = cyl, fill = gear)) +
  geom_bar(position = "dodge2")
gp

gp <- ggplot(df, aes(x = cyl, fill = gear)) +
  geom_bar(position = "fill")
gp

gp <- ggplot(df, aes(x = cyl, y=stat(prop), group=1)) +
  geom_bar() +
  facet_wrap(~ gear)
gp

rm(list=ls())
