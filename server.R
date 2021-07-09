

server = function(input, output, session){

  # cannabis tab
  source("server/server_cannabis.R", local = T)$value
  
   # psychedelics tab
  source("server/server_psychedelics.R", local = T)$value
  
}


