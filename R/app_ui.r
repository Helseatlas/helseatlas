#' Shiny UI
#'
#' @return user interface
#' @export
app_ui <- function() {
  shiny::fluidPage(theme = shinythemes::shinytheme("cerulean"),
                   shinyalert::useShinyalert(),
                   shiny::titlePanel(shiny::tags$head(
                     shiny::tags$link(rel = "icon", type = "image/png", href = "www/hn.png"),
                     shiny::tags$title("Helseatlas"),
                     shiny::tags$link(rel = "stylesheet", type = "text/css", href = "www/custom.css")
                  )),
                  shiny::fluidRow(
                    shiny::column(8,
                                  shiny::uiOutput("title")
                    ),
                    shiny::column(1, offset = 3,
                                  shiny::uiOutput("pick_language")
                    )
                  ),
                  shiny::fluidRow(
                    shiny::column(3,
                                  shiny::uiOutput("pick_atlas"),
                                  shiny::uiOutput("pick_level1"),
                                  shiny::uiOutput("pick_level2"),
                                  shiny::uiOutput("pick_level3"),
                                  shiny::uiOutput("app_info"),
                                  shiny::uiOutput("git_version")
                    ),
                    shiny::column(9,
                                  shiny::tabsetPanel(
                                    shiny::tabPanel(shiny::uiOutput("title_map"), leaflet::leafletOutput("plot_map",
                                                                                                         height = 800
                                                                                                         )
                                                    ),
                                    shiny::tabPanel(shiny::uiOutput("title_hist"), shiny::plotOutput("plot_histogram")),
                                    shiny::tabPanel(shiny::uiOutput("title_table"), shiny::tableOutput("make_table"))
                           ))
                    ))
}
