#' Conserta problemas de encoding
#' 
#' não sei direito qual é o motivo, mas todos os nomes extraidos têm problemas
#' de encoding no meu computador, por isso existe essa função.
#' 
#' @param x um vetor de caracteres
#' 
#' @return o vetor x com os problemas corrigidos
fix_encoding <- function(x){
  x <- str_replace_all(x, "Ã\u0083Â£", "ã")
  x <- str_replace_all(x, "Ã\u0083Âª", "ê")
  x <- str_replace_all(x, "Ã\u0083Â§", "ç")
  x <- str_replace_all(x, "Ã\u0083Â¡", "á")
  x <- str_replace_all(x, "Ã\u0083Â©", "é")
  x <- str_replace_all(x, "Ã\u0083Âº", "ú")
  x <- str_replace_all(x, "Ã\u0083Â³", "ó")
  x <- str_replace_all(x, "Ã\u0083Â", "í")
  return(x)
}

#' Conserta os problemas de encoding em data.frames
#' 
#' não sei direito qual é o motivo, mas todos os nomes extraidos têm problemas
#' de encoding no meu computador, por isso existe essa função.
#' 
#' @param x data.frame com problemas de encoding
#' 
#' @return o data.frame x com os problemas corrigidos
fix_encoding_df <- function(x){
  names(x) <- fix_encoding(names(x))
  for(i in 1:ncol(x)){
    if(class(x[,i]) == "character"){
      x[,i] <- fix_encoding(as.character(x[,i]))
    }
  }
  return(x)
}