library(shiny)
library(bs4Dash)
library(fresh)

navbarTab <- function(tabName, ..., icon = NULL) {
  tags$li(
    class = "nav-item",
    tags$a(
      class = "nav-link",
      id = paste0("tab-", tabName),
      href = paste0("#shiny-tab-", tabName),
      `data-toggle` = "tab",
      `data-value` = tabName,
      icon,
      tags$p(...)
    )
  )
}


navbarMenu <- function(..., id = NULL) {
  if (is.null(id)) id <- paste0("tabs_", round(stats::runif(1, min = 0, max = 1e9)))

  tags$ul(
    class = "navbar-nav dropdown sidebar-menu",
    role = "menu",
    ...,
    div(
      id = id,
      class = "sidebarMenuSelectedTabItem",
      `data-value` = "null",
    )
  )
}

shinyApp(
  ui = dashboardPage(
    freshTheme = create_theme(
      bs4dash_vars("navbar-light-active-color" = "purple")
    ),
    header = dashboardHeader(
      navbarMenu(
        navbarTab(tabName = "Tab1", "Tab 1"),
        navbarTab(tabName = "Tab2", "Tab 2")
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
    sidebar = dashboardSidebar()
  ),
  server = function(input, output, session) {

  }
)
