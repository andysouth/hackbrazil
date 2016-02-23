#shinyRangeShift/ui.r
#andy south 22/2/2016

library(shiny)
library(sp)
#library(rgeos)
#library(rgdal)

#trying this to improve blurry plots in shiny
#library(Cairo) 
#options(shiny.usecairo=TRUE)
#this did make the plots look better
options(shiny.usecairo=FALSE)

#for me to deploy online
#library(shinyapps)
#setwd("C:\\rworldmapNotes\\")
#deployApp('rworldmapUI')


circle_fun <- function(center = c(0,0),r = 1, npoints = 100){
  tt <- seq(0,2*pi,length.out = npoints)
  xx <- center[1] + r * cos(tt)
  yy <- center[2] + r * sin(tt)
  return(data.frame(x = xx, y = yy))
}

#create global vars for 1 degree outlines



shinyServer(function(input, output) {
   
  
  # map plot ----
  output$plot_circles <- renderPlot({
  
    
    
    ## dotted for 1 degree current
    ## plus the protected areas in the middle
    
    r <- 1.8/1 #/10 #/x just to fit on plot
    
    circ1 <- circle_fun(center = c(1,1),r = r)
    circ1$z <- "c1"
    #circ2 <- circle_fun(center = c(1.1,1),r = r)
    circ2 <- circle_fun(center = c(3,1),r = r)
    circ2$z <- "c2"
    circ3 <- circle_fun(center = c(2,3),r = r)
    circ3$z <- "c3"
    
    circs <- rbind(circ1, circ2, circ3)
    
    # ggplot(circs, aes(x,y, fill = z)) + 
    #        geom_polygon(alpha = 0.5) +
    #        coord_fixed()
    
    #sp::plot(polys, border='red', lty=2)
    
    #convert to sp object
    pol1 <- Polygons(list(Polygon(circ1[1:2])), "c1")
    pol2 <- Polygons(list(Polygon(circ2[1:2])), "c2")
    pol3 <- Polygons(list(Polygon(circ3[1:2])), "c3")
    
    
    polys = SpatialPolygons(list(pol1, pol2, pol3))
    
    #par(mar=rep(0.2, 4)) #, xpd = NA)

    par(mar=c(4,0,0,0)) #, xpd = NA)
        
    sp::plot(polys, border='red', lty=3)
      
    ############################################
    ## now the regions based on the input values
    
    
    r <- 1.8
    if (input$range_shrink) r <- r/input$temp_rise #/10 #/x just to fit on plot
    
    ymove <- 0
    if (input$range_move) ymove <- input$temp_rise/3
    
    circ1 <- circle_fun(center = c(1,1-ymove),r = r)
    circ1$z <- "c1"
    #circ2 <- circle_fun(center = c(1.1,1),r = r)
    circ2 <- circle_fun(center = c(3,1-ymove),r = r)
    circ2$z <- "c2"
    circ3 <- circle_fun(center = c(2,3-ymove),r = r)
    circ3$z <- "c3"
    
    circs <- rbind(circ1, circ2, circ3)
    
    # ggplot(circs, aes(x,y, fill = z)) + 
    #        geom_polygon(alpha = 0.5) +
    #        coord_fixed()
    
    #sp::plot(polys, border='red', lty=2)
    
    #convert to sp object
    pol1 <- Polygons(list(Polygon(circ1[1:2])), "c1")
    pol2 <- Polygons(list(Polygon(circ2[1:2])), "c2")
    pol3 <- Polygons(list(Polygon(circ3[1:2])), "c3")
    
    pol2 = SpatialPolygons(list(pol1, pol2, pol3))
    
    sp::plot(pol2, col=rgb(0,0,1, alpha=0.5), add=TRUE)
    
    
    #calculate the intersect for calculations & display
    #currently fails
    #intersect1 <- gIntersection(polys2[1], polys2[2])
    #intersect2 <- gIntersection(intersect1, polys2[3])
    
    #sp::plot(intersect2, border='black', add=TRUE)    
    
    
  })



})
