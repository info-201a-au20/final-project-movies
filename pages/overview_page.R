# Page One : Overview

# Load libraries
library("lintr")

intro_page <- tabPanel(
  title = "About",
  fluidPage(
    # Image
    tags$img(id = "cropped_image",
             src = "movietheater.png", alt = "Image of Movie Theater"),

    h1("About This Project"),
    includeHTML("overview_page.html"),

    bsCollapsePanel(
      "Click to learn more about the limitations of our project",
      includeHTML("intro_limitations.html")
    ),

    tags$img(id = "cropped_footer_image",
             src = "movietheater.png", alt = "Image of Movie Theater"),

    tags$footer(tags$p(
      "Gisele Fox, Emiri Nishizawa, Melina Perraut, Roshni Srikanth, Ha Nhat To: ",
      tags$a(id = "url",
             href = "https://github.com/info-201a-au20/final-project-movies",
             "Github URL"))
    )
  )
)
