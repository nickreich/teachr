#' module.list
#'
#' The module copy function lists the available modules in your version of teachr.
#'
#' @return NULL only displaying information
#' @examples 
#'    module.list()
#' 
#' @export
module.list <- function() {
        ## folders to ignore
        ignored.folders <- c("Meta", "data", "help", "html", "R")
        ## locate the modules in the system file structure
        mod.loc.sys <- system.file(package="teachr")
        ## retrieves full path names of all package directories
        all.paths <- list.dirs(mod.loc.sys, full.names=FALSE, recursive=FALSE)
        ## subsets to just the directory name
        all.dirs <- substr(all.paths, regexpr("[^/]+$", all.paths), nchar(all.paths))
        all.mods <- all.dirs[!(all.dirs %in% ignored.folders)]
        message("Listing all teachr modules")
        cat(paste(all.mods, collapse="\n"))
        return(invisible())
}
