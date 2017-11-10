# chunky

Rstudio addin to wrap script in Rmarkdown chunks 



## Usage

  - Highlight text in Rmd editor. Run chunky addin from `RStudio Addins Menu` (setting hotkey suggested)



## Chunky Options

Like in `knitr::opts_chunk` you can set session options for the addin

  - **basic** Return minimal chunk
  
```r

#```{r}

#<your script>

#```

``` 

  - **name** name used in chunk
  - **counter** append a counter to the chunnk name
  - **chunk_opts** knitr chunk options to put in chunk
  
  
  - get session options of chunky

```r
chunky_opts$get()

$basic 
[1] FALSE

$name
[1] "chunky"

$counter
[1] TRUE

$chunk_opts
NULL
```

  - set session options of chunky

```r
chunky_opts$set(list(name='chunky monkey'))

chunky_opts$get('name')
[1] "chunky monkey"
```

```r
chunky_opts$set(list(chunk_opts='message=FALSE,warning=FALSE'))

#```{r chunky monkey001, message=FALSE,warning=FALSE}

#<your script>

#```

```

