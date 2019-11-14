library(shiny)
library(ggplot2)

dataset <- diamonds

fluidPage(
  
  titlePanel("Beer IBU/ABV Explorer"),
  
  sidebarPanel(
    
    # Copy the line below to make an action button
    #actionButton("action", label = "Make Plots"),
    
    #hr(),
    #fluidRow(column(2, verbatimTextOutput("value")),
    
    #sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                #value=min(1000, nrow(dataset)), step=500, round=0),
    
    #selectInput('IBU', 'IBU', names(dataset)),
    #selectInput('ABV', 'ABV', names(dataset), names(dataset)[[2]]),
    #selectInput('color', 'Color', c('None', names(dataset))),
    
    checkboxInput('Plot_IBU', 'Plot IBU(s)'),
    checkboxInput('Plot_ABV', 'Plot ABV(s)'),
    
    selectInput('ibu_type', 'Plot Type', c("Histogram", "Boxplot")),
    selectInput('abv_type', 'Plot Type', c("Histogram", "Boxplot"))
  ),
  
  mainPanel(
    plotOutput('ibuPlot'),
    hr(),
    plotOutput('abvPlot')
  )
)