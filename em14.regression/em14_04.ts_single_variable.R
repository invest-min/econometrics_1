# ts

(v <- 1:12)
(t <- ts(v))

plot(v)
plot(t)

ts(v, start = c(2000, 1), frequency = 12)
ts(v, start = c(2000, 7), frequency = 12)
ts(v, start = c(2000, 1), frequency = 4)
ts(v, start = c(2000, 3), frequency = 4)
ts(1:365, start = c(2000, 1), frequency = 365)

(w <- 12:1)
(vw <- cbind(v, w))
str(vw)
(vw <- ts(vw))

(vw <- data.frame(v, w))
str(vw)
(vw <- ts(vw))

s <- ts(12:1)
(ts <- ts.union(t, s))

plot(ts)
plot.ts(ts, plot.type = "multiple")
plot.ts(ts, plot.type = "single")

# lag and diff

(a <- AirPassengers)

plot(a)
summary(a)

lag(a)
lag(a, 2)
lag(a, -1)
lag(a, -2)

diff(a)
plot(diff(a))

diff(a, 12)
plot(diff(a, 12))

log(a)
plot(log(a))

diff(log(a))
plot(diff(log(a)))

# Autocorrelation and Stationarity

acf(a)
pacf(a)
Box.test(a, lag = 1, type = "Ljung")
Box.test(a, lag = 12, type = "Ljung")

library(tseries)

plot(ts(rnorm(1000)))
Box.test(ts(rnorm(1000)), lag = 1, type = "Ljung")
adf.test(ts(rnorm(1000)))
pp.test(ts(rnorm(1000)))

plot(ts(1:1000))
Box.test(ts(1:1000), lag = 1, type = "Ljung")
adf.test(ts(1:1000))
pp.test(ts(1:1000))

plot(a)
Box.test(a, lag = 1, type = "Ljung")
adf.test(a)
pp.test(a)

# Smoothing

ma3 <- function (x) {
  y <- numeric(length(x) - 2)
  for (i in 3 : (length(x))) {
    y[i] <- (x[i - 2] + x[i - 1] + x[i]) / 3
  }
  return(y)
}

(m <- ts(ma3(a), start = c(1949, 1), frequency = 12))

plot(a)
lines(m, col="blue")

plot(v)
approx(v, xout = 6.5)
approx(v, n = 24)
plot(approx(v, n = 24))

plot(v, w)
approx(v, w, xout = 6.5)
approx(v, w, n = 24)
plot(approx(v, w, n = 24)$x, approx(v, w, n = 24)$y)

# Decomposition

plot(a)

(d <- stl(a, s.window = "periodic", robust = T))
plot(d)

library(forecast)

(s <- seasadj(d))
autoplot(s)
ggtsdisplay(s)

f <- forecast(d, method = "naive")
autoplot(f)

library(mFilter)

(h <- hpfilter(a))
plot(h)

# ARIMA

Box.test(s, lag = 1, type = "Ljung")
adf.test(s)
pp.test(s)

(model100 <- Arima(s, order = c(1, 0, 0)))
(model200 <- Arima(s, order = c(2, 0, 0)))
(model300 <- Arima(s, order = c(3, 0, 0)))

AIC(model100, model200, model300)

(model001 <- Arima(s, order = c(0, 0, 1)))
(model002 <- Arima(s, order = c(0, 0, 2)))
(model003 <- Arima(s, order = c(0, 0, 3)))

AIC(model001, model002, model003)

(model303 <- Arima(s, order = c(3, 0, 3)))
(model313 <- Arima(s, order = c(3, 1, 3)))
(model323 <- Arima(s, order = c(3, 2, 3)))

AIC(model303, model313, model323)

library(forecast)
checkresiduals(model313)
forecast(model313)
autoplot(forecast(model313))

auto.arima(s)
checkresiduals(auto.arima(s))
forecast(auto.arima(s))
autoplot(forecast(auto.arima(s)))

sd <- diff(s)
autoplot(sd)
auto.arima(sd)
checkresiduals(auto.arima(sd))
forecast(auto.arima(sd))
autoplot(forecast(auto.arima(sd)))

sl <- log(s)
autoplot(sl)
auto.arima(sl)
checkresiduals(auto.arima(sl))
forecast(auto.arima(sl))
autoplot(forecast(auto.arima(sl)))

sld <- diff(log(s))
autoplot(sld)
auto.arima(sld)
checkresiduals(auto.arima(sld))
forecast(auto.arima(sld))
autoplot(forecast(auto.arima(sld)))

# ARCH and GARCH

library(tseries)

(g01 <- garch(s, order = c(0, 1), trace = F))
summary(g01)

(g02 <- garch(s, order = c(0, 2), trace = F))
summary(g02)

(g11 <- garch(s, order = c(1, 1), trace = F))
summary(g11)

AIC(g01, g02, g11)

checkresiduals(g02)

library(fGarch)

fg0011 <- garchFit(~ garch(1, 1), s, trace = F)
summary(fg0011)
predict(fg0011, 10, plot = T)

fg1111 <- garchFit(~ arma(1, 1) + garch(1, 1), s, trace = F)
summary(fg1111)
predict(fg1111, 10, plot = T)

rm(list = ls())
