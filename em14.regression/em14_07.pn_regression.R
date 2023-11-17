library(tidyverse)
library(plm)
data("Grunfeld", package = "plm")
head(df <- Grunfeld)

pl <- lm(inv ~ value + capital, df)
summary(pl)

# One-way Fixed Effect

fe1 <- lm(inv ~ value + capital + factor(firm), df)
summary(fe1)

fe2 <- lm(inv ~ value + capital + factor(firm) - 1, df)
summary(fe2)

fe3 <- lm(inv ~ value + capital + factor(year), df)
summary(fe3)

fe4 <- plm(inv ~ value + capital,
           index = c("firm", "year"),
           model = "within",
           df)
summary(fe4)
fixef(fe4)
pFtest(fe4, pl)

fe5 <- plm(inv ~ value + capital,
           index = c("firm", "year"),
           model = "fd",
           df)
summary(fe5)
pFtest(fe5, pl)

fe <- fe4

# One-way Random Effect

re <- plm(inv ~ value + capital,
          index = c("firm", "year"),
          model = "random",
          df)
summary(re)

plp <- plm(inv ~ value + capital,
           index = c("firm", "year"),
           effect = "individual",
           model = "pooling",
           df)
plmtest(plp, effect = "individual", type = c("bp"))

phtest(fe, re)

# Two-way

fe6 <- lm(data = df,
          inv ~ value + capital + factor(firm) + factor(year))
summary(fe6)

fe7 <- plm(inv ~ value + capital,
           index = c("firm", "year"),
           effect = "twoways",
           model = "within",
           df)
summary(fe7)

fe8 <- plm(inv ~ value + capital,
           index = c("firm", "year"),
           effect = "twoways",
           model = "random",
           df)
summary(fe8)

rm(list = ls())
