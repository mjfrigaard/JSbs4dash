mod_title_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::textInput(
      inputId = ns("plot_title"),
      label = "Plot title",
      placeholder = "Enter plot title"
    )
  )
}

mod_title_server <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    return(
      list(
        "plot_title" = shiny::reactive({
          input$plot_title
        })
      )
    )
  })
}



    # grph_title <- shiny::reactive({
    #   plot_title <- tools::toTitleCase(graph_inputs$plot_title())
    # })
    #
    #   layer_aes() +
    #     ggplot2::labs(
    #       title = inputs()$plot_title,
    #       x = stringr::str_replace_all(tools::toTitleCase(inputs()$x), "_", " "),
    #       y = stringr::str_replace_all(tools::toTitleCase(inputs()$y), "_", " ")
    #     ) +
    #     ggplot2::theme_minimal() +
    #     ggplot2::theme(legend.position = "bottom")


