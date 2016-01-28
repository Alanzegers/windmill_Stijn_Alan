## Alan Zegers & Stijn Wijdeven
# January 2016

	# create buffer.
		#ARGS= clip_shape(shp): shape imput file
		#radius (int): meters
		#results= buffer around objects

Buffer <- function(clip_shp, radius){
	if (is.null(clip_shp)){
		buff_poly <- is.na(clip_shp)
	}
	else {
		buff_poly <- gBuffer(clip_shp, byid=F, width = radius,
												 quadsegs = 5, capStyle = "ROUND", joinStyle = "ROUND")
	}}
