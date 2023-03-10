library(bs4Dash)
library(golem)
source("mod_base_vars.R")
source("mod_display_base.R")
source("mod_aes_vars.R")
source("mod_display_aes.R")
source("mod_title.R")
source("mod_display_title.R")


# UI ------------------------------------------------------------
ui <- bs4Dash::dashboardPage(
  # title = bs4Dash::bs4Jumbotron(title = "navbar",
  #     # span("navbar", style = "font-size:14.0pt")
  #   ),
  header = bs4Dash::dashboardHeader(
    title =
      bs4Dash::bs4DashBrand(
        title = span("navbar", style = "font-size:14.0pt"),
        href = "https://github.com/RinteRface/bs4Dash/issues/108#issuecomment-772101031"
      ),
    shiny::div(
      JSbs4dash::bs4DNavbarMenu(
        JSbs4dash::bs4DNavbarTab(tabName = "p1", "Select Variables"),
        JSbs4dash::bs4DNavbarTab(tabName = "p2", "Customize points"),
        JSbs4dash::bs4DNavbarTab(tabName = "p3", "Add title")
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
            ),
            # put in UI ----
            bs4Dash::box(
              icon = shiny::icon("robot"),
              width = 12,
              title =
                shiny::tags$p(
                  tags$code("p1"),
                  tags$code("values")
                ),
              collapsible = TRUE,
              collapsed = TRUE,
              shiny::fluidRow(
                shiny::column(
                  width = 12,
                  shiny::verbatimTextOutput("p1")
                )
              )
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
            title = "Graph title",
            width = 12,
            shiny::column(
              width = 12,
              mod_title_ui(id = "title_input")
            ),
            shiny::column(
              width = 12,
              mod_display_title_ui(id = "display_p3")
            )
          )
        )
      )
    )
  ),
  controlbar = bs4Dash::dashboardControlbar()
)

# server --------------------------------------------------------

server <- function(input, output) {
  # put in server ----
  output$p1 <- shiny::renderPrint({
    vals <- shiny::reactiveValuesToList(
      x = input, all.names = TRUE
    )
    print(vals)
  })

  base_vars <- mod_base_vars_server("graph_inputs")

  base_obj <- mod_display_base_server(
    id = "display_p1",
    graph_inputs = base_vars
  )

  aes_vars <- mod_aes_vars_server(id = "aes_inputs")

  aes_obj <- mod_display_aes_server(
    id = "display_p2",
    graph_inputs = aes_vars,
    gg_obj = base_obj
  )

  plot_title <- mod_title_server("title_input")

  mod_display_title_server(
    id = "display_p3",
    title_text = plot_title,
    graph_inputs = base_vars,
    gg_obj = aes_obj
  )
}

shiny::shinyApp(ui = ui, server = server)
