# Function

mean <- function(x) x+1
cars$speed
mean(cars$speed)
rm(mean)
mean(cars$speed)

fn <- function(x) x * .3025
fn(100)

fn <- function(x) {
  py <- round(x * .3025, digits = 2)
  out <- paste0(x, "m2 is ", py, "py")
  return(out)
}
fn(100)
fn(c(100, 200))

fn
fn2 <- fn
fn2
fn2(100)

fn2 <- function(x) {
  py <- round(x * .3025, digits = 2)
  paste0(x, "m2 is ", py, "py")
}
fn2(100)

fn <- function(x) {
  if(!is.numeric(x)) return("Not a number")
  py <- round(x * .3025, digits = 2)
  out <- paste0(x, "m2 is ", py, "py")
  return(out)
}
fn("a")
fn(100)
fn(a)
a <- 100
fn(a)

fn <- function(x, unit) {
  if(!is.numeric(x)) return("Not a number")
  if(unit == "py") area <- round(x * .3025, digits = 2)
  if(unit == "sqft") area <- round(x * 10.7639, digits = 2)
  if(unit != "py" & unit != "sqft")
    return("Unit is Not py nor sqft")
  out <- paste0(x, "m2 is ", area, unit)
  return(out)
}
fn("a")
fn(100)
fn(100, "py")
fn(100, "sqft")
fn(100, "acre")

fn <- function(x, unit = "py") {
  if(!is.numeric(x)) return("Not a number")
  if(unit == "py") area <- round(x * .3025, digits = 2)
  if(unit == "sqft") area <- round(x * 10.7639, digits = 2)
  if(unit != "py" & unit != "sqft")
    return("Unit is Not py nor sqft")
  out <- paste0(x, "m2 is ", area, unit)
  return(out)
}
fn(100)

fn <- function(x, unit = "py", ...) {
  if(!is.numeric(x)) return("Not a number")
  if(unit == "py") area <- round(x * .3025, ...)
  if(unit == "sqft") area <- round(x * 10.7639, ...)
  if(unit != "py" & unit != "sqft")
    return("Unit is Not py nor sqft")
  out <- paste0(x, "m2 is ", area, unit)
  return(out)
}
fn(100)
fn(100, unit = "sqft", digits = 2)

fn <- function(x, unit = "py", digits = 2) {
  if(!is.numeric(x)) return("Not a number")
  if(unit == "py") area <- round(x * .3025, digits = 2)
  if(unit == "sqft") area <- round(x * 10.7639, digits = 2)
  if(unit != "py" & unit != "sqft")
    return("Unit is Not py nor sqft")
  out <- paste0(x, "m2 is ", area, unit)
  return(out)
}
fn(100)
fn(100, digits = 4)

fn <- function(x, unit = "py", FUN = round, ...) {
  if(!is.numeric(x)) return("Not a number")
  if(unit == "py") area <- FUN(x * .3025, ...)
  if(unit == "sqft") area <- FUN(x * 10.7639, ...)
  if(unit != "py" & unit != "sqft")
    return("Unit is Not py nor sqft")
  out <- paste0(x, "m2 is ", area, unit)
  return(out)
}
fn(100)
fn(100, digits = 2)
fn(100, FUN=signif, digits = 3)
fn(100, FUN = floor)
fn(100, FUN = ceiling)

# If, Else, Ifelse

x <- pi
y <- exp(1)

if(x > y) x
if(x < y) y
if(x < y) y else x

x <- 1:5
y <- c(3, 3, 3, 3, 3)

if(x > y) x
if(x < y) y

ifelse(x > y, x, y)

# Swich

switch(1, "a", "b", "c")
switch(2, "a", "b", "c")
switch(3, "a", "b", "c")
switch(4, "a", "b", "c")

switch("a", a="aa", b="bb", c="cc")
switch("b", a="aa", b="bb", c="cc")
switch("c", a="aa", b="bb", c="cc")
switch("d", a="aa", b="bb", c="cc")

fn <- function(x, type) {
  switch(type,
         mean=mean(x),
         median=median(x))
}
x <- c(1:9, 20)
fn(x, "mean")
fn(x, "median")

# Repeat, While, For

i <- 5
repeat {
  if(i > 25) break
  else {
    print(i)
    i <- i + 5
  }
}

i <- 5
while (i <= 25) {
  print(i)
  i <- i + 5
}

for (i in seq(5, 25, by=5)) print(i)

(v <- vector("double", 5))
for(i in seq_along(v)) {
  v[i] <- mean(rnorm(10))
}
v

rm(list=ls())
