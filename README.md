# Shinymap

R-package to produce maps of Norway with R Shiny

Will be used to produce maps on the helseatlas.no
web page. A working document on the process of going from IA to RShiny can be found [here](https://www.overleaf.com/read/qknnddwjnpfn) (read only).

## How to install the package

```
devtools::install_github("Helseatlas/shinymap")
```

If you are behind Helse Nord proxy, you have the run the following command first:

```
httr::set_config(httr::use_proxy(url="http://www-proxy.helsenord.no", port=8080))
```


## How to use the package

**TBA**

```
# Launch locally
shinymap::launch_application()

# Submit to shinyapp.io
shinymap::submit_application()
```



