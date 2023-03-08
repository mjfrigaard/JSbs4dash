mod_title_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::textInput(
      inputId = ns("title_input"),
      label = "Plot title",
      placeholder = "Enter plot title"
    )
  )
}

mod_title_server <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    return(
      list(
        title = shiny::reactive({
          input$title_input
        })
      )
    )

  })
}


