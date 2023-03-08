
plot_scatter_title <- function(gg_obj, x_var, y_var, title_text) {
      gg_obj +
        ggplot2::labs(
          title = title_text,
          x = stringr::str_replace_all(tools::toTitleCase(x_var), "_", " "),
          y = stringr::str_replace_all(tools::toTitleCase(y_var), "_", " ")
        ) +
        ggplot2::theme_minimal()

}

# mod_display_title_ui ----------------------------------------------------
mod_display_title_ui <- function(id) {
    ns <- shiny::NS(id)
    shiny::tagList(
    shiny::fluidRow(
      shiny::column(
        width = 8, offset = 2,
        shiny::plotOutput(outputId = ns("scatterplot")))),
    shiny::fluidRow(
      shiny::column(width = 12,
        shiny::tags$code("dev_vals"),
        shiny::verbatimTextOutput(NS(namespace = id, id = "dev_vals"))
      )
    )
  )
}

# mod_display_title_server ------------------------------------------------
mod_display_title_server <- function(id, graph_inputs, title_text, gg_obj) {

  shiny::moduleServer(id, function(input, output, session) {

   title_layer  <- reactive({
      graph_layers <- list(
        title_text = title_text$title(),
        x_var = graph_inputs$x(),
        y_var = graph_inputs$y(),
        layer_aes = gg_obj$gg_obj()
      )
      plot_scatter_title(
        title_text = graph_layers$title_text,
        x_var = graph_layers$x_var,
        y_var = graph_layers$y_var,
        gg_obj = graph_layers$layer_aes
      )
    })

    output$dev_vals <- renderPrint({
      vals <- reactiveValuesToList(x = input, all.names = TRUE)
      print(vals)
      cls_lst <- purrr::map(title_layer(), class)
      length(cls_lst)
    }) |>
      shiny::bindEvent(title_layer())

    output$scatterplot <- renderPlot({
          title_layer()
    }) |>
      shiny::bindEvent(title_layer())


  })
}
