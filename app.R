# App.R

library("shiny")
library("ggplot2")
source("app_ui.R")
source("app_server.R")

# Load App
shinyApp(ui = ui, server = server)
