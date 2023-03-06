#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  shiny::tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    shiny::fluidPage(
      shiny::tags$h1("JSbs4dash"),
      shiny::sidebarLayout(
        shiny::sidebarPanel(
          mod_var_input_ui("vars")
        ),
        shiny::mainPanel(
          # add shiny hex in www/
          shiny::tags$img(src = "www/shiny.png"),
          mod_plot_ui("plot"),
          # add golem hex (in www/images/)
          shiny::fluidRow(
            shiny::tags$em(shiny::tags$h4(
              "Brought to you by: ",
              shiny::tags$img(src = "www/images/golem-hex.png")
            ))
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "JSbs4dash"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
