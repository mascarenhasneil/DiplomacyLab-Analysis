#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#




options(scipen=5)   #  A penalty to be applied when deciding to print numeric values in fixed or exponential notation.
options(digits = 3)   # Globally sets 3 places after decimal point
options(shiny.autoreload = TRUE) # the app directory will be continually monitored for changes to files with extensions: r, htm, HTML, js, CSS, png, jpg, jpeg, gif. If any changes are detected, all connected Shiny sessions are reloaded. Thus, it allows for fast feedback loops when tweaking Shiny UI.


# Importing the library that we need.
# 

## Tools to work with core language features of R and the tidyverse
library("dplyr")
library("psych")
library("plyr")

## For Data cleaning and processing
library("tidyr")
library("tidyverse")

## This package makes it possible to read Excel (.xlsx) files to r.
library("readxl")


## To plot realistic, interactive plots
library("ggplot2")
library("ggpubr")
library("RColorBrewer")
library("plotly")
library("EDA")


## Shiny is an R package that makes it easy to build interactive web apps straight from R
library("shiny")
## offers custom widgets and other components to enhance your shiny applications.
library("shinyWidgets")
## shinydashboard makes it easy to use Shiny to create dashboards. it requires Shiny 0.11 or above 
library("shinydashboard")




# Load the dataset 
# 

## C_data <- data.frame(read_csv("MPS Analytics\\Sem 2\\ALY6070 - Communication and Visualization for Data Analytics SEC Spring 2021 CPS\\Assignments\\A3\\CommiteesDataCleanedFinal.csv"))


C_data <- data.frame(read_csv("CommiteesDataCleanedFinal.csv"))

#str(C_data)
#names(C_data)

KeyTable = as.data.frame(table(C_data$Keywords))

Top10Keys = head(KeyTable[order(KeyTable$Freq, 
                                decreasing= T),], 
                 n = 10) ## to select only top 10


# C_data_Uni = C_data[!duplicated(C_data$ID),]
# as.data.frame(table(C_data$Keywords, C_data$CommiteeName))


AllCommitee = C_data %>% # Applying group_by & summarise
    group_by(CommiteeName) %>%
    summarise(count = n_distinct(Keywords))
#AllCommitee = 
    
    




# Define UI for application that draws a histogram
ui <- dashboardPage(

    # Application title
    dashboardHeader(title = "Diplomacy Lab's Data"),

    # Sidebar with a slider  
    dashboardSidebar(
        width = 350,
        sidebarMenu(style = "position: fixed; overflow: visible;",
            menuItem("Dashboard by Neil", 
                     tabName = "dashboard", 
                     icon = icon("dashboard")),
            
            pickerInput("selectKeys","Select Keyword:", as.character(Top10Keys$Var1), 
                        options = list(`actions-box` = TRUE), 
                        selected = as.character(Top10Keys$Var1), 
                        multiple = T),
            
            pickerInput("selectComm","Select Commitee:", as.character(AllCommitee$CommiteeName), 
                        options = list(`actions-box` = TRUE), 
                        selected = as.character(AllCommitee$CommiteeName), 
                        multiple = T)
            
            
            
        )),

        # Show a plot of the generated distribution
        dashboardBody(
            
            fluidRow(
                column(10, offset = 0,
                       h2('Are there any common keywords among several committees? If yes, what are they?'),
                       
                ) 
            ),
            
            fluidRow(
                column(width = 12,
                box(
                    title = "Top Ten Issues",
                    collapsible = TRUE,
                    plotOutput("Top10Keys", height = 300)
                ),
                
                box(title = "Issues In Each Commitee",
                    collapsible = TRUE,
                    plotOutput("CommPlot", height = 300))
                
                )), # End fluidRow
            
            fluidRow(
                column(width = 12,
                       
                box(title = "Common Issues Per Commitee (Top 10)",
                    collapsible = TRUE,
                    plotOutput("CommIssuePlot", height = 500), 
                    width = 12)
                )
                
            ), # End fluidRow
            
            
            
            fluidRow(
                column(10, offset = 1,
                       h2('Number of issues in each Commitee (only Top 10 Issues)'),
                      
                ) 
            ),
            
            
            fluidRow(
                
                # Dynamic valueBoxes
                valueBoxOutput("Com1"),
                
                valueBoxOutput("Com2"),
                
                valueBoxOutput("Com3"),
               br(),
                valueBoxOutput("Com4"),
                
                valueBoxOutput("Com5"),
                
                valueBoxOutput("Com6")
               
            )
            
    
            ) # End dashboardBody
    
)











# Define server logic required to draw a histogram
server <- function(input, output) {

    
    output$Top10Keys <- renderPlot({
        Top10Keys %>%
        dplyr::filter(Var1 %in% input$selectKeys) %>%
    
        ggplot( aes(x = Freq, 
                    y=reorder(Var1, +Freq), 
                    fill = Var1, 
                    color= Var1)) + 
            geom_bar(stat="identity") +
            scale_x_continuous(breaks=seq(0,800,100)) +
            geom_text(aes(label = Freq), hjust = 1.5, colour = "white") +
            xlab("Count of Issues") + 
            ylab("Issues") +
            theme_classic() + 
            theme(plot.title = element_text(hjust = 0.5, size = 15, face = "bold"), legend.position = "none")
    })
    
    
    output$CommPlot <- renderPlot({         #selectComm
        AllCommitee %>%
            dplyr::filter(CommiteeName %in% input$selectComm) %>%
    
            ggplot(aes(x = count, 
                       y=reorder(CommiteeName, +count), 
                       fill=CommiteeName, 
                       color=CommiteeName)) + 
            geom_bar(stat="identity") +
            scale_x_continuous(breaks=seq(0,1250,200)) +
            geom_text(aes(label = count), hjust = 1.5, colour = "white") +
            xlab("Count of Issues") + 
            ylab("Commitee Names") +
            theme_classic() + 
            theme(plot.title = element_text(hjust = 0.5, size = 15, face = "bold"), legend.position = "none")
    })
    
    
    
    output$CommIssuePlot <- renderPlot({
        C_data %>%       # Applying group_by & summarise
            dplyr::filter(Keywords %in% input$selectKeys & CommiteeName %in% input$selectComm) %>%
            group_by(CommiteeName,Keywords) %>%
            summarise(count = count(Keywords)$freq) %>%
            
            ggplot(aes(x = count, 
                       y=reorder(Keywords, +count), 
                       fill=CommiteeName)) + 
            geom_bar(position="stack", 
                     stat="identity") +
            scale_x_continuous(breaks=seq(0,800,100)) +
            # geom_text(aes(label = count),hjust = 1, colour = "white") +
            xlab("Count of Issues in each Commitee") + 
            ylab("Keywords") +
            theme_classic() + 
            theme(plot.title = element_text(hjust = 0.5, size = 15, face = "bold"))
    })
    
    ## Valid colors are: red, yellow, aqua, blue, light-blue, green, navy, teal, olive, lime, orange, fuchsia, purple, maroon, black.
    ## 


    
    output$Com1 <- renderValueBox({
        
        KeyCount5 = dplyr::filter(C_data, Keywords %in% input$selectKeys & CommiteeName == unique(C_data$CommiteeName)[5]) %>%
            group_by(CommiteeName,Keywords) %>%
            summarise(count = count(Keywords)$freq)
        
        valueBox(
            paste0(n_distinct(KeyCount5$Keywords), " Issues"), 
            unique(C_data$CommiteeName)[5], 
            icon = icon("list"),
            color = "red"
        )
    })
    
    
    
    output$Com2 <- renderValueBox({
        KeyCount1 = dplyr::filter(C_data, Keywords %in% input$selectKeys & CommiteeName == unique(C_data$CommiteeName)[1]) %>%
            group_by(CommiteeName,Keywords) %>%
            summarise(count = count(Keywords)$freq)
        
        valueBox(
            paste0(n_distinct(KeyCount1$Keywords), " Issues"), 
            unique(C_data$CommiteeName)[1], 
            icon = icon("list"),
            color = "orange"
        )
    })
    
    
    
    output$Com3 <- renderValueBox({
        
        KeyCount6 = dplyr::filter(C_data, Keywords %in% input$selectKeys & CommiteeName == unique(C_data$CommiteeName)[6]) %>%
            group_by(CommiteeName,Keywords) %>%
            summarise(count = count(Keywords)$freq)
        
        valueBox(
            paste0(n_distinct(KeyCount6$Keywords), " Issues"), 
            unique(C_data$CommiteeName)[6], 
            icon = icon("list"),
            color = "green"
        )
    })
    
    
    
    output$Com4 <- renderValueBox({
        KeyCount4 = dplyr::filter(C_data, Keywords %in% input$selectKeys & CommiteeName == unique(C_data$CommiteeName)[4]) %>%
            group_by(CommiteeName,Keywords) %>%
            summarise(count = count(Keywords)$freq)
        
        valueBox(
            paste0(n_distinct(KeyCount4$Keywords), " Issues"), 
            unique(C_data$CommiteeName)[4], 
            icon = icon("list"),
            color = "aqua"
        )
    })
    
    
    
    output$Com5 <- renderValueBox({
        KeyCount2 = dplyr::filter(C_data, Keywords %in% input$selectKeys & CommiteeName == unique(C_data$CommiteeName)[2]) %>%
            group_by(CommiteeName,Keywords) %>%
            summarise(count = count(Keywords)$freq)
        
        valueBox(
            paste0(n_distinct(KeyCount2$Keywords), " Issues"), 
            unique(C_data$CommiteeName)[2], 
            icon = icon("list"),
            color = "light-blue"
        )
    })

    
    
    output$Com6 <- renderValueBox({
        KeyCount3 = dplyr::filter(C_data, Keywords %in% input$selectKeys & CommiteeName == unique(C_data$CommiteeName)[3]) %>%
            group_by(CommiteeName,Keywords) %>%
            summarise(count = count(Keywords)$freq)
        
        valueBox(
            paste0(n_distinct(KeyCount3$Keywords), " Issues"), 
            unique(C_data$CommiteeName)[3], 
            icon = icon("list"),
            color = "maroon"
        )
    })


}










## Saving Workspace in the project directory
## 

getwd() # print the current working directory - cwd

# save the workspace to the file .RData in the cwd
save.image("Assignment 3 RShiny Application ALY6070 NeilMascarenhas.RData")


### The rsconnect package deploys applications to the shinyapps.io service. The rsconnect package is now hosted on CRAN. You can install it by running the R command 
### 


#if (!require(rsconnect)) install.packages('rsconnect')
#library("rsconnect") # After the rsconnect package has been installed, load it into your R session:




## The rsconnect package can be installed directly from CRAN. To make sure you have the latest version run following code in your R console

#rsconnect::setAccountInfo(name='mascarenhasneil', token='7C0C85DF0C06F70397F33D5C5ED2E188', secret='oioo+BMV3EjRsKNAVfbFhJHA/vN9pUdPe6rZvt6W')



# Once the rsconnect package has been configured, you're ready to deploy your first application.
# 

#rsconnect::deployApp()




# Run the application 
shinyApp(ui = ui, server = server)

