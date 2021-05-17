env1 <- simmer("hotel")


soba <-
  trajectory("Sobe' path") %>%
  
  seize("sobarica", 2) %>%
  timeout(function() rnorm(1, 30, 10)) %>%
  release("sobarica", 2) %>%
  set_attribute(keys = "gotova_soba", value = function() now(env1))%>%
  set_attribute(keys = "vrijeme_kasnjenja_sobe", value = 
                  function() (now(env1) - get_global(env1, str_extract(get_name(env1), 
                                                                       "[[:digit:]]+"))))%>%
  set_capacity(resource = "soba", value = 1, mod="+")

