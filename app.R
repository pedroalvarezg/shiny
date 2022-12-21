#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(datasets)
library(ggplot2)
require(gridExtra)
library(fpp2)
library(shinyWidgets)
library(shinyjs)
library(shinydashboard)
library(TSA)
library(tseries)
library(forecast)
library(openxlsx)
library(tidyverse)
library(lubridate)
library(fpp2)
library(plotly)
library(autoplotly)
library(vroom)
library(highcharter)
source("Prediction.R")


########################################

########################################

# Define UI for application 
ui <- dashboardPage(title = "Sales Projection",skin = "red",
  dashboardHeader(title = "Projections"
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem(text = "Sales Projections", tabName  = "ventas", icon = icon("credit-card")),
      menuItem(text = "Expenses Projections", tabName  = "expenses",icon = icon("sack-dollar")),
      menuItem(text = "Revenue", tabName = "revenue", icon = icon("money-bill-trend-up"))
    )
  ),
  dashboardBody(
    tabItems(tabItem(tabName = "ventas",
                     fluidRow(
                       column(width = 11,
                              valueBox(value = .0203 %>% scales::percent(),
                                      subtitle = "Porcentaje",
                                      icon = icon("percent")),
                              valueBox(value = .0203 %>% scales::percent(),
                                       subtitle = "Porcentaje",
                                       icon = icon("percent"),
                                       color = "olive"),
                              valueBox(value = .0203 %>% scales::percent(),
                                       subtitle = "Porcentaje",
                                       icon = icon("percent"),
                                       color = "navy")
                         
                       )
                     ),
            fluidRow(column(width = 11, plotlyOutput("ventas")))
             ),
      tabItem(tabName = "expenses",
              fluidRow(
                column(width = 11,
                       valueBox(value = .0203 %>% scales::percent(),
                                subtitle = "Porcentaje",
                                icon = icon("percent")),
                       valueBox(value = .0203 %>% scales::percent(),
                                subtitle = "Porcentaje",
                                icon = icon("percent")),
                       valueBox(value = .0203 %>% scales::percent(),
                                subtitle = "Porcentaje",
                                icon = icon("percent"))
                       
                )
              ),
              fluidRow(column(width = 11, plotlyOutput("expenses")))
        
      ),
      tabItem(tabName = "revenue",
              plotlyOutput("revenue"))
    )
  )
)
  
# Define server 
server <- function(input, output,session) {
  output$ventas <- renderPlotly(ventas)
  output$expenses <- renderPlotly(plot.inicial)
  output$revenue <- renderPlotly(plot.inicial)
}

# Run the application 
shinyApp(ui = ui, server = server)