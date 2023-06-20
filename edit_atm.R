edit_atm<-function(file,ATM){
  library(XML)
  # this function will edit the xflr|asyr file
  # and change the atmospheric pressure
  # if its XFLR it will stuff the edited xml back 
  # into the original file
  # if it is an asyr it will save the xml,gzip, then
  # overwrite it on the original file
  xml<-NULL
  ad <- "__ASSAYDATA__"
  # check if its zipped or stream
  # if True,assumes its XFLR
  innards<-tryCatch({unzip(file,list=T)},
                    error = function(e) {
                      return(NULL)}
  )
  check <- if (is.null(innards)) {
    FALSE
  } else{
    # redundant check
    grepl(ad, innards$Name)
  }
  
  # read in the xml depending on the format
  if(check) {
    unzip(file, ad, overwrite = T)
    xml <- XML::xmlTreeParse(ad, useInternalNodes = T)
    unlink(ad)
  } else{
    xml <- XML::xmlTreeParse(file, useInternalNodes = T)
  }
  
  # finds the node in xml and edits the value
  atm<- xpathSApply(xml,"//AtmosphericPressure/text()")
  sapply(atm,function(H){xmlValue(H) <- as.character(ATM)})
  # writes the altered xml to disk
  XML::saveXML(xml,ad)
  # places it where it goes depending on format
  if(check){
    zip(file,files=ad,flags="-ugr")
  }else{
    R.utils::gzip(ad,destname=file,overwrite=T)
  }
  # just make sure that actually gets cleaned up
  unlink(ad)
}