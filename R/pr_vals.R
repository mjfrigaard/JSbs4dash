#' Print reactive values
#'
#' @param id namespace id
#'
#' @return code for UI and server components
#' @export prnt_rvals
#'
#' @importFrom rstudioapi insertText
#' @importFrom glue glue
#'
#' @examples
#' # prnt_rvals("dev")
prnt_rvals <- function(id) {
  ui <- "\n\n# put in UI ----
          shiny::fluidRow(
            shiny::column(width = 12,
              shiny::verbatimTextOutput(
                shiny::NS(namespace = id, id = '{id}'))
                  )
                )"
  server <- "\n\n# put in server ----
              output$dev <- shiny::renderPrint({{
                vals <- shiny::reactiveValuesToList(x = input, all.names = TRUE)
                  print(vals)
                }})\n\n"
  rstudioapi::insertText(glue::glue(ui, server))
}





