#shinyRangeShift/ui.r
#andy south 22/2/2016

library(shiny)


shinyUI(fluidPage(
  

  fluidRow(h3("Climate change can move species distributions out of protected areas."),
           h4("Prototype conceptual model developed at infohackit 2016, Norwich")
           ),  
    
  fluidRow(

           sliderInput("temp_rise", "Temperature rise in degrees C :",
                       min = 1,
                       max = 5,
                       value = 1),
           
           checkboxInput("range_shrink", "range shrink", TRUE), #var,name

           checkboxInput("range_move", "range move", FALSE) #var,name

    ),
    
           
fluidRow(           
           plotOutput("plot_circles", width = "100%")
    )

  
))

