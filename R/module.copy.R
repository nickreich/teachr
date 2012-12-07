#' module.copy
#'
#' The module copy function moves lesson-plan files from an internal package directory to a user-specified directory.
#'
#' @param mod module to be copied, specified in quotes 
#' @param to path to which the module should be copied 
#' @return NULL only moving files around
#' @examples 
#'    module.copy(mod="permTestExample", to="~/test")
#'    
module.copy <- function(mod, to) {
        
        if(file.exists(to)) 
                warning("overwriting existing 'to' path.")
        ## need to change above to include readlines() command to explicitly "okay" the overwriting 
        mod.loc.sys <- system.file(package="teachr", mod)
        file.copy(from=mod.loc.sys, to=to, recursive=TRUE)
        message(paste("module", mod, "copied successfully"))
}