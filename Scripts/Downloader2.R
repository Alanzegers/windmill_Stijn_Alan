## Alan Zegers & Stijn Wijdeven
# January 2016

	# Download and Unzip data to data folder.
		#ARGS= dataURL(str): URL of a zip file 
		#results= unpacked zip file, with SHP file in data folder
Downloader <- function(){
	Downloader2 <- function(dataURL){
		
		inputZip <- list.files(path=ifolder, pattern= '^.*\\.zip$')
	
		remove1 <- gsub("/","_",dataURL, fixed = TRUE)
		remove2 <- gsub(".","_",remove1, fixed = TRUE)
		remove3 <- gsub("-","_",remove1, fixed = TRUE)
		DataURL_Cleaned <- gsub(":","",remove3, fixed = TRUE)
	
		FileName = paste("data/",DataURL_Cleaned,sep="")
	
		if (!file.exists(FileName)==TRUE){ 
		download.file(url = dataURL, destfile = FileName, method = 'wget')
		}
		else{print("Data already downloaded")}
	
	unzip(FileName, exdir=ifolder, overwrite = TRUE)

	print(paste("Run Finished for",FileName))
	}
	Downloader2("http://www.imergis.nl/shp/Top10NL_Inricht_el_Hoogspanning-shp.zip")   
	Downloader2("http://www.imergis.nl/shp/Top10NL_Spoorwegen_stations-shp.zip")
	Downloader2("http://geodata.nationaalgeoregister.nl/windkaart/extract/windkaart.zip")
	Downloader2("http://www.imergis.nl/shp/Top10NL-Plaats-Bebouwdekom-shp.zip")
	Downloader2("http://www.natura2000.nl/files/n2k_30april2014_ter_uitlevering.aspx")
	Downloader2("http://geoplaza.vu.nl/data//dataset/95c22d90-36f6-47aa-8391-42f396ca7a70/resource/34434c29-9f8a-407c-8ac0-49d13edad7f1/download/nwb06rijkswegen.zip")
}
	
