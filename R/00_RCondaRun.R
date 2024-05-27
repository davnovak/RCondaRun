
#' Run Python function in a conda environment
#'
#' Uses Python, \code{reticulate} and \code{callr} to run a function \code{func} with arguments \code{args} with a specific conda environment activated.
#' This function can use \code{source_python}, \code{py_eval} and other \code{reticulate} functions to run Python code.
#' The function is run in a separate R session, because \code{reticulate} cannot switch between conda environments in a single R session.
#'
#' This function does not attach the \code{reticulate} namespace in your R session.
#'
#' @param func function
#' @param args list of argument values to \code{func}
#' @param python_path path to conda environment with '/bin/python' at the end
#'
#' @export
RCondaRun <- function(
  func,
  args,
  python_path
) {
  callr::r(
    func = function(func, args, python_path) {

      Sys.setenv(RETICULATE_PYTHON = python_path)
      library(reticulate)

      use_condaenv(python_path, required = TRUE)

      do.call(func, args)

    },
    args = list(
      'func'        = func,
      'args'        = args,
      'python_path' = python_path
    )
  )
}



