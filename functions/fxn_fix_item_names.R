
#BDAT--------------------
if(sum(str_detect(event_columns, 'BIRTH'))>0){
  events<<-events%>%
    rename(BDAT = BIRTH)
}

#BREED-------------------
if(sum(str_detect(event_columns, 'BREED'))>0){
  events<<-events%>%
    rename(CBRD = BREED)
}

#FRESH--------------------
if(sum(str_detect(event_columns, 'FRSH'))>0){
  events<-events%>%
    rename(FDAT = FRSH)
}

#DDRY--------------------
if(sum(str_detect(event_columns, 'DRYDT'))>0){
  events<<-events%>%
    rename(DDAT = DRYDT)
}

#PODAT--------------------
if(sum(str_detect(event_columns, 'PGCK'))>0){
  events<<-events%>%
    rename(PODAT = PGCK)
}

#DIM--------------------
if(sum(str_detect(event_columns, 'DNM'))>0){
  events<<-events%>%
    rename(DIM = DNM)
}

#HDAT--------------------
if(sum(str_detect(event_columns, 'HDAT'))<1){
  events<<-events%>%
    rename(HDAT = as.character(NA))
}


