


library(shiny)
library(googleVis)
require(devtools)
library(psych)
library(ggplot2)
library(dplyr)
library(rCharts)
library(MASS)
# Load data
sumdf <- read.csv("sample.csv", header = TRUE)

shinyServer(
  
  function(input, output) {

    # Summary Tables   
    output$selectedstate <- renderText({paste("Selected State:", input$stateid, sep=" ")})
    output$summarytable <- renderTable({
      describe(sumdf[sumdf$State.Name==paste(input$stateid,sep=""),])[c(-1,-2,-4),c(3:5,8:10)]
    })
    
    
    # Plot motion chart
    output$plot1 <- renderGvis({
      gvisMotionChart(sumdf[!duplicated(sumdf[,c("State.Name","Year")]),], idvar = "State.Name", timevar = "Year", xvar = "Age", yvar = "ReiburSum",
                      options= list(width=1000, height=500))})

    
    output$plot3 <- renderPlot({
      colm =as.numeric(input$yearid)
      dis =input$disease
     # nPlot(Age ~ ReiburSum, group = 'Year', type = 'multiBarChart', data = sumdf[which(sumdf$dis == 1),])
      newdata = sumdf[which(sumdf$Year ==2008 & sumdf$SP_ALZHDMTA == 1) ,]
      hist(newdata$ReiburSum, breaks = seq(0, max(newdata$ReiburSum, l = input$bins+1)))})
    
    
    
  }
  )                            

