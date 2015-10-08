sumdf <- read.csv("sample.csv", header = TRUE)

library(shiny)
shinyUI(fluidPage(
  
  titlePanel("Data Mining Homework 2 Data Visulization"),
  
  sidebarLayout(
    
    sidebarPanel(
      h2("Analyse Sate Statistics"),
      selectInput('stateid', "State", as.character(unique(sumdf$State.Name))),
      h6("This changes the Summary Statistics for 2008-2010 & Comparison with Overall Average tabs"),
      selectInput('stat1', "Choose a Statistic", names(sumdf[,3:30])),
      
      h6("Select to compare with the overall average in the Comparison with Overall Average tab"),
      
      h2("Exploration Analysis"),
      selectInput('yearid', "Year", as.character(unique(sumdf$Year))),
      
      h6("Select Bins of histogram"),
      sliderInput("bins", "select the nuber of BINs for histogram", min = 3, max=20, value = 3),
      
      h6("Chronic diseases"),
      radioButtons("disease", "Select Chroic diseases of histogram", choices = c(names(sumdf[,14:24]))),
      width=3
    ),
    
    
    mainPanel(
      
      tabsetPanel(
        position = "above",
        
        tabPanel("Summary Statistics for 2008-2010", 
                 verbatimTextOutput("selectedstate"), 
                 h3("Summary Statistics"),
                 tableOutput("summarytable")), 
        
        tabPanel("Motion Plot", 
                 h2("Motion Plot"),
                 h3("Please select the required data in the fields provided"),
                 h4("(Note: Graphics may take a while to load)"),
                 htmlOutput("plot1")),
        
        tabPanel("Exploratory data Analysis ",
                 h2("Selected Year & Chronic Diseases"),
                 h4("Distribution of Reimbursement for Various Chronic Diseases"),
                 plotOutput("plot3")),   
 
        tabPanel("Documentation Guide",
                 h6("Summary statistics for 2008 to 2010 - Select a Country and it shows summary data for the state selected"),
                 h6("Comparison with Reibursements - Select a State and Statistics and it plots the selected state and the selected statistics compared to the overall"),
                 h6("Motion and Comparison Plots - Select the statistics, state that you are interested in to observe how they change over time.")
        )
        
        )
      )
  )
)
)
