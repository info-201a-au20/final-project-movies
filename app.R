# App.R

library("shiny")
library("ggplot2")
source("app_server.R")
source("app_ui.R")

# Load App
shinyApp(ui = ui, server = server)
