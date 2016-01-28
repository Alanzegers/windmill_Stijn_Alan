### Alan Zegers & Stijn Wijdeven
### Teamname*
### January 2016
### Where to place your wind turbines. 

### Clear environment
rm(list=ls())

### Create folder structure
ifolder<- ('./data')
scriptfolder<-('./Scripts')
ofolder<- ('./output')
dir.create(ifolder, showWarnings = FALSE)
dir.create(scriptfolder, showWarnings = FALSE)
dir.create(ofolder, showWarnings = FALSE)

### Open libraries 
library(sp)
library(rgdal)
library(rgeos)
library(leaflet)
source("Scripts/Downloader2.R")
source("Scripts/Opener.R")
source("Scripts/Select_location.R")
source("Scripts/Converter.R")
source("Scripts/Clipper.R")
source("Scripts/Buffer.R")
source("Scripts/Subtraction.R")
source("Scripts/Overlayer.R")
source("Scripts/Plotter.R")

### Download data
Downloader()

### Open files
datalist <- opener()

### Ask user for location
location <- NULL
while(is.null(location) == TRUE){
	location <- user_input()}

### Add location to datalist
datalist <- c(datalist, location)

### Convert to RD New
RD_list <- Converter_RD(datalist)

### Simplify polygons, to adjust tolerance change tol
buildup_simp <- gSimplify(RD_list[[1]], tol=40)
nature_simp <- gSimplify(RD_list[[5]], tol=40)

### Add simple polygons to new list
simp_list <- c(buildup_simp, RD_list[[2]], RD_list[[3]], RD_list[[4]], nature_simp, RD_list[[7]])

### Clip to location
clip_list <- Clipper(simp_list)

### Create buffers, size in meters
buildup_buffer <- Buffer(clip_list[[1]],1000)
power_buffer <- Buffer(clip_list[[2]], 100)
roads_buffer <- Buffer(clip_list[[3]], 50)
railroads_buffer <- Buffer(clip_list[[4]], 50)
nature_buffer <- Buffer(clip_list[[5]], 100)

### Make list 
buffers <- c(buildup_buffer, power_buffer, roads_buffer, railroads_buffer, nature_buffer)

### Calculate difference
subtract <- Subtract(simp_list[[6]], buffers)

### Make overlay and update data
all_size_locations <-overlayer(subtract, RD_list[[6]])
all_size_locations
### subtract small polygons
ideal_locations <- subset(all_size_locations, SHAPE_Area > 500000)

### Convert to WGS
WGS_ideal_locations <- Converter_WGS(ideal_locations)

### Write to shapefile
writeOGR(WGS_ideal_locations, ".", "output/final_result_WGS", driver="ESRI Shapefile")

### Plot result
plotter(WGS_ideal_locations)

