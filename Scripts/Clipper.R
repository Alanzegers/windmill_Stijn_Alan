Clipper <- function(list){
	clip_list <- c()
	for(i in list[1:5]){
		clip_poly <- as((list[[6]]), "SpatialPolygons")
		new_poly <- gIntersection(i, list[[6]], byid=F, drop_lower_td=T)
		clip_list <- c(clip_list, new_poly)
	}
	return(clip_list)
}

