mod_aes_vars_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(
        width = 6,
        shiny::sliderInput(
          inputId = ns("alpha"),
          label = "Alpha:",
          min = 0,
          max = 1,
          step = 0.01,
          value = 0.3
        )
      ),
      shiny::column(
        width = 6,
        shiny::sliderInput(
          inputId = ns("size"),
          label = "Size:",
          min = 0,
          max = 5,
          step = 0.25,
          value = 2.25
        )
      )
    )
  )
}

mod_aes_vars_server <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    return(
      list(
        alpha = shiny::reactive({
          input$alpha
        }),
        size = shiny::reactive({
          input$size
        })
      )
    )
  })
}
