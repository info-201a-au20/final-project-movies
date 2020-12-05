# Bar Chart Page
library(shiny)
# going to be focusing on budget and gross revenue
# users have the option of choosing between looking at 
# the average, median, and total for budget or revenue

measurement_list <- list(
  "Average Budget" = "average_budget",
  "Median Budget" = "median_budget",
  "Total Budget" = "total_budget",
  "Average Revenue" = "average_revenue",
  "Median Revenue" = "median_revenue",
  "Total Revenue" = "total_revenue"
)

measurement_input <- selectInput(
  inputId = "measurement",
  choices = measurement_list,
  selected = "Average Budget"
)

