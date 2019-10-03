[![Status](https://travis-ci.org/Helseatlas/shinymap.svg?branch=master)](https://travis-ci.org/Helseatlas/shinymap/builds)[![Coverage Status](https://img.shields.io/codecov/c/github/Helseatlas/shinymap/master.svg)](https://codecov.io/github/Helseatlas/shinymap?branch=master)
[![Doc](https://img.shields.io/badge/Doc--grey.svg)](https://helseatlas.github.io/shinymap/)

# Shinymap

R-package to be used to produce maps on the [helseatlas.no](https://helseatlas.no/) web page. Commits to the `master` branch will deploy to and update https://skde.shinyapps.io/helseatlas/

## How to install the package

```r
# Install the data package
devtools::install_github("Helseatlas/data")
# Install the maps package
devtools::install_github("Helseatlas/kart")
# Install the shinymap package
devtools::install_github("Helseatlas/shinymap")
```

### Install the package behind a proxy

If you are behind a proxy, you have to run the following commands before the `devtools::install_github`-commands:

```r
Sys.setenv(http_proxy="your.proxy.url:port")
Sys.setenv(https_proxy="your.proxy.url:port")
```

If you want to keep the proxy settings active when restarting R you can include the following in a file called `.Renviron`:

```bash
http_proxy="your.proxy.url:port"
https_proxy="your.proxy.url:port"
```

This file has to be saved in your `$HOME` directory, which typically is something like `c:/Users/<username>` on Windows.

## How to use the package

### Input data

The input to the shiny app is a data frame containing the following columns:

```
area
level1_name
(level2_name) # optional
(level3_name) # optional
value
numerator
numerator_name
denominator
denominator_name
```

The data from the previous health atlases can be found in the package `Helseatlas/data` on [github](https://github.com/Helseatlas/data).


### Launch locally

Run the command

```r
shinymap::launch_app()
```

### Submit to shinyapps.io

Run the command

```r
shinymap::launch_app(publish_app = TRUE, name = <appName>, shiny_account = <publishing account>)
```

Make sure that the version of `shinymap` installed and active in your Rsession is installed directly from github,
since it also has to be installed on *shinyapps.io*. Also remember to connect to your *shinyapps.io* profile. This can be done with the following command:

```r
rsconnect::setAccountInfo(name   = <shinyapps_name>,
                          token  = <shinyapps_token>,
                          secret = <shinyapps_secret>)
                          )
```

The `name`, `token` and `secret` can be found here: https://www.shinyapps.io/admin/#/tokens

## Run a local copy of the package

- Download the package from github

```bash
git clone git@github.com:helseatlas/shinymap
```

- Open the `shinymap` folder in *RStudio*
- Install required packages, if not installed already. This can be done by `devtools::install_github("Helseatlas/shinymap")`. This will install the shinymap package from github and at the same time install all the required packages.
- Build the package (Ctrl+Shift+B on Windows/Linux or &#8984;-&#8679;-B on Mac).
- Put some data in `healthatlas_data` and define some parametres

```r
healthatlas_data <- data::kols # or another dataset to use
healthatlas_map <- kart::kols # or another map to use
webpage_title <- "Helseatlas kols 2013-2015"
```

- Run the app, either by open the file `inst/app/server.R` and push the button or

```r
shiny::runApp('inst/app')
```

## Contribute

- [Fork me](https://github.com/Helseatlas/shinymap/fork)
- Clone your fork (replace `<username` with your github user name), create a branch and push it

```bash
git clone git@github.com:<username>/shinymap
cd shinymap
git checkout -b super-duper-idea
git push -u origin super-duper-idea
```

- Do your changes, commit your changes and push your changes (please remember to add tests and documentation!)

```
git add .
git commit -m 'My super duper idea'
git push
```

- Create a [pull request](https://github.com/Helseatlas/shinymap/compare) (PR).
- Wait for PR to me reviewed and tested.

### Test the package locally

The packages `testhat` and `shinytest` have to be installed if you want to test your local version of `shinymap`. In addition, you must install `PhantomJS`. The latter can be installed with the following R command:

```r
shinytest::installDependencies()
```

The package can then be tested by `devtools`:

```r
devtools::test()
```

### Update documentation

Run the following command to update the documentation in `man/`:

```r
roxygen2::roxygenise()
```

### File endings

This repository is mainly using LF (unix-style) line endings. If you are using Windows, please use `git config --global core.autocrlf false` if you want full control (take a look at [this post](https://stackoverflow.com/a/20653073)). Files can be converted from Windows-style file endings to unix-style by `dos2unix filename` in *git bash*. In *RStudio* you can go into `Tools/Global options/Code/Saving` and choose *Line ending conversion* to *None*.
