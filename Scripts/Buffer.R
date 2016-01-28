Buffer <- function(clip_shp, radius){
	if (is.null(clip_shp)){
		buff_poly <- is.na(clip_shp)
	}
	else {
		buff_poly <- gBuffer(clip_shp, byid=F, width = radius,
												 quadsegs = 5, capStyle = "ROUND", joinStyle = "ROUND")
	}}
