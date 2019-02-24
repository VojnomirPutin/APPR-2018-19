library(shiny)

shinyUI(fluidPage(
  titlePanel(''),
  
  tabsetPanel(
    tabPanel('Indeks',
             sidebarPanel(
               selectInput('Regija', 'Regija', c(1,2,3,4)),
               mainPanel(plotOutput('indeks')))))))
  
