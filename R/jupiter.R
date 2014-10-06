jup_ue <- function(){
  ue <- "https://uspdigital.usp.br/jupiterweb/jupColegiadoLista?tipo=D" %>% GET() %>% html() %>% html_node("table")
  ue.tab <- ue[[3]] %>% html_table(header = T)
  names(ue.tab)[1] <- "Código"
  return(ue.tab)
}