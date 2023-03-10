#' Create tooltip app
#'
#' @return tooltip app (shinyBS)
#' @export run_toolTip
#'
#' @importFrom shiny tagList fluidPage tags
#' @importFrom shiny sidebarLayout sidebarPanel mainPanel
#' @importFrom shiny shinyApp
#'
#' @examples
#' require(JSbs4dash)
#' # run_toolTip()
run_toolTip <- function() {
  ui <- shiny::tagList(
    shiny::fluidPage(
      shiny::tags$h1("JSbs4dash:", code("tooltips")),
      shiny::sidebarLayout(
        shiny::sidebarPanel(
          # use mod_tooltip_var_input_ui -----
          mod_tooltip_var_input_ui("vars")
        ),
        shiny::mainPanel(
          # add shiny hex in www/
          shiny::tags$img(src = "https://raw.githubusercontent.com/mjfrigaard/JSbs4dash/main/inst/app/www/shiny.png"),
          JSbs4dash::mod_plot_ui("plot")
        )
      )
    )
  )

server <- function(input, output, session) {
  # Your application server logic
   selected_vars <- JSbs4dash::mod_var_input_server("vars")

   JSbs4dash::mod_plot_server("plot", var_inputs = selected_vars)
}
shiny::shinyApp(
 ui = ui, server = server)
}




