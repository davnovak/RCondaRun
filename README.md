## RCondaRun

<hr>

This tiny R package allows to source Python code and call Python functions using a specific conda environment.

`reticulate` (the package for R/Python interfacing) cannot switch between conda environments within one R session, but this allows you to, through only loading the `reticulate` namespace in a separate R session.

### Installation

```
devtools::install_github('davnovak/RCondaRun')
```

### Documentation

```
?RCondaRun
```
