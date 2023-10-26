library(tidyverse)

(df <- mtcars[, c(1, 8, 9, 2, 10, 3, 4, 6)])
ols <- lm(mpg ~ disp + hp + vs + cyl, df)
plot(ols, pch = 20)

# Outlier - deleting observations

library(car)

infIndexPlot(ols)
influencePlot(ols)
avPlots(ols)

# Linearity - polynomial...

library(car)

crPlots(ols)

# Multicollinearity - deleting variables

vif(ols)

# Normality - Box-Cox transformation

shapiro.test(resid(ols))

qqnorm(resid(ols))
qqline(resid(ols))

ln_ols <- lm(log(mpg) ~ disp + hp + vs + cyl, df)
shapiro.test(resid(ln_ols))

# Heteroskedasticity - WLS, GLS, Robust...

library(lmtest)

bptest(ols)

f <- lm(abs(resid(ols)) ~ fitted(ols))
summary(f)
# or
f <- lm(resid(ols)^2 ~ fitted(ols))
summary(f)

w <- 1 / fitted(f)^2

wls <- lm(mpg ~ disp + hp + vs + cyl, df, w = w)
summary(wls)

dfw <- df * sqrt(w)

wls2 <- lm(mpg ~ 0 + sqrt(w) + disp + hp + vs + cyl, dfw)
summary(wls2)

bptest(wls)
bptest(wls2)

library(MASS)

rls <- rlm(mpg ~ disp + hp, df)
summary(rls)

rm(list=ls())
