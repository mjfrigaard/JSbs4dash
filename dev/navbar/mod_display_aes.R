plot_scatter_aes <- function(gg_obj, alpha_var, size_var) {
  gg_obj +
    ggplot2::geom_point(alpha = alpha_var, size = size_var)

}

mod_display_aes_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(
        width = 8, offset = 2,
        shiny::plotOutput(outputId = ns("scatterplot")))),
    shiny::fluidRow(
      shiny::column(width = 12,
        shiny::tags$code("dev_vals"),
        shiny::verbatimTextOutput(ns("dev_vals"))
      )
    )
  )
}

mod_display_aes_server <- function(id, graph_inputs, gg_obj) {

  shiny::moduleServer(id, function(input, output, session) {

      movies <- JSbs4dash::movies

    layer_aes <- shiny::reactive({
      plot_scatter_aes(
        gg_obj = gg_obj$gg_obj(),
        alpha_var = graph_inputs$alpha(),
        size_var = graph_inputs$size())
    })

    output$dev_vals <- renderPrint({
      class(
        layer_aes()
      )
    })

    output$scatterplot <- renderPlot({
      layer_aes()
    }) |>
      bindEvent(layer_aes())

    return(
      list(
        gg_obj = shiny::reactive({
          plot_scatter_aes(
            gg_obj = gg_obj$gg_obj(),
            alpha_var = graph_inputs$alpha(),
            size_var = graph_inputs$size())
        })
      )
    )

  })
}
