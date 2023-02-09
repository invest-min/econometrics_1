# base

toupper("abc")
tolower("ABC")

nchar("abc")
length("abc")
nchar(c("a", "bb", "ccc"))
length(c("a", "bb", "ccc"))
nchar("a", "bb", "ccc")
length("a", "bb", "ccc")

paste("a", "b", "c")
paste("a", "b", "c", sep="/")
paste("a", "b", "c", sep="")
paste(c("a", "b", "c"))
paste(c("a", "b", "c"), c("A", "B", "C"), sep="")

paste0("a", "b", "c")
paste0(c("a", "b", "c"))
paste0(c("a", "b", "c"), c("A", "B", "C"))
paste0("a", 1:3)

paste(c("a", "b", "c"), collapse="/")
paste(c("a", "b", "c"), collapse="")
paste(letters, collapse="")
paste(LETTERS, collapse="")
paste(month.name, collapse=" ")
paste(month.abb, collapse=" ")

strsplit("abc/ABC", split="/")
unlist(strsplit("abc/ABC", split="/"))

strsplit("I am happy", split=" ")
strsplit("I am happy", split="")

substr("abcdef", 1, 2)
substr("abcdef", nchar("abcdef") - 1, nchar("abcdef"))

sub("a", "A", "abcabc")
gsub("a", "A", "abcabc")

# stringr

library(stringr)

t <- c("apple juice", "apple pie",
       "banana juice", 'banana pie',
       "orange juice", "orange pie")

str_length(t)

str_c("a", "b", "c", sep=" ")
str_c(t, 1:6, sep=" ")
str_c(t, collapse=" ")

str_dup("a", 3)
str_dup("a", 1:3)
str_dup(c("a", "b"), 3)
str_dup(c("a", "b"), c(1,3))

str_split(t, " ")
unlist(str_split(t, " "))

str_sub(t, 1, 3)

str_replace(t, "an", "xx")
str_replace_all(t, "an", "xx")

str_detect(t, "juice")

str_count(t, "juice")

str_locate(t, "an")
str_locate_all(t, "an")

str_extract(t, "an")
str_extract_all(t, "an")

str_match(t, "an")
str_match_all(t, "an")

rm(list=ls())
