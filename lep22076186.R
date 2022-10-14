# Cargar librerias ------------------------------------------------------------

library(tidyverse, httr)

# Limpieza dataset ------------------------------------------------------------

janitor::clean_names(catastro_sample)%>% glimpse() 
locale()
catastro<-catastro_sample %>% janitor::clean_names()%>% type_convert(locale = locale(decimal_mark = ','))

# Apartado 5 ------------------------------------------------------------

catastro_bajo<-catastro %>% mutate(PisoTurista = case_when(grepl("Bajo", description) ~ "Piso Turista"))
catastro_media<-catastro_bajo %>% select(autonomous_region,area) %>% drop_na() %>% group_by(autonomous_region) %>% summarise(mean(area)) %>% view()

