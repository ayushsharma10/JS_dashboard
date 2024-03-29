#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#setwd("/Users/randhirsingh/JS_dashboard")
JS360view1 <- read.csv("JS360view1.csv", header=TRUE, sep=",",
                       colClasses = c('character','integer','character','character','character','character'))
str(JS360view1)


library(shiny)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Job Seeker 360 View"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("email_Id",
                        "Enter Email Id", choices = JS360view1$email_Id)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           tableOutput("JS_Data")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$JS_Data <- renderTable({
        
       email_IDfilter <- subset(JS360view1, JS360view1$email_Id == input$email_Id)

    })
}

# Run the application 
shinyApp(ui = ui, server = server)

