# Page One : Overview

intro_page <- tabPanel(
  title = "About",
  fluidPage(
    # Image
    tags$img(id = "cropped_image",
             src = "movietheater.png", alt = "Image of Movie Theater"), 
    # includeHTML("intro_page.html")
    tags$footer(tags$p("Gisele Fox, Emiri Nishizawa, Melina Perraut, Roshni Srikanth, Ha Nhat To: ", 
                       tags$a(id = "url", href= "https://github.com/info-201a-au20/final-project-movies", "Github URL"))
                )
  )
)
# Image source:
# https://consequenceofsound.net/2015/06/whats-your-most-memorable-moviegoing-experience/

