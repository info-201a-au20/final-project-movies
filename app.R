# App.R
# Load libraries
library("shiny")
library("ggplot2")
library("dplyr")
library("tidyr")
# Source ui and server
source("app_ui.R")
source("app_server.R")

# Load App
shinyApp(ui = ui, server = server)
