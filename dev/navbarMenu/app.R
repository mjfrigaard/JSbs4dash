library(shiny)
library(bs4Dash)
library(JSbs4dash)

shinyApp(
    ui = dashboardPage(
        header = dashboardHeader(title = "navbar",
          shiny::div(
            navbarMenu(
                navbarTab(tabName = "Tab1", "Tab 1"),
                navbarTab(tabName = "Tab2", "Tab 2")
            )
          )
        ),
        body = dashboardBody(
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
        sidebar = dashboardSidebar(
          disable = FALSE)
    ),
    server = function(input, output, session) {

    }
)
