library(shiny)

Immigration <- read.csv("errors.csv") 

staff.IDs <- Immigration$Staff.ID
centers <- Immigration$Center
years.since.training <- Immigration$Last.MKB.staff.training..yrs.
staff.centers <- data.frame(Staff.ID = staff.IDs, Center = centers, Years.Since = years.since.training)

results <- NULL 

for (i in unique(staff.centers$Staff.ID))
{
  unique.staff <-(sum(staff.centers$Staff.ID == i))
  unique.staff.center <- staff.centers$Center[i] 
  unique.staff.years.training <- staff.centers$Years.Since[i]
  results <- rbind(results, data.frame( Number_Errors = unique.staff, Center = unique.staff.center, Years_Since_Training = unique.staff.years.training))
}

unique.ID <- unique(staff.centers$Staff.ID)

unique.ID <-data.frame(Staff_ID = unique.ID)

errors.by.id <- cbind(unique.ID, results)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  output$table <- renderDataTable({
    data <- errors.by.id
    if (input$center != "All"){
      data <- data[data$Center == input$center,]
    }
    if (input$staff.id != "All"){
      data <- data[data$Staff_ID == input$staff.id,]
    }
    if (input$num.years != "All"){
      data <- data[data$Years_Since_Training == input$num.years,]
    }
    if (input$num.errors != "All"){
      data <- data[data$Number_Errros == input$num.errors,]
    }
    data
  })
  
})
