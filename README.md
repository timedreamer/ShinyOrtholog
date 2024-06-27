## README

Author: Ji Huang

Date: 2024-02-05

Update: 2024-06-26

A simple ortholog finding shiny app. The source was from Ji's OrthoFinder2 run.

The web interface is at **https://jihuang.shinyapps.io/shinyortholog/**

Very easy deployment steps to shinyapps.io

``` r
library(rsconnect)
rsconnect::setAccountInfo(name='jihuang', token='xyz', secret='xyz')
rsconnect::deployApp()
```

I also use the same data to build a streamlit app in python. See https://github.com/timedreamer/streamlit_OF2_ath_zma.