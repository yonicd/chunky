# chunky

Rstudio addin to wrap script in Rmarkdown chunks 



## Usage

  - Setting `chunky_opts$set(list(full_doc=TRUE))` and run `chunky` addin. `chunky` will convert entire active document by splitting script into chunks by `chunky_opts$get('token')`. 
    - The default token is the output from a `knitr::purl` conversion `(## ----chunk name,chunk options----)`.

  - Setting `chunky_opts$set(list(full_doc=FALSE))` Highlight text in Rmd editor. Run `chunky` addin from `RStudio Addins Menu` (setting hotkey suggested).



## Chunky Options

Like in `knitr::opts_chunk` you can set session options for the addin

  - **full_doc** boolean, controls if entire document is split by token or user highlights text and text is wrapped in chunk.

  - **token** character, token that is used to split script into chunks when `full_doc` `chunky` option is set to `TRUE`.

  - **basic** boolean, Return minimal chunk
  
```r

#```{r}

#<your script>

#```

``` 

  - **name** character, name used in chunk
  - **counter** boolean, append a counter to the chunnk name
  - **chunk_opts** character, knitr chunk options to put in chunk
  
  
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

$full_doc
[1] FALSE

$token
[1] "^#{2} -{4}(.*?)-{4+}$"
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

