library(shiny)

shinyUI(
    navbarPage("[mtcars-data] Miles Per Gallon (mpg) Dependencies",
        h3("Description"),
        h4("Here we will see how several factors affect Mile Per Gallon (mpg) for cars.",
           "This analysis is based on data collected from Motor Trend Magazine (1974)."),
       fluidPage(
            titlePanel("Affect on miles per gallon (mpg)"),
                radioButtons("factortype", "Select a factor to see it's affect on mpg:",
                    c("Number of cylinders" = "cyl",
                      "Gross horsepower" = "hp",
                      "Weight (lb)" = "wt",
                      "Transmission (automatic, manual) " = "am"
                    )
                )
        ),
        mainPanel(
            plotOutput("analysisPlot",width="auto"),
            verbatimTextOutput("modelfit")
        )
    )
)
