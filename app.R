
library(shiny)
library(ggplot2)


data <- data.frame(
  StudyHours = c(1,2,3,4,5,6,7,8,9,10),
  Marks = c(35,40,50,55,65,70,75,85,90,95)
)


model <- lm(Marks ~ StudyHours, data = data)

ui <- fluidPage(
  
  titlePanel("📊 Student Performance Predictor"),
  
  sidebarLayout(
    
    sidebarPanel(
      numericInput("hours", "Enter Study Hours:", value = 5, min = 1, max = 10),
      actionButton("predict", "Predict")
    ),
    
    mainPanel(
      h3(textOutput("result")),
      plotOutput("plot")
    )
  )
)

server <- function(input, output) {
  
  observeEvent(input$predict, {
    
    predicted <- predict(model, data.frame(StudyHours = input$hours))
    
    output$result <- renderText({
      paste("Predicted Marks:", round(predicted, 2))
    })
    
    output$plot <- renderPlot({
      ggplot(data, aes(x = StudyHours, y = Marks)) +
        geom_point(size = 3) +
        geom_smooth(method = "lm", color = "blue") +
        geom_point(aes(x = input$hours, y = predicted), color = "red", size = 4) +
        ggtitle("Study Hours vs Marks") +
        xlab("Study Hours") +
        ylab("Marks")
    })
    
  })
}

shinyApp(ui = ui, server = server)