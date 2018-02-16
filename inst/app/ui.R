shinyUI(function(request){
  fluidPage(theme = shinythemes::shinytheme("cerulean"),
            titlePanel(tags$head(tags$link(rel = "icon", type = "image/png", href = "hn.png"),
                                 tags$title("Helseatlas"),
                                 tags$style(type = "text/css", "a{color: #808080;}"), # Farge på linker, samt text inaktive faner
                                 # tags$style(type = "text/css", "a{color: #C0C0C0;}"), # Farge på linker, samt text inaktive faner
                                 tags$style(type = "text/css", "h1{color: #003A8C;}"), # Farge på tittel
                                 tags$style(type="text/css", ".container-fluid { max-width: 1200px;}") # max bredde på side
            )),
            sidebarPanel(
              sliderInput(inputId = "bins",
                          label = "Number of bins:",
                          min = 1,
                          max = 50,
                          value = 30),
              width = 3
            ),
            mainPanel(
              plotOutput(outputId = "distPlot"),
              width = 9
            )

)})
