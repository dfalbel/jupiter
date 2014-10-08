#' unidades de ensino da usp
#' 
#' @description devolve um data.frame com o código e o nome de todas as unidades de ensino da usp.
#' Essa função não tem argumentos.
#' 
#' @export
jup_unidades_ensino <- function(){
  uni.ens <- rvest::html("https://uspdigital.usp.br/jupiterweb/jupColegiadoLista?tipo=D")
  uni.ens  <- rvest::html_nodes(uni.ens,"table")
  uni.ens_tab <- rvest::html_table(uni.ens[[3]],header = T)
  uni.ens_tab <- fix_encoding_df(uni.ens_tab)
  return(uni.ens_tab)
}

#' disciplinas de uma unidade de ensino
#' 
#' dado o código de uma unidade de ensino, retorna a lista de disciplinas, com sigla, nome, datas de ativação e desativação
#' 
#' @param codigo da unidade de ensino da qual deseja-se obter a lista de disciplinas.
jup_disciplinas <- function(codigo){
  
  disciplinas.url <- paste("https://uspdigital.usp.br/jupiterweb/jupDisciplinaLista?codcg=", codigo, "&letra=A-Z&tipo=D", sep = "")
  disciplinas <- rvest::html(disciplinas.url)
  disciplinas <- rvest::html_nodes(disciplinas, "table")
  
  disciplinas.tab <- rvest::html_table(disciplinas[[3]], header=T)
  disciplinas.tab <- fix_encoding_df(disciplinas.tab)
  
  return(disciplinas.tab)
}