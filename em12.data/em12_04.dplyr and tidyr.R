# tidyverse

search()
install.packages("tidyverse")
library(tidyverse)
search()

# tibble

library(tibble)

(t <- tibble(x, y))
(t <- as_tibble(d))
str(t)

t <- d %>%
  rownames_to_column(var = "n") %>% 
  as_tibble()
t

# dplyr

library(dplyr)

# arrange

df <- data.frame(a=1:10,
                 b=seq(1, 100, length=10),
                 c=sample(1:2, 10, replace=T, set.seed(1234)),
                 d=sample(letters, 10))
df

arrange(df, c)
arrange(df, c, d)
arrange(df, c, desc(d))

# filter, slice

filter(df, c == 1)
subset(df, c == 1)
df[df$c == 1,]

filter(df, c == 1, a >= 7)
filter(df, c == 1 & a >= 7)
filter(df, c == 1 | c == 2)

slice(df, 6:10)
slice(df, n())
slice(df, (n() - 4):n())

df %>% slice(5:10)
df %>% slice(-(5:10))

df %>% slice(1)
df %>% slice(n())
df %>% slice_head(n = 3)
df %>% slice_tail(n = 3)

df %>% slice_sample(n = 3)
df %>% slice_sample(n = 3, replace=T)
df %>% slice_sample(prop = .3)
df %>% slice_sample(prop = .3, replace=T)

df %>% slice_min(b, n = 3)
df %>% slice_max(b, n = 3)
df %>% slice_min(b, prop = .3)
df %>% slice_max(b, prop = .3)

# select, relocate, rename

select(df, a, b, c)
select(df, c, b, a)
select(df, -a)
select(df, -a, -b)
select(df, x = a, y = b, z = c)

df %>% select(everything())
df %>% select(last_col())
df %>% select(starts_with("a"))
df %>% select(starts_with("b"))
df %>% select(contains("c"))

df %>% relocate(c)
df %>% relocate(b, .after = c)

rename(df, x = a, y = b, z = c)
rename_with(df, toupper)

# mutate, summarise

mutate(df, e = a + b)
transform(df, e = a + b)

mutate(df, e = a + b, f = e/2)
transform(df, e = a + b, f = e/2)

summarise(df, mean(b), median(b), sd(b))
summarise(df,
          mean=mean(b),
          median=median(b),
          sd=sd(b),
          N=n())

df %>% summarise(across(starts_with("a"), mean))
df %>% summarise(across(where(is.numeric), mean))

# sample

sample_n(df, 5)
sample_n(df, 5, replace=T)

sample_frac(df, .5)
sample_frac(df, .5, replace=T)

# group_by

group_by(df, c)

df_group <- group_by(df, c)
summarise(df_group,
          mean=mean(b),
          median=median(b),
          sd=sd(b),
          N=n())

df %>% 
  group_by(c) %>% 
  summarise(mean=mean(b),
            median=median(b),
            sd=sd(b),
            N=n())

df %>% head
df$b %>% mean

# join, bind

df1 <- data.frame(i=c("a", "b", "c"),
                  n=c("d", "e", "f"),
                  x=c(1, 2, 3))

df2 <- data.frame(i=c("a", "b", "d"),
                  m=c("g", "h", "i"),
                  y=c(4, 5, 6))

df1 %>% inner_join(df2, by="i")
df1 %>% left_join(df2, by="i")
df1 %>% right_join(df2, by="i")
df1 %>% full_join(df2, by="i")

semi_join(df1, df1)
anti_join(df1, df2)

df1 <- data.frame(i=c("a", "b", "c"),
                  n=c("d", "e", "f"),
                  x=c(1, 2, 3))

df2 <- data.frame(j=c("a", "b", "c"),
                  m=c("g", "h", "i"),
                  y=c(4, 5, 6))

bind_cols(df1, df2)
bind_rows(df1, df2)

# tidyr

library(tidyr)

# pivot_longer, pivot_wider

df <- data.frame(i=c("a", "b", "c"),
                 n=c("d", "e", "f"),
                 y2010=c(1, 2, 3),
                 y2020=c(4, 5, 6))

df %>% pivot_longer(-c(i, n),
                    names_to="year",
                    values_to="value")

df %>% pivot_longer(c("y2010", "y2020"),
                    names_to="year",
                    values_to="value")

df <- df %>%
  pivot_longer(contains("y"),
               names_to="year",
               names_prefix="y",
               names_transform=list(year=as.integer),
               values_to="value")
df

df %>% pivot_wider(names_from="year",
                   values_from="value")

# separate, unite

(df <- df %>% separate(year, c("y1", "y2"), sep=2))
(df <- df %>% unite(year, y1, y2))

rm(list=ls())
