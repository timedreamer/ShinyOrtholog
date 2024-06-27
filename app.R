library(shiny)
library(here)
library(DT)

# Assuming your data is in a DataFrame called 'gene_data'
# Read your data here, e.g., gene_data <- read.csv("your_data.csv")

# data <- read_tsv(here("data", "orthology", "zma__v__ath.tsv"))
# saveRDS(data, here("data", "orthology", "zma__v__ath.RDS"))

data <- readRDS(here("zma__v__ath.RDS"))


ui <- fluidPage(
    titlePanel("Gene ID Search in Orthogroups (Ath-Zma)"),
    sidebarLayout(
        sidebarPanel(
            textInput("gene_id", "Enter Gene Ath or Zma IDs (separated by commas)"),
            actionButton("search", "Search")
        ),
        mainPanel(
            DTOutput("results")
        )
    )
)

server <- function(input, output) {
    result <- eventReactive(input$search, {
        req(input$gene_id)
        searchTerms <- strsplit(input$gene_id, ",\\s*")[[1]]
        matches <- sapply(searchTerms, function(term) {
            grepl(term, data$zma) | grepl(term, data$ath)
        })
        data[rowSums(matches) > 0, ]
    })
    
    output$results <- renderDT({
        result()
    }, options = list(pageLength = 5))
}

shinyApp(ui, server)
