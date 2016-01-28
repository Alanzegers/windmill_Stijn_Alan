Converter_RD <- function(list){
	RD_New <- CRS("+proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.9999079 +x_0=155000 +y_0=463000 
										 +ellps=bessel +towgs84=565.2369,50.0087,465.658,-0.406857330322398,0.350732676542563,-1.8703473836068,4.0812 +units=m +no_defs")
	new_list <- c()
	for(i in list[1:7]){
		convert <- spTransform(i, RD_New)
		new_list <- c(new_list, convert)
	}
	return(new_list)
}


Converter_WGS <- function(shp){
	WGS <- CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
	convert <- spTransform(shp, WGS)
	return(convert)
}
