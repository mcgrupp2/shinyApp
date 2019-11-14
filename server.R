library(shiny)
library(tidyverse)
#library(ggplot2)



function(input, output) {
  
    
  
  dataset <- reactive({
    mutate(read.csv("FullBeerData.csv"), Beer = "Beer")
  })
  
  #ibuData <- eventReactive(input$Plot_IBU, {
  #  runif(TRUE)
  #})
  
  output$ibuPlot <- renderPlot({
    
    p_hist <-  dataset() %>% ggplot(aes(x=IBU, y = ..count..)) + 
            geom_histogram(stat='count', color = 'blue', fill = 'red') + 
            labs(title = "Number of Beer at each IBU value", x = "IBU Value", y = "Number of Ales") 

    
    
    
    p_box <- dataset() %>% ggplot(aes(y=IBU, x = Beer)) + 
            geom_boxplot(color = 'red', fill = 'blue') + 
            labs(title = "Distribution of IBU values Across Styles", x = element_blank(),  y = "IBU Value") 



    if((input$Plot_IBU) & (input$ibu_type == "Histogram")){
      
        print(p_hist)
      
      } else if ((input$Plot_IBU) & (input$ibu_type == "Boxplot"))
        {
        
        print(p_box)
        
      }

  }, height=400)
  
  

  
  output$abvPlot <- renderPlot({
    
    q_hist <-  dataset() %>% ggplot(aes(x=ABV, y = ..count..)) + 
      geom_histogram(stat='count', color = 'blue', fill = 'red') + 
      labs(title = "Number of Beer at each ABV value", x = "ABV Value", y = "Number of Ales") 
    
    
    
    
    q_box <- dataset() %>% ggplot(aes(y=ABV, x = Beer)) + 
      geom_boxplot(color = 'red', fill = 'blue') + 
      labs(title = "Distribution of ABV values Across Styles", x = element_blank(),  y = "ABV Value") 
    
    
    
    if((input$Plot_ABV) & (input$abv_type == "Histogram")){
      
      print(q_hist)
      
    } else if ((input$Plot_ABV) & (input$abv_type == "Boxplot"))
    {
      
      print(q_box)
      
    }
    
  }, height=400)
  
}