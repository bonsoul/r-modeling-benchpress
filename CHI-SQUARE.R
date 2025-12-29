#install.packages("ggstatsplot")
#install.packages("magrittr")

#install.packages(c("purrr", "magrittr"))


library(ggstatsplot)

library(sjPlot)



ggbarstats(
  data = mtcars,
  x = am,
  y = cyl,
  label = "both"
)



plot_xtab(
  mtcars$am,
  mtcars$cyl,
  show.summary = TRUE
)


ggbarstats(
  data = mtcars,
  x = am,
  y = cyl,
  label = "both"
)






library(rstatix)


contingency_table <- table(mtcars$cyl, mtcars$am)
contingency_table
pairwise_prop_test(contingency_table)
