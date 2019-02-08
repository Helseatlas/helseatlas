#' Filter routine
#'
#' @param datasett Original dataset
#' @param filter1 level1 filter
#' @param filter2 level2 filter
#' @param filter3 level3 filter
#'
#' @return datasett
#' @export
#' 
filterOut <- function(datasett, filter1=NULL, filter2=NULL, filter3=NULL){
  
  # filter out level1
  if (!is.null(filter1)){
    if ("level1" %in% colnames(datasett)){
      datasett <- try(dplyr::filter(datasett, get("level1") == filter1))
    }
  }
  
  # filter out level2
  if (!is.null(filter2)){
    if ("level2" %in% colnames(datasett)){
      datasett <- try(dplyr::filter(datasett, get("level2") == filter2))
    }
  }
  
  if (!is.null(filter3)){
    # filter out level3
    if ("level3" %in% colnames(datasett)){
      datasett <- try(dplyr::filter(datasett, get("level3") == filter3))
    }
  }
  
  return(datasett)
}