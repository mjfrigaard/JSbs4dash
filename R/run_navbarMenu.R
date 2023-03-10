#' Create navbarMenu (bs4Dash)
#'
#' @return shiny app (with navbarMenu)
#' @export navbarMenuApp
#'
#' @importFrom bs4Dash dashboardPage
#' @importFrom bs4Dash dashboardHeader
#' @importFrom shiny div
#' @importFrom bs4Dash dashboardBody
#' @importFrom bs4Dash dashboardSidebar
#' @importFrom bs4Dash dashboardControlbar
#'
#' @examples
#' require(JSbs4dash)
#' # navbarMenuApp()
navbarMenuApp <- function() {
    ui <- bs4Dash::dashboardPage(
        header = bs4Dash::dashboardHeader(title = "navbar",
          shiny::div(
            JSbs4dash::bs4DNavbarMenu(
                JSbs4dash::bs4DNavbarTab(tabName = "Tab1", "Tab 1"),
                JSbs4dash::bs4DNavbarTab(tabName = "Tab2", "Tab 2")
            )
          )
        ),
        body = bs4Dash::dashboardBody(
            tabItems(
                tabItem(
                    tabName = "Tab1",
                    "Tab 1"
                ),
                tabItem(
                    tabName = "Tab2",
                    "Tab 2"
                )
            )
        ),

        sidebar = bs4Dash::dashboardSidebar(
          disable = FALSE),

        controlbar = bs4Dash::dashboardControlbar(
          disable = FALSE)
    )

    server <- function(input, output, session) {

    }
    shiny::shinyApp(ui, server)
}



