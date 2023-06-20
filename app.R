app<-function(){
  shiny::shinyApp(atm::ui(),atm::server())
}
