library(datasets)

library(shiny)

shinyServer(function(input, output) {
    
    modelType = reactive({paste("Miles Per Gallon (mpg)  with ", input$factortype)})
    
    modelTypeValue = reactive({paste("mpg ~", "as.integer(", input$factortype, ")")})
    
    modelfit = reactive({
        lm(as.formula(modelTypeValue()), data = mtcars)})
    
    output$caption = renderText({modelType()})
    
    output$modelfit = renderPrint({
        modelfit()
    })

    output$analysisPlot = renderPlot({ 
        with(mtcars, { 
            plot(as.formula(modelTypeValue()))
            abline(modelfit(), col = 2)})
    })
})
