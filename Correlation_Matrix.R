library(dlookr)


plot_correlate(iris[, 1:3])


library(
  "PerfomanceAnalytics"
)


library(tidyverse)


library(GGally)


ggpairs(iris,
        columns = 1:3,
        aes(colour = Species),
        lower = list(continous = "smooth"))

chart.Correlation(iris[,1:3],method = "kendall")

library(flextable)


iris %>%
  normality() %>%
  mutate(across(is.numeric, ~ round(.,3))) %>%
  regulartable()


iris %>%
  group_by(Species) %>%
  select(1:3, 5) %>%
  normality() %>%
  mutate(across(is.numeric, ~round(., 3))) %>%
  regulartable()


library(ggstatsplot)

grouped_ggcorrmat(
  iris,
  type = "parametric",
  grouping.var = Species,
  plotgrid.args = list(nrow = 2)
)
