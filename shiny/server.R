library(shiny)

function(input, output) {
  
  output$place <-renderPlot({
    graf.indeksi(input$Regija)
    
  })
}