#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Load data from the arctic data center
data_url <- data_url <- "https://arcticdata.io/metacat/d1/mn/v2/object/urn%3Auuid%3A35ad7624-b159-4e29-a700-0c0770419941"
bg_chem <- read.csv(data_url, stringsAsFactors = F)
names(bg_chem)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Water Biogeochemistry"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("variable",
                        "Environmental Variables:",
                       choices = c("Salinity" = "CTD_Salinity",
                                   "Temperature" = "CTD_Temperature",
                                   "Nitrate" = "NO3",
                                   "Nitrite" = "NO2",
                                   "Phosphorous" = "P"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot"),
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        ggplot(bg_chem, mapping = aes_string(x = "CTD_Depth", y = input$variable)) +
            geom_point(size = 4, colour = "cadetblue") +
            theme_light()
        # generate bins based on input$bins from ui.R
})

}
# Run the application 
shinyApp(ui = ui, server = server)

# the fluid page- represents the webpage. You can write raw html or use the functions that shiny provides to run it. 
#' there are two parts the sidebarPanel and the mainPanel and whenever the window is re-sized keep the sidebar. The 
#' server side basically does anything you tell it to do in R. The output$distPlot is what is being sent back to the 
#' plotOutput. 
