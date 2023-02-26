library(tidyvers)

(df <- mtcars[, c(1, 8, 9, 2, 10, 3, 4, 6)])
ols <- lm(mpg ~ disp + hp + vs + cyl, df)
plot(ols, pch = 20)

# Outlier - deleting observations

library(car)

infIndexPlot(ols)
influencePlot(ols)
outlierTest(ols)
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

library(car)

boxCox(ols)
boxCox(ols, family = "yjPower") # (-) in response variable

boxCox(ols)$x # lambda
boxCox(ols)$y # log likelihood
as_tibble(boxCox(ols)) %>% slice_max(y, n = 1)
# ifelse(lambda == 0, log(mpg), mpg ^ lambda)

ln_ols <- lm(log(mpg) ~ disp + hp + vs + cyl, df)
shapiro.test(resid(ln_ols))

# Heteroskedasticity - WLS, GLS, Robust...

library(lmtest)

bptest(ols)

library(car)

ncvTest(ols)

f <- lm(abs(resid(ols)) ~ fitted(ols))
summary(f)
# or
f <- lm(resid(ols)^2 ~ fitted(ols))
summary(f)

w <- 1 / fitted(f1)^2

wls <- lm(mpg ~ disp + hp + vs + cyl, df, w = w)
summary(wls)

df2 <- df * sqrt(w)

wls2 <- lm(mpg ~ 0 + sqrt(w) + disp + hp + vs + cyl, dfw)
summary(wls2)

bptest(wls)
bptest(wls2)
ncvTest(wls)
ncvTest(wls2)

library(nlme)

gls <- gls(mpg ~ disp + hp, df, weights = varPower())
summary(gls)
bptest(wls)
ncvTest(wls)

library(MASS)

rls <- rlm(mpg ~ disp + hp, df)
summary(rls)
bptest(wls)
ncvTest(wls)

rm(list=ls())
