gost <-
  trajectory("Gosti' path") %>%
  
  seize("recepcioner", 1) %>%
  timeout(function() rnorm(1, 5)) %>%
  release("recepcioner", 1)%>%
  timeout(function() rnorm(1, 5)) %>%
  
  set_global(keys = function() str_extract(get_name(env1), 
                                           "[[:digit:]]+"), value = function() now(env1)) %>%
  seize("soba", 1) 
