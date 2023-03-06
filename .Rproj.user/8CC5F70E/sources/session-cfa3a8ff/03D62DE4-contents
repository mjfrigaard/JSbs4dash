#' Create a bs4Dash template
#'
#' @return bs4Dash app
#' @export bs4_app
#'
#' @importFrom purrr map
#' @importFrom rstudioapi insertText
#'
bs4_app <- function() {
  bs4_app_code <- c(
      "library(shiny)\nlibrary(bs4Dash)\n\nui <- bs4Dash::dashboardPage(title = '<NAME>',\n\t\theader = bs4Dash::dashboardHeader(\n\t\t\ttitle = bs4Dash::dashboardBrand(\n\t\t\ttitle = 'bs4Dash template',\n\t\t\tcolor = 'primary'\n\t\t\t\t)\n\t\t\t),\n\tsidebar = bs4Dash::dashboardSidebar(),\n\t\tbody = bs4Dash::dashboardBody(\n\t\t\tshiny::fluidRow(\n\t\t\t\tbs4Dash::sortable(\n\t\t\t\tbs4Dash::box(title = 'box 1', width = 12)\n\t\t\t)\n\t\t),\n\t\t\tshiny::fluidRow(\n\t\t\t\tbs4Dash::sortable(\n\t\t\t\tbs4Dash::box(title = 'box 2', width = 12)\n\t\t\t)\n\t\t\t)\n\t\t),\n\tcontrolbar = bs4Dash::dashboardControlbar()\n\t)\nserver <- function(input, output) {\n\t\t}\n\nshiny::shinyApp(ui = ui, server = server)\n")
  purrr::map(.x = bs4_app_code, .f = rstudioapi::insertText)
}
