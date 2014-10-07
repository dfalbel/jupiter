#' unidades de ensino da usp
#' 
#' @description devolve um data.frame com o código e o nome de todas as unidades de ensino da usp.
jup_unidades_ensino <- function(){
  
  uni.ens <- rvest::html("https://uspdigital.usp.br/jupiterweb/jupColegiadoLista?tipo=D")
  uni.ens  <- rvest::html_nodes(uni.ens,"table")
  uni.ens_tab <- rvest::html_table(uni.ens[[3]],header = T)
  uni.ens_tab <- fix_encoding_df(uni.ens_tab)
  return(uni.ens_tab)
}

