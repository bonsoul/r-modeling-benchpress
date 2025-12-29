library(tidyverse)
library(ISLR)
library(sjPlot)
library(likert)
library(lme4)
library(lmerTest)
library(psych)
library(psychTools)

view_df(Wage, show.frq = T, show.prc = T, show.na = T)



Wage %>%
  plot_frq(education)

P <- Wage %>%
  group_by(race) %>%
  plot_frq(education) %>%
  plot_grid()


save_plot(
  filename = "race_vs_education.jpg",
  fig = P, width = 30, height  =19
)

plot_grpfrq(
  var.cnt = Wage$education,
  var.grp = Wage$jobclass,
  
)



plot_xtab(
  x = Wage$education,
  grp = Wage$jobclass,
  margin = "row",
  bar.pos = "stack",
  show.summary = TRUE,
  coord.flip = TRUE
)

tab_xtab(
  var.row = Wage$education,
  var.col = Wage$jobclass,
  show.row.prc = T
)




Wage %>%
  group_by(jobclass) %>%
  plot_frq(
    wage, 
    type = "histogram",
    show.mean = TRUE,
    normal.curve = TRUE
  ) %>%
  plot_grid()


data(pisaitems)

head(pisaitems)

