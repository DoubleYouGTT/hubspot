base_url <- function(){
  "https://api.hubapi.com"
}

get_path_url <- function(path){
  httr::modify_url(base_url(),
                   path = path
  )
}

get_results <- function(path, apikey, query = NULL){

  query$hapikey <- apikey

  httr::GET(get_path_url(path),
            query = query,
            httr::user_agent("hubspot R package by Locke Data"))
}

