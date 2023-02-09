# base

Sys.Date()
typeof(Sys.Date())
mode(Sys.Date())
class(Sys.Date())

typeof("1970-01-31")
mode("1970-01-31")
class("1970-01-31")

as.Date("1970-01-31")
as.Date("1970/01/31")

typeof(as.Date("1970-01-31"))
mode(as.Date("1970-01-31"))
class(as.Date("1970-01-31"))

as.Date("1970.01.31")
as.Date("1970.01.31", format("%Y.%m.%d"))

as.Date("01-31-1970")
as.Date("01-31-1970", format("%m-%d-%Y"))

as.Date("70-01-31")
as.Date("70-01-31", format("%y-%m-%d"))

t <- as.Date("1970-01-31")
format(t, format("%d-%m-%y"))
format(t, format("%d-%m-%y %A"))
format(t, format("%d-%m-%y %a"))

weekdays(t)
months(t)
quarters(t)

t + 1
t + 1:7

seq(t, by=1, length=7)
seq(t, by="7 days", length=4)
seq(t, by="week", length=4)
seq(t, by="month", length=4)
seq(t, by="3 months", length=4)
seq(t, by="quarter", length=4)
seq(t, by="4 quarters", length=4)

y <- 1970
m <- 1
d <- 1
ISOdate(y, m, d)
class(ISOdate(y, m, d))
as.Date(ISOdate(y, m, d))

Sys.Date() - t
difftime(Sys.Date(), t, units="days")
difftime(Sys.Date(), t, units="weeks")

Sys.Date() > t

# lubridate

library(lubridate)

today()
now()

ymd("1970-01-31")
ymd("1970/01/31")
ymd("1970.01.31")

ymd("70-01-31")
mdy("01-31-1970")
dmy("31011970")
dmy("310170")

ymd("1970년 1월 1일")
mdy("jan 1st 1970")

year(Sys.Date())
quarter(Sys.Date())
month(Sys.Date())
day(Sys.Date())

yday(Sys.Date())
mday(Sys.Date())
wday(Sys.Date())
wday(Sys.Date(), label=T)

rm(list=ls())
