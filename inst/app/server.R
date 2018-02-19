shinyServer(

  function(input, output) {
    output$waiting <- renderPlot({

      x    <- faithful$waiting
      bins <- seq(min(x), max(x), length.out = input$bins + 1)

      hist(x, breaks = bins, col = "#75AADB", border = "white",
           xlab = "Waiting time to next eruption (in mins)",
           main = "Histogram of waiting times")

    })
    
    output$eruptions <- renderPlot({
      x <- faithful$eruptions
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      hist(x, breaks = bins, col = "#75AADB", border = "white",
           xlab = "Eruption time (in mins)",
           main = "Histogram of eruption times")
      
    })
    
  })
