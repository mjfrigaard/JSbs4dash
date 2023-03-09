#' Create Navbar Menu (in bs4Dash)
#'
#' @param ... inherited arguments
#' @param id id for menu
#'
#' @description This is a standard navbar menu in bs4Dash covered in this
#'     GitHub comment/issue:
#'     https://github.com/RinteRface/bs4Dash/issues/108#issuecomment-772101031
#'
#'
#' @return navbar menu (HTML)
#' @export bs4DNavbarMenu
#'
#' @importFrom stats runif
#' @importFrom shiny tags div
#'
#' @examples
#' require(bs4Dash)
#'   ui <- dashboardPage(
#'     header = dashboardHeader(
#'     bs4DNavbarMenu(
#'         bs4DNavbarTab(tabName = "Tab1", "Tab 1"),
#'         bs4DNavbarTab(tabName = "Tab2", "Tab 2")
#'         )
#'        ),
#'    body = dashboardBody(
#'     tabItems(
#'       tabItem(
#'         tabName = "Tab1",
#'                   "Tab 1"
#'                   ),
#'          tabItem(
#'          tabName = "Tab2",
#'                   "Tab 2"
#'              )
#'          )
#'      ),
#'  sidebar = dashboardSidebar(
#'       disable = TRUE)
#'   )
#'  server <- function(input, output, session) {
#'
#'  }
#' # ()shinyApp(ui = ui, server = server)
bs4DNavbarMenu <- function(..., id = NULL) {

    if (is.null(id)) {
      id <- paste0("tabs_", round(stats::runif(1, min = 0, max = 1e9)))
    }

    shiny::tags$ul(
        class = "navbar-nav dropdown sidebar-menu",
        role = "menu",
        ...,
        shiny::div(
            id = id,
            class = "sidebarMenuSelectedTabItem",
            `data-value` = "null",

        )
    )
}
