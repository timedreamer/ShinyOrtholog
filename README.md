## README

Author: Ji Huang

Date: 2024-02-05

A simple ortholog finding shiny app. The source was from Ji's OrthoFinder2 run.

The web interface is at [**https://jihuang.shinyapps.io/shinyortholog/**](https://jihuang.shinyapps.io/shinyortholog/){.uri}.

Very easy deployment steps to shinyapps.io

``` r
library(rsconnect)
rsconnect::setAccountInfo(name='jihuang', token='xyz', secret='xyz')
rsconnect::deployApp()
```
