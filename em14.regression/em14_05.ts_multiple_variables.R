# Estimation

(air <- na.omit(airquality))
str(air)

t <- 1:111
air <- cbind(air, t)

(air <- ts(air))
plot(air)
plot.ts(air[, 1:4], plot.type = "single")

library(tseries)

adf.test(air[, "Ozone"])
pp.test(air[, "Ozone"])

adf.test(air[, "Solar.R"])
pp.test(air[, "Solar.R"])

adf.test(air[, "Wind"])
pp.test(air[, "Wind"])

adf.test(air[, "Temp"])
pp.test(air[, "Temp"])

fit1 <- lm(Ozone ~ Temp, air)
summary(fit1)

adf.test(diff(air[, "Ozone"]))
pp.test(diff(air[, "Ozone"]))

adf.test(diff(air[, "Temp"]))
pp.test(diff(air[, "Temp"]))

fit2 <- lm(diff(Ozone) ~ diff(Temp), air)
summary(fit2)

fit3 <- lm(Wind ~ Solar.R, air)
summary(fit3)

fit4 <- lm(Ozone ~ Solar.R + Wind + Temp, air)
summary(fit4)

fit5 <- lm(diff(Ozone) ~
             Solar.R[-1] + Wind[-1] + diff(Temp),
           air)
summary(fit5)

# Post-hoc Test

library(car)
durbinWatsonTest(fit5, max.lag = 2)
dwt(fit5, max.lag = 2)

Box.test(fit5$resid)

library(lmtest)
bgtest(fit5)

shapiro.test(fit5$residuals)

library(forecast)
checkresiduals(fit5)

(Ozone_d <- diff(air[, "Ozone"]))
(Temp_d <- diff(air[, "Temp"]))
(Solar.R <- air[, "Solar.R"][-1])
(Wind <- air[, "Wind"][-1])
(t <- air[, "t"][-1])
(air_df <- data.frame(Ozone_d, Solar.R, Wind, Temp_d, t))

library(prais)
pw <- prais_winsten(Ozone_d ~ Solar.R + Wind + Temp_d,
                    air_df,
                    index = "t")
summary(pw)
checkresiduals(pw)

library(orcutt)
co <- cochrane.orcutt(fit5)
summary(co)
checkresiduals(co)

# Cointegration and Error Correction Model

stock <- EuStockMarkets
plot(stock)
plot.ts(stock, plot.type = "single")

adf.test(stock[, "DAX"])
adf.test(diff(stock[, "DAX"]))

adf.test(stock[, "CAC"])
adf.test(diff(stock[, "CAC"]))

adf.test(stock[, "SMI"])
adf.test(diff(stock[, "SMI"]))

adf.test(stock[, "FTSE"])
adf.test(diff(stock[, "FTSE"]))

fit1 <- lm(DAX ~ CAC + SMI + FTSE, stock)
summary(fit1)

adf.test(resid(fit1))

library(aTSA)
coint.test(stock[, 1], stock[, 2:4])
fit2 <- ecm(stock[, 1], stock[, 2:4])

fit3 <- lm(diff(DAX) ~
             diff(SMI) + diff(CAC) + diff(FTSE) +
             lag(resid(fit1))[-length(resid(fit1))],
           stock)
summary(fit3)

library(ecm)
(xeq <- xtr <- as.data.frame(stock[, 2:4]))
fit4 <- ecm(stock[, 1],
            xeq,
            xtr,
            includeIntercept = T)
summary(fit4)

rm(list = ls())
