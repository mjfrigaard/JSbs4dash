library(bs4Dash)
library(golem)
source("mod_base_vars.R")
source("mod_display_base.R")
source("mod_aes_vars.R")
source("mod_display_aes.R")
source("mod_title.R")


# UI ---------------------------------------------------------------------
ui <- bs4Dash::dashboardPage(
  title = code("navbar"),
  header = dashboardHeader(
    rightUi = tags$li(
      class = "navbar-collapse collapse dropdown",
      tags$ul(
        class = "nav navbar-nav sidebar-menu",
        bs4SidebarMenuItem(
          text = "Select variables",
          tabName = "p1",
          selected = TRUE
        ),
        bs4SidebarMenuItem(
          text = "Customize points",
          tabName = "p2"
        ),
        bs4SidebarMenuItem(
          text = "Add title",
          tabName = "p3"
        )
      )
    )
  ),
  sidebar = bs4Dash::dashboardSidebar(disable = TRUE),
  body = bs4Dash::dashboardBody(
    bs4Dash::tabItems(
      bs4Dash::tabItem(
        tabName = "p1",
        shiny::fluidRow(
          bs4Dash::sortable(
            bs4Dash::box(
              title = "Graph position inputs",
              width = 12,
              mod_base_vars_ui("graph_inputs"),
              shiny::tags$br(),
              mod_display_base_ui("display_p1")
            )
          )
        )
      ),
      bs4Dash::tabItem(
        tabName = "p2",
        shiny::fluidRow(
          bs4Dash::sortable(
            bs4Dash::box(
              title = "Graph aesthetics",
              width = 12,
              shiny::column(
                width = 12,
                mod_aes_vars_ui("aes_inputs")
              ),
              shiny::column(
                width = 12,
                mod_display_aes_ui("display_p2")
              )
            )
          )
        )
      ),
      bs4Dash::tabItem(
        tabName = "p3",
        shiny::fluidRow(
          bs4Dash::box(
            title = "Enter graph title",
            width = 12,
            mod_title_ui("title_inputs")
          )
        )
      )
    )
  ),
  controlbar = bs4Dash::dashboardControlbar()
)

# server ------------------------------------------------------------------

server <- function(input, output) {

  base_vars <- mod_base_vars_server("graph_inputs")

  base_obj <- mod_display_base_server(
                              id = "display_p1",
                              graph_inputs = base_vars)

  aes_vars <- mod_aes_vars_server(id = "aes_inputs")

  mod_display_aes_server("display_p2", aes_vars, base_obj)



}

shiny::shinyApp(ui = ui, server = server)
