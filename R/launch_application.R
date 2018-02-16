#' Launch the application locally
#' @export
launch_application <- function(){
  shiny::runApp(appDir = system.file("app", package = "shinymap"))
}

#' Submit the application to shinyapp.io
#' @export
submit_application <- function(){
  rsconnect::deployApp(appDir = system.file("app", package = "shinymap"))
}

