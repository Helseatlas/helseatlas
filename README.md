[![Status](https://travis-ci.org/Helseatlas/shinymap.svg?branch=master)](https://travis-ci.org/Helseatlas/shinymap/builds)[![Coverage Status](https://img.shields.io/codecov/c/github/Helseatlas/shinymap/master.svg)](https://codecov.io/github/Helseatlas/shinymap?branch=master)

# Shinymap

R-package to be used to produce maps on the helseatlas.no web page.

A working document on the process of going from IA to RShiny can be found [here](https://www.overleaf.com/read/qknnddwjnpfn) (read only).

## How to install the package

```
devtools::install_github("Helseatlas/shinymap")
```

You have the run the following command first if you are behind Helse Nord proxy:

```
httr::set_config(httr::use_proxy(url="http://www-proxy.helsenord.no", port=8080))
```

## How to run and change the package locally

- Download the package from github

```
git clone git@github.com:helseatlas/shinymap
```

- Open the `shinymap` folder in *RStudio*
- Install required packages, if not installed already. For instance with the following lines:

```
  if ("shiny" %in% rownames(installed.packages()) == FALSE) install.packages("shiny")
  if ("shinythemes" %in% rownames(installed.packages()) == FALSE) install.packages("shinythemes")
  if ("rsconnect" %in% rownames(installed.packages()) == FALSE) install.packages("rsconnect")
  if ("ggplot2" %in% rownames(installed.packages()) == FALSE) install.packages("ggplot2")
  if ("leaflet" %in% rownames(installed.packages()) == FALSE) install.packages("leaflet")
  if ("magrittr" %in% rownames(installed.packages()) == FALSE) install.packages("magrittr")
  if ("dplyr" %in% rownames(installed.packages()) == FALSE) install.packages("dplyr")
  if ("ggthemes" %in% rownames(installed.packages()) == FALSE) install.packages("ggthemes")
  if ("tibble" %in% rownames(installed.packages()) == FALSE) install.packages("tibble")
  if ("jsonlite" %in% rownames(installed.packages()) == FALSE) install.packages("jsonlite")
  if ("maps" %in% rownames(installed.packages()) == FALSE) install.packages("maps")
  if ("testthat" %in% rownames(installed.packages()) == FALSE) install.packages("testthat")
  if ("covr" %in% rownames(installed.packages()) == FALSE) install.packages("covr")
```

- Build the package (`Ctrl+Shift+B` or &#8984;-&#8679;-B). 
- Run the app, either by open the file `inst/app/server.R` and push the button or

```
shiny::runApp('inst/app')
```

## How to use the package

### Input data

The data frame should contain the following columns:

```
area
level1
(level2)
(level3)
rate
numerater
name_numerater
denominator
name_denominator
ref
href
metatext
```


# Launch locally

```
shinymap::launch_application(datasett = <datasett>)
```

# Submit to shinyapp.io

```
shinymap::submit_application(datasett = <r data frame>, name = <appName>, shiny_account = <publishing account>)
```



