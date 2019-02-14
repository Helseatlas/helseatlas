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
- Install required packages, if not installed already. This can be done by `devtools::install_github("Helseatlas/shinymap")`. This will install the shinymap package from github and at the same time install all the required packages.
- Build the package (Ctrl+Shift+B on Windows/Linux or &#8984;-&#8679;-B on Mac). 
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

# Submit to shinyapps.io

Make sure that the version of shinymap installed and active in your Rsession is installed directly from github,
since it also has to be installed on shinyapps.io. Also remember to connect to your shinyapps.io profile. Then run the command

```
shinymap::launch_application(datasett = <r data frame>, publish_app = TRUE, name = <appName>, shiny_account = <publishing account>)
```



