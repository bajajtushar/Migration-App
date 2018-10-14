

server=function(input,output){
  
  dataplot= reactive({
    
    k=readRDS("data/k.rds")
    map=readRDS("data/map.rds")
    
    
  data=k%>%filter(!area %in% "India") %>% filter(sector==input$sector,durationofresidence==input$duration,
                          sectoroflastresidence==input$lastres,Gender==input$gender) %>% select(area,`number of migrants`,!!rlang::sym(input$reason)) %>% 
      rename(id=area) %>% arrange(id) %>% mutate(pct=!!sym(input$reason)*100/`number of migrants`) %>% inner_join(map,.)
    
  })
    
   output$migrantgis=renderPlot({
     nam=readRDS("data/nam.rds")
     ggplot()+geom_polygon(data=dataplot(),aes(x=long,y=lat,group=group,fill=pct)) +
      geom_path(data=dataplot(),aes(x=long,y=lat,group=group),color="white") +
      labs(title="Propotion by reason for migration",caption="census2011") + coord_equal()+
      scale_fill_viridis() + geom_text(data=nam, aes(x=long, y=lat, label = id), size=3, fontface="bold")
    
  })
  
}
  
