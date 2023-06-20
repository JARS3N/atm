

ui <- function() {
  library(shiny)

  fluidPage(
    titlePanel("Edit Atmospheric Pressure for XFLR or ASYR files"),

    mainPanel(
      numericInput("num", label = "new atm mmHg", value = 760),
      fileInput("upload", "Upload a file"),
      downloadButton("dlfile", "Download")
    )
  )
}
