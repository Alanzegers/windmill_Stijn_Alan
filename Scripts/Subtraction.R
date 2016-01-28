#alan zegers & Stijn Wijdeven
# January 2016
	# Subtract shapes

Subtract <- function (shp, subtraction){
	if (is.null(subtraction[[1]])){
		result <- 0
	}
	else{
		result <- gDifference(shp, subtraction[[1]], byid=T, drop_lower_td = T)
	}
	for (i in subtraction[2:5]){
		if (is.null(i)){
			result == 0
		}
		else{ 
			result <- gDifference(result, i, byid=T, drop_lower_td = T)
		}
	}
	return(result)
}
