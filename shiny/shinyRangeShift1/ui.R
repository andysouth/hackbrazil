#shinyRangeShift/ui.r
#andy south 22/2/2016

library(shiny)


shinyUI(fluidPage(
  
  #fluidRow(h1("Global Warning")),
           #helpText("An illustrative example to show how range shifts can lead to loss of species"),

  fluidRow(h3("Climate change can move species distributions out of protected areas."),
           h4("Prototype conceptual model developed at infohackit 2016, Norwich")
           # column(6, h4("Change the temperature to see potential effects :")),
           # column(7, sliderInput("temp_rise", "Temperature rise in degrees C :", 
           #                       min = 1,
           #                       max = 5, 
           #                       value = 1))          
           ),  
    
  fluidRow(
    #column(2,
           
           #h3("Range Shift Illustrative example"),
           
#            selectInput("variable", "to plot :",
#                        c("population" = "POP_EST",
#                          "gdp" = "GDP_MD_EST"
#                        )),


           sliderInput("temp_rise", "Temperature rise in degrees C :",
                       min = 1,
                       max = 5,
                       value = 1),
           
           checkboxInput("range_shrink", "range shrink", TRUE), #var,name

           checkboxInput("range_move", "range move", FALSE) #var,name

           # selectInput("colourPalette", "colourPalette :",
           #             c("YlOrRd" = "YlOrRd",
           #               "YlGnBu" = "YlGnBu",
           #               "Purples" = "Purples",
           #               "PuBuGn" = "PuBuGn",
           #               "Greens" = "Greens"
           #             )), 
           # 
           # selectInput("transformation", "map transformation :",
           #             c("Long Lat" = "longlat",
           #               "Robinson" = "robin",
           #               "Winkel Tripel" = "wintri",
           #               "Mercator" = "merc",
           #               "Lambert Conformal Conic" = "lcc",
           #               "Mollweide" = "moll"                        
           #             )),           
           # 
    ),
    
#    column(10,
           
fluidRow(           
           plotOutput("plot_circles", width = "100%")
           
           # tabsetPanel(
           #   tabPanel("Map", plotOutput("rwmplot", width = "100%")
           #   ),
           #   #tabPanel("Code", textOutput("codeText")
           #   #),
           #   tabPanel("Map Code", verbatimTextOutput("codePrint")
           #   #tabPanel("Code print", textOutput("codePrint")
           #   ),
           #   tabPanel("Barplot",plotOutput("barplot", width = "100%")
           #   ),
           #   tabPanel("Barplot Code", verbatimTextOutput("codePrintBarplot")
           #   )
           #) #end tabset panel
    )
#  )
  
))

