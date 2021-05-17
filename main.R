env1 %>%
  add_resource("sobarica", 6) %>%
  add_resource("recepcioner", 2) %>%
  add_resource("soba", 0) %>%
  add_dataframe("soba", soba, mon = 2, soba_vrijeme_pripreme, col_time = "time", time = "absolute") %>%  # 5 minuta
  add_dataframe("gost", gost, mon = 2, gost_vrijeme_dolaska, col_time = "time", time = "absolute") %>%  # 5 minuta
  run(until=480)   # izvođenje simulacije 540 minuta; 9 sati

options(repr.plot.width=10, repr.plot.height=3, repr.plot.res=300)
par(mfrow=c(1,2))


env1_arrivals <- get_mon_arrivals(env1)
env1_resources <- get_mon_resources(env1)
env1_attributes <- get_mon_attributes(env1)

head(env1_arrivals)
head(env1_resources)


plot(env1_resources, metric = "usage", c("sobarica", "soba", "recepcioner"),
     items=c("queue", "server"))

plot(env1_resources, metric="utilization", c("sobarica", "recepcioner"))

plot(env1_attributes, metric = waiting_time, keys = "vrijeme_kasnjenja_sobe")



