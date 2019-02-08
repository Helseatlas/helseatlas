#' Launch the application locally
#'
#' @param datasett The data set to be loaded into the application
#' @param language The language of the atlas ("en" or "no")
#' @param title The title of the atlas
#'
#' @export
launch_app <- function(datasett = NULL, language = NULL, title = NULL){
  if (is.null(datasett)){
    datasett <- get("kols")
  }
  shinydir <- create_appDir(healthatlas_data = datasett, language = language, webpage_title = title)
  shiny::runApp(appDir = shinydir)
}


#' Submit the application to shinyapp.io
#'
#' @param datasett The data set file (.RData) to be loaded into the application.
#' The absolute path has to be given
#' @param name The appName of the deployed shiny application (default = "experimental")
#' @param HNproxy If TRUE: deploy app through proxy
#' @param shiny_account Which shiny account on shinyapps.io (default = "skde")
#' @param language The language of the atlas ("en" or "no")
#' @param title The title of the atlas
#'
#' @export
submit_app <- function(datasett = NULL, name = "experimental", HNproxy = FALSE, shiny_account = "skde", language = NULL, title = NULL){
  if (HNproxy){
    options(RCurlOptions = list(proxy = "http://www-proxy.helsenord.no:8080"))
    options(shinyapps.http = "rcurl")
  }
  shinydir <- create_appDir(healthatlas_data = datasett, language = language, webpage_title = title)
  rsconnect::deployApp(appDir = shinydir, appName = name, account = shiny_account)
}

#' Create an appDir for shiny::runApp and rsconnect::deployApp
#'
#' Create a directory in tempdir() where the installed version of
#' shinymap package is copied and the data is saved.
#' This directory, with its content, will be deployd to or ran by shiny.
#'
#' @param healthatlas_data The data to be saved in the directory, to be used by the app
#' @param language The language of the atlas ("en" or "no")
#' @param webpage_title The title of the atlas
#'
#' @return The created directory
#'
create_appDir <- function(healthatlas_data = NULL, language = NULL, webpage_title = NULL){
  # Name the directory
  tmpshinydir <- paste0(tempdir(),"/shiny")
  # Delete old content in directory
  unlink(tmpshinydir, recursive = TRUE, force = TRUE)
  # Create main directory
  dir.create(tmpshinydir)
  # Copy the installed version of the shinymap package to the directory
  file.copy(system.file("app", package = "shinymap"), tmpshinydir, recursive = TRUE)
  # Create data folder
  dir.create(paste0(tmpshinydir, "/app/data"))
  # Save the data to a .RData file
  save(healthatlas_data, language, webpage_title, file = paste0(tmpshinydir,"/app/data/data.RData"))
  # Return the name of the main directory
  return(paste0(tmpshinydir, "/app"))
}

