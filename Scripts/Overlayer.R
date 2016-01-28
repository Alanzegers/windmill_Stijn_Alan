overlayer <- function(subtraction, wind_data){

	### Remove holes from polygon
	corrected_polygons <- disaggregate(subtraction)

	### Overlay
	overlay <- over(corrected_polygons, wind_data)

	### Match names
	data_frame <- data.frame(id = getSpPPolygonsIDSlots(corrected_polygons))
	row.names(data_frame) <- getSpPPolygonsIDSlots(corrected_polygons)

	### Make spatial polygon data frame
	new_polygons <- SpatialPolygonsDataFrame(corrected_polygons, data=data_frame)

	### Assign values from overlay to dataframe
	corrected_values <- cbind(overlay, new_polygons)

	### Create new data frame
	all_locations <- SpatialPolygonsDataFrame(new_polygons, data=corrected_values)

	### Update area data
	new_area <- sapply(slot(all_locations, "polygons"), slot, "area")
	all_locations$SHAPE_Area <- new_area
	return(all_locations)
	
}