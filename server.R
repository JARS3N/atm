server <- function() {
  library(shiny)
  library(XML)
  library(R.utils)
  function(input, output, session) {
    observeEvent(input$upload,
                 {
                   atm::edit_atm(input$upload$datapath, 800)
                   print(input$upload$name)
                   output$dlfile <- downloadHandler(
                     filename = function() {
                       input$upload$name
                     },
                     content = function(file) {
                       file.copy(input$upload$datapath, file)
                     }

                   )

                 })
  }
}
