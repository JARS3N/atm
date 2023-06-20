

ui <- function() {
  library(shiny)

  fluidPage(
    titlePanel("Edit Atmospheric Pressure for XFLR or ASYR files"),

    mainPanel(
      fileInput("upload", "Upload a file"),
      downloadButton("dlfile", "Download")
    )
  )
}
