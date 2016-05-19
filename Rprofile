# change csv defaults that drive me nuts 
options(stringsAsFactors=F, row.names=F)
options(repos=structure(c(CRAN="http://cran.fhcrc.org/")))
    
.First <- function(){
 cat("\nGettin my R on: ", date(), "\n") 
}

.Last <- function(){ 
 cat("\nGoodye R:  ", date(), "\n")
}

# dead simple read from compressed csv... If one filename is given, assume 
# it contains a single csv, and extract it.  If multiple names are given, 
# assume the first name is the zip name, and the second is the name of the
# csv within it to extract.
# extra args are passed to read.csv
rcz <- function(filename, ...){
    file = base(filename)
    if (lenth(filename) > 1) {
        basefile = filename[2] 
        filename = filename[1]
    } else {
        basefile = substr(file, 0, substr(file, 0, nchar(file) - 4)) 
    }
    read.csv(unz(basefile, filename),...)
}
