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



d <- pisaitems %>%
  select(starts_with("ST25Q")) %>%
  sjmisc::to_factor(ordered = TRUE)

view_df(d, show.frq = TRUE, show.prc = TRUE)

plot_likert(d, show.prc = TRUE)


d <- pisaitems %>%
  dplyr::select(starts_with("ST25Q"))

view_df(d, show.frq = T, show.prc = T)


plot_likert(d)


m <- lm(wage ~ education, data = Wage)

plot_model(m, type = "pred")


summary(m)


plot_model(m, show.values = TRUE, width = 0.1) +
  ylab("Increase in Salary as Compared to no education")


tab_model(m,
          show.reflvl = T,
          show.intercept = F,
          p.style = "numeric_stars")


Wage$wage_s <- scale(Wage$wage)

m.lmm <- lmer(age ~ wage_s * jobclass * health + (1 | education),
              data = Wage)


plot_model(m.lmm, type = "int", bias_correction = TRUE)


plot_model(m.nb, type = "pred",
           terms = c("health", "jobclass", "wage[50, 150, 300]"))




plot_model(
  m.nb,
  type = "re",
  width = .5,
  show.values = TRUE
) + ylim(0.9, 1.1)


#fit the models

fit1 <- lm(age ~ education + jobclass + health_ins, data  =Wage)
fit2 <- lm(age ~ education + jobclass + health_ins, data = Wage)

#plot multiple models
plot_models(fit1,fit2,show.values = T,grid = TRUE)


plot_models(fit1, fit2, p.shape  = TRUE)


tab_model(
  fit1, fit2,
  collapse.ci = TRUE,
  p.style = "numeric_stars"
)

