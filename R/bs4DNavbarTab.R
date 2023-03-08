#' Create Navbar Tab (in bs4Dash)
#'
#' @param tabName name of tab
#' @param ... ids for tab
#' @param icon fontawesome icon
#'
#' @return navbar tabs (HTML)
#' @export bs4DNavbarTab
#'
#' @importFrom shiny tags
#'
#' @examples
#' require(bs4Dash)
#'
#'   ui <- dashboardPage(
#'     header = dashboardHeader(
#'     navbarMenu(
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
bs4DNavbarTab <- function(tabName, ..., icon = NULL) {
    shiny::tags$li(
        class = "nav-item",
        shiny::tags$a(
            class = "nav-link",
            id = paste0("tab-", tabName),
            href = paste0("#shiny-tab-", tabName),
            `data-toggle` = "tab",
            `data-value` = tabName,
            icon,
            shiny::tags$p(...)
        )
    )
}
