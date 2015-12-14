library(shiny)

# Define the overall UI
shinyUI(
  fluidPage(
    titlePanel("Number of Errors by Staff ID"),
    
    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(4, 
             selectInput("center", 
                         "Center:", 
                         c("All", 
                           unique(as.character(errors.by.id$Center))))
      ),
      column(4, 
             selectInput("staff.id", 
                         "Staff ID Number:", 
                         c("All", 
                           unique(as.character(errors.by.id$Staff_ID))))
      ),
      column(4, 
             selectInput("num.years", 
                         "Number of Year since Training:", 
                         c("All", 
                           unique(as.character(errors.by.id$Years_Since_Training))))
      ),
      column(4, 
             selectInput("num.errors", 
                         "Number of Errors:", 
                         c("All", 
                           unique(as.character(errors.by.id$Number_Errors))))
    ),
    # Create a new row for the table.
    fluidRow(
      dataTableOutput(outputId="table")
    )    
  )  
)
)
