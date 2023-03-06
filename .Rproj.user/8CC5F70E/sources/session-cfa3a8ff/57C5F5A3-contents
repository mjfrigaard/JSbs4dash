library(bs4Dash)
library(golem)

# UI ---------------------------------------------------------------------
ui <- bs4Dash::dashboardPage(
  title = "<NAME>",
  header = dashboardHeader(
  rightUi = tags$li(
    class = "navbar-collapse collapse dropdown",
    tags$ul(
      class = "nav navbar-nav sidebar-menu",
      bs4SidebarMenuItem(
        text = "Page 1",
        tabName = "p1",
        selected = TRUE
      ),
      bs4SidebarMenuItem(
        text = "Page 2",
        tabName = "p2"
      ),
      bs4SidebarMenuItem(
        text = "Page 3",
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
            bs4Dash::box(title = "Page 1: static image",
              width = 12,
              shiny::tags$img(src = "www/shiny.png")
              )
          )
        )
      ),
      bs4Dash::tabItem(
        tabName = "p2",
        shiny::fluidRow(
          bs4Dash::sortable(
            bs4Dash::box(
              title = "Page 2: modules",
              width = 12,
              shiny::column(width = 4, offset = 4,
                mod_var_input_ui("vars")),
              shiny::column(width = 12,
                mod_plot_ui("plot"))
              )
          )
        )
      ),
      bs4Dash::tabItem(tabName = "p3",
        shiny::fluidRow(
          bs4Dash::box(title = "Page 3: empty box", width = 12
              )
        )
        )
    )
  ),
  controlbar = bs4Dash::dashboardControlbar()
)

# server ------------------------------------------------------------------

server <- function(input, output) {
  # Your application server logic
   selected_vars <- mod_var_input_server("vars")
   mod_plot_server("plot", var_inputs = selected_vars)
}

shiny::shinyApp(ui = ui, server = server)
