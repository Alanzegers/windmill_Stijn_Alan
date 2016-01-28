# Alan Zegers & Stijn Wijdeven
# january 2016

plotter <- function(shp){
	### Create colourscheme
	palette <- c("#023858", "#045a8d", "#0570b0", "#3690c0", "#ef6548", "#d7301f", "#b30000", "#7f0000")
	domain <- shp$KLASSE
	pal <- colorNumeric(palette, domain)
	
	### Plot map
	leaflet() %>%
		addProviderTiles("CartoDB.Positron") %>%
		addPolygons(data = shp, stroke = FALSE, smoothFactor = 0.1, fillOpacity = 1,
								color = ~pal(KLASSE))%>%

		addLegend("bottomright", pal = pal, values = shp$KLASSE,
							title = "low to high",
							labFormat = labelFormat(prefix = ""),
							opacity = 1
		)
	
}
