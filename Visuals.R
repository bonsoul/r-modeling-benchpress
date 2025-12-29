library(tidyverse)
library(ISLR)
library(sjPlot)
library(likert)
library(lme4)
library(lmerTest)


view_df(Wage, show.frq = T, show.prc = T, show.na = T)



Wage %>%
  plot_frq(education)
