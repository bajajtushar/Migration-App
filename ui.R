b=readRDS("data/b.rds")
library(ggplot2)
library(magrittr)
library(dplyr)
library(shiny)
library(rlang)
library(viridis)
ui=fluidPage(
  titlePanel("Migration GIS "),
fluidRow(
    column(3,h5("Select Parameters"),
    radioButtons(inputId="sector",label = "Destination area type",choices = unique(b$sector),selected = "Rural")),
    column(3,br(),br(),
    radioButtons(inputId="lastres",label = "Source area type",choices = unique(b$sectoroflastresidence),selected = "Urban")),
    column(3,br(),br(),radioButtons(inputId="gender",label = "Gender",choices = unique(b$Gender),selected = "Total")),
   column(3, selectInput("duration",h6("Duration of residence"),choices = unique(b$durationofresidence),selected = "All durations of residence",selectize = F),
    selectInput("reason",h6("Reason for Migration"),choices = unique(b$reason),selected = "Work",selectize = F)),
    
     
    plotOutput(outputId="migrantgis")
    
   
))
  
  
  
  
  
  
  
  

