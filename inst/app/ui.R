shinyUI(function(request){
  navbarPage(title = "",
             tabPanel("input", sliderInput(inputId = "bins",
                                           label = "Number of bins:",
                                           min = 1,
                                           max = 50,
                                           value = 30)),
             navbarMenu(title="Plots",
                        tabPanel("Waiting", plotOutput(outputId = "waiting")),
                        tabPanel("Eruptions", plotOutput(outputId = "eruptions"))
             )
  )
})
