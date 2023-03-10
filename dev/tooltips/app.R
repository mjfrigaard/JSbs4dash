library(shiny)
library(shinyBS)


# mod_tooltip_var_input_ui --------------------------------------------------
mod_tooltip_var_input_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::selectInput(
      inputId = ns("y"),
      label = "Y-axis:",
      choices = c(
        "IMDB rating" = "imdb_rating",
        "IMDB number of votes" = "imdb_num_votes",
        "Critics Score" = "critics_score",
        "Audience Score" = "audience_score",
        "Runtime" = "runtime"
      ),
      selected = "audience_score"
    ),
    # y tooltip ------------------------
    shinyBS::bsTooltip(ns("y"),
     "This variable will control the y-axis",
     options = list(container = "body")),
    shiny::selectInput(
      inputId = ns("x"),
      label = "X-axis:",
      choices = c(
        "IMDB rating" = "imdb_rating",
        "IMDB number of votes" = "imdb_num_votes",
        "Critics Score" = "critics_score",
        "Audience Score" = "audience_score",
        "Runtime" = "runtime"
      ),
      selected = "imdb_rating"
    ),
    # x tooltip ------------------------
    shinyBS::bsTooltip(ns("x"),
     "This variable will control the x-axis",
     options = list(container = "body")),
    shiny::selectInput(
      inputId = ns("z"),
      label = "Color by:",
      choices = c(
        "Title Type" = "title_type",
        "Genre" = "genre",
        "MPAA Rating" = "mpaa_rating",
        "Critics Rating" = "critics_rating",
        "Audience Rating" = "audience_rating"
      ),
      selected = "mpaa_rating"
    ),
    # color tooltip ------------------------
    shinyBS::bsTooltip(ns("z"),
     "This variable will control the point color",
     options = list(container = "body")),
    shiny::sliderInput(
      inputId = ns("alpha"),
      label = "Alpha:",
      min = 0, max = 1, step = 0.1,
      value = 0.5
    ),
    # color tooltip ------------------------
    shinyBS::bsTooltip(ns("alpha"),
     "This variable will control the point opacity",
     options = list(container = "body")),
    shiny::sliderInput(
      inputId = ns("size"),
      label = "Size:",
      min = 0, max = 5,
      value = 2
    ),
     # color tooltip ------------------------
    shinyBS::bsTooltip(ns("size"),
     "This variable will control the point size",
     options = list(container = "body")),
    shiny::textInput(
      inputId = ns("plot_title"),
      label = "Plot title",
      placeholder = "Enter plot title"
    ),
     # title tooltip ------------------------
    shinyBS::bsTooltip(ns("plot_title"),
     "Use this to enter the plot title",
     options = list(container = "body")),
  )
}

dev_ui <- function(request) {
  shiny::tagList(
    shiny::fluidPage(
      shiny::tags$h1("JSbs4dash:", code("tooltips")),
      shiny::sidebarLayout(
        shiny::sidebarPanel(
          # use mod_tooltip_var_input_ui -----
          mod_tooltip_var_input_ui("vars")
        ),
        shiny::mainPanel(
          # add shiny hex in www/
          shiny::tags$img(src = "shiny.png"),
          JSbs4dash::mod_plot_ui("plot")
        )
      )
    )
  )
}

dev_server <- function(input, output, session) {
  # Your application server logic
   selected_vars <- JSbs4dash::mod_var_input_server("vars")
   JSbs4dash::mod_plot_server("plot", var_inputs = selected_vars)
}

shinyApp(
 ui = dev_ui, server = dev_server)

