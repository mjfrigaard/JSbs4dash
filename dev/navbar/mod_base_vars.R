mod_base_vars_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(
        width = 4,
        shiny::selectInput(
          inputId = ns("y"),
          label = "Y-axis:",
          choices = c(
            "IMDB rating" = "imdb_rating",
            "IMDB number of votes" = "imdb_num_votes",
            "Critics Score" = "critics_score",
            "Audience Score" = "audience_score",
            "Runtime" = "runtime"
          ),
          selected = "audience_score"
        )
      ),
      shiny::column(
        width = 4,
        shiny::selectInput(
          inputId = ns("x"),
          label = "X-axis:",
          choices = c(
            "IMDB rating" = "imdb_rating",
            "IMDB number of votes" = "imdb_num_votes",
            "Critics Score" = "critics_score",
            "Audience Score" = "audience_score",
            "Runtime" = "runtime"
          ),
          selected = "imdb_rating"
        )
      ),
      shiny::column(
        width = 4,
        shiny::selectInput(
          inputId = ns("z"),
          label = "Color by:",
          choices = c(
            "Title Type" = "title_type",
            "Genre" = "genre",
            "MPAA Rating" = "mpaa_rating",
            "Critics Rating" = "critics_rating",
            "Audience Rating" = "audience_rating"
          ),
          selected = "genre"
        )
      )
    ),
    # put in UI ----
      bs4Dash::box(icon = shiny::icon('robot'),
        width = 12,
        title =
          shiny::tags$p(tags$code('base'),
            tags$code('inputs')),
        collapsible = TRUE,
        collapsed = TRUE,
        shiny::fluidRow(
          shiny::column(
            width = 12,
          shiny::verbatimTextOutput(
            outputId = shiny::NS(namespace = id, id = 'base'))
          )
        )
      )
  )
}

mod_base_vars_server <- function(id) {

  shiny::moduleServer(id, function(input, output, session) {

    output$base <- shiny::renderPrint({
      vals <- shiny::reactiveValuesToList(
        x = input, all.names = TRUE
      )
      print(vals)
    })

    return(
      list(
        x = shiny::reactive({
          req(input$x)
          input$x
        }),
        y = shiny::reactive({
          req(input$y)
          input$y
        }),
        z = shiny::reactive({
          req(input$z)
          input$z
        })
      )
    )
  })
}
