# Data and Function

cars
head(cars)
head(cars, 10)
tail(cars)
tail(cars, 10)
help(cars)

mean
mean(cars)
mean(cars$speed)
mean(cars$dist)
help(mean)

# Working Directory

getwd()

setwd("C:/R/class")
getwd()

save(cars, file = "cars.rda")
load("cars.rda")
rm(cars)

data(cars)
rm(cars)

cars <- cars
rm(cars)

setwd("C:/R")
getwd()

# Package: Install -> Load
# Library: System(Base, Recommended), User

# Package 1: System Library_Base

search()

help(package = "base")

ls("package:base")
data(package = "base")

ls("package:datasets")
data(package = "datasets")

# Package 2: System Library_Recommended

data(singer)
help(singer)

library(lattice)
search()
data(singer)
rm(singer)

detach(package:lattice)
search()
data(singer)

data(singer, package = "lattice")
data(package = "lattice")
lattice::singer

xyplot(dist ~ speed, cars)
help(xyplot)

library(lattice)
search()

xyplot(dist ~ speed, cars)

detach(package:lattice)
search()
xyplot(dist ~ speed, cars)

lattice::xyplot(dist ~ speed, cars)

# Package 3: User Library

.libPaths()

install.packages("dplyr")
search()
library(dplyr)
search()

ls("package:dplyr")
data(package = "dplyr")

detach(package:dplyr)
search()

# Help

help(package = "base")
help(mean)
?mean
args(mean)
example(mean)

help(package = "lattice")
help(xyplot)

help(package = "dplyr")
help(filter)
help(filter, package = "dplyr")

help.search("filter")
??filter

help.start()
RSiteSearch("filter")

rm(list=ls())

# Clear Console: Ctrl+L
