# App.R
# Load libraries
library("shiny")
library("ggplot2")
library("dplyr")
library("tidyr")
# Source ui and server
source("app_server.R")
source("app_ui.R")


# Load App
shinyApp(ui = ui, server = server)
