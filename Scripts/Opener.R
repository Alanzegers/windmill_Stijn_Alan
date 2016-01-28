## Alan Zegers & Stijn Wijdeven
# January 2016

	#open files
	
	dsn1 <- file.path("data/Top10NL-Plaats-Bebouwdekom.shp")
	dsn2 <- file.path("data/Top10NL_Inricht_el_Hoogspanningsleidingen.shp")
	dsn3 <- file.path("data/nwb_06_highwaysubset.shp")
	dsn4 <- file.path("data/Top10NL_Spoorwegen.shp")
	dsn5 <- file.path("data/Natura2000_30apr2014.shp")
	dsn6 <- file.path("data/windkaart.shp")
	### Open files
	
	buildup <- readOGR(dsn1, layer = ogrListLayers(dsn1))
	power <- readOGR(dsn2, layer = ogrListLayers(dsn2))
	roads <- readOGR(dsn3, layer = ogrListLayers(dsn3))
	railroads <- readOGR(dsn4, layer = ogrListLayers(dsn4))
	nature <- readOGR(dsn5, layer = ogrListLayers(dsn5))
	windspeeds <- readOGR(dsn6, layer = ogrListLayers(dsn6))
	
	list <- c(buildup, power, roads, railroads, nature, windspeeds)
	return(list)
}
