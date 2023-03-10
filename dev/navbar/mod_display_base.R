plot_scatter_xyz <- function(df, x_var, y_var, col_var) {
  movies <- JSbs4dash::movies
  ggplot2::ggplot(
    data = movies,
    ggplot2::aes(
      x = .data[[x_var]], y = .data[[y_var]],
      color = .data[[col_var]]
    )
  )
}

mod_display_base_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(
        width = 8, offset = 2,
        shiny::plotOutput(outputId = ns("scatterplot"))
      )
    ),
    shiny::fluidRow(
      shiny::column(
        width = 12,
        shiny::tags$br(),
        shiny::tags$blockquote(
          shiny::tags$em(
            shiny::tags$p(
              "The code for this application comes from the ",
              shiny::tags$a("Building web applications with Shiny",
                href = "https://rstudio-education.github.io/shiny-course/"
              ),
              "tutorial"
            )
          )
        )
      )
    ),
# put in UI ----
      bs4Dash::box(icon = shiny::icon('robot'),
        width = 12,
        title =
          shiny::tags$p(tags$code('display'),
            tags$code('values')),
        collapsible = TRUE,
        collapsed = TRUE,
        shiny::fluidRow(
          shiny::column(
            width = 12,
          shiny::verbatimTextOutput(
            outputId = shiny::NS(namespace = id, id = 'display'))
          )
        )
      )
  )
}

mod_display_base_server <- function(id, graph_inputs) {

  shiny::moduleServer(id, function(input, output, session) {

    movies <- JSbs4dash::movies

    base_layer <- shiny::reactive({
      grph_xyz <- tibble::tibble(
        x_var = graph_inputs$x(),
        y_var = graph_inputs$y(),
        col_var = graph_inputs$z()
      )

      base <- plot_scatter_xyz(
        df = grph_xyz,
        x_var = grph_xyz$x_var,
        y_var = grph_xyz$y_var,
        col_var = grph_xyz$col_var
      )
    })

    output$scatterplot <- renderPlot({
      base_layer() +
        ggplot2::geom_point()
    })

    return(
      list(
        gg_obj = shiny::reactive({
          grph_xyz <- tibble::tibble(
            x_var = graph_inputs$x(),
            y_var = graph_inputs$y(),
            col_var = graph_inputs$z()
          )

          base <- plot_scatter_xyz(
            df = grph_xyz,
            x_var = grph_xyz$x_var,
            y_var = grph_xyz$y_var,
            col_var = grph_xyz$col_var
          )
        })
        )
      )

    # put in server ----
    output$display <- shiny::renderPrint({
        vals <- shiny::reactiveValuesToList(
                  x = input, all.names = TRUE)
          print(vals)
        })

  })
}
