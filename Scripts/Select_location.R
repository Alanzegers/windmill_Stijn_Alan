user_input <- function(){
	library(raster)
	level <- readline("Default is The Netherlands, otherwise type 'province' or 'municipality'. ")
	
	if(level == "province"){
		input_area <- getData('GADM', country='NLD', level=1)
		province <- readline("Type the name of the province. ")
		location <- subset(input_area, select = NAME_1, NAME_1 == province)
		return(location)}
	
	if(level != "province"){
		
		if(level == "municipality"){
			input_area <- getData('GADM', country='NLD', level=2)
			municipality <- readline("Type the name of the municipality. ")
			location <- subset(input_area, select = NAME_2, NAME_2 == municipality)
			return(location)}
	
		if(level != "municipality"){
			input_area <- getData('GADM', country='NLD', level=0)
			location <- subset(input_area, select = NAME_LOCAL, NAME_LOCAL == "Nederland")
			return(location)}
	}
		
}


