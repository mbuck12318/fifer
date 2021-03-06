##' Perform a general linear model
##'
##' Perform a general linear model
##'	
##' A general linear model (GLM) is a statistical model of the form Y = BX, where X can be any number of numeric or categorical predictors. The GLM subsumes
##' the most common statistical models, including t-tests, ANOVAs, regressions, etc. The function will automatically detect whether the variables are numeric
##' or categorical and generate estimates and graphics accordingly. 
##' @param formula An equation of the form y~x1 + x2 + x3, etc. 
##' @param data The dataset containing the variables the user wishes to model
##' @param output Specify the type of output to return, either "estimates", "graphics", or "both"
##' @param ... Other parameters passed to \code{\link{visualize}} (which is then passed to \code{\link{flexplot}})
##' @seealso \code{\link{estimates}}, \code{\link{visualize}}, \code{\link{flexplot}}, \code{\link{model.comparison}}
##' @return An object containing the information from \code{\link{estimates}}
##' @author Dustin Fife
##' @export
##' @examples
##' ## load the exercise dataset
##' data(exercise_data)
##' data = exercise_data
##' glinmod(weight.loss~gender, data=exercise_data, output="estimates")
##' glinmod(weight.loss~gender, data=exercise_data, output="graphics")
##' glinmod(weight.loss~gender, data=exercise_data, output="both")
##' ## pass parameters to visualize (here, just plot residuals)
##' glinmod(weight.loss~gender + motivation, data=exercise_data, output="both", plot="residuals")
##' ## pass parameters to visualize (here, plot the model...yes, I know...bivariate is a misnomer)
##' glinmod(weight.loss~gender+ motivation, data=exercise_data, output="both", plot="bivariate")
##' ## pass parameters to flexplot
##' glinmod(weight.loss~gender + motivation, data=exercise_data, output="both", plot="bivariate", se=F, method="lm")
glinmod = function(f, data, output=c("both", "estimates", "graphics"), ...){
	
	output = match.arg(output)

	#### run the lm
	mod = lm(f, data)
	
	#### compute the estimates
	if (output == "both" | output == "estimates"){
		est = estimates(mod)
		print(est)
	} else {
		est = NA
	}
	
	#### visualize that succa
	if (output=="both" | output == "graphics"){
		visualize(mod,...)
	}
	return(est)
}