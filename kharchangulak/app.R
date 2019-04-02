
library(shiny)
#source(file = "/home/mahtab/R/kandinskys.R")
source(file = "/home/nautilus/Kharchang/kharchang/kandinsky.R")

ui <- fluidPage(
  
  headerPanel('From sound to kandinsky'),
  sidebarPanel(
    # Sidebar with 2 sliders
    sliderInput("step" ,"select batch size: (bigger batch size will get closer to gray)", min = 10 , max = 50 , step = 5, value = 30),
    sliderInput("sec" ,"slice:(the larger the interval, the more resource will require)", min=1 , max = 10, value = c(1,2))
  )
  
  #mainPanel(
  #show the painting
  #painting is the plot picture that is visible as output in the main panel and is reponsive
  #  plotOutput("painting")
  #)
  ,
  hr(),
  fluidPage(
    #column(10, verbatimTextOutput("step")),
    #column(10, verbatimTextOutput("sec")),
    column(5, plotOutput("kandi")),
    plotOutput("kandi.ts")
  )
  #mainPanel(plotOutput("kandi"))
)
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # You can access the value of the widget with input$slider1, e.g.
  #output$step <- renderPrint({ input$step})
  
  # You can access the values of the second widget with input$slider2, e.g.
  #output$sec <- renderPrint({ input$sec})
  output$kandi.ts <- renderPlot({KKK(slider1 = input$sec, step1 = input$step)})
  output$kandi <- renderPlot(Kandi(input$sec[1],input$sec[2]*input$step/9))
  
}

shinyApp(ui = ui, server = server)

