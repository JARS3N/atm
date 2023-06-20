server <- function() {
  library(shiny)
  library(XML)
  library(R.utils)
  function(input, output, session) {
    observeEvent(input$upload,
                 {
                  
                   print(input$upload$name)
                   output$dlfile <- downloadHandler(
                     filename = function() {
                       input$upload$name
                     },
                     content = function(file) {
                       atm::edit_atm(input$upload$datapath, input$num)
                       file.copy(input$upload$datapath, file)
                     }

                   )

                 })
  }
}
