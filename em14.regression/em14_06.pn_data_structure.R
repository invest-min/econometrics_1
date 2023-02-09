library(tidyverse)
library(plm)

# Balance of Data

data("Grunfeld", package = "plm")
str(Grunfeld)
head(Grunfeld)
is.pbalanced(Grunfeld)
Grunfeld %>%
  select(year, firm) %>%
  table()

data("EmplUK", package = "plm")
str(EmplUK)
head(EmplUK)
is.pbalanced(EmplUK)
EmplUK %>%
  select(year, firm) %>%
  filter(firm %in% c(1:10)) %>% 
  table()

E1 <- make.pbalanced(EmplUK,
                     balance.type = "fill")
head(E1)

E2 <- make.pbalanced(EmplUK,
                     balance.type = "shared.times")
head(E2)

E3 <- make.pbalanced(EmplUK,
                     balance.type = "shared.individuals")
head(E3)

# Graph of Data

head(df <- Grunfeld)

ggplot(df, aes(x = year, y = inv)) +
  geom_line() +
  labs(x = "Year",  y = "Gross Investment") +
  theme(legend.position = "none")

ggplot(df, aes(x = year, y = inv)) +
  geom_line(aes(colour = as.factor(firm))) +
  geom_smooth(method = "lm", se = F, lty = "dashed") +
  labs(x = "Year",  y = "Gross Investment") +
  theme(legend.position = "none")

df %>%
  group_by(firm) %>%
  summarise(inv_mean = mean(inv)) %>%
  left_join(df) %>%
  ggplot(., 
         aes(x = reorder(as.character(firm), firm), y = inv)) +
  geom_point() +
  geom_line(aes(x = firm, y = inv_mean), col = "blue") +
  labs(x = "Firm", y = "Gross Investment")

df %>%
  group_by(year) %>%
  summarise(inv_mean = mean(inv)) %>%
  left_join(df) %>%
  ggplot(., 
         aes(x = year, y = inv)) +
  geom_point() +
  geom_line(aes(x = year, y = inv_mean), col = "blue") +
  scale_x_continuous(labels = as.character(df$year), 
                     breaks = df$year) +
  labs(x = "Year", y = "Gross Investment") +
  theme(axis.text.x = element_text(angle = 90))

# Pooled OLS

pl <- lm(inv ~ value + capital, df)
summary(pl)
plot(pl)

Box.test(pl$resid)
library(car)
durbinWatsonTest(pl, max.lag = 2)
library(lmtest)
bptest(pl)

bgtest(pl)

shapiro.test(pl$residuals)

library(forecast)
checkresiduals(pl)

rm(list = ls())
