% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helpers_gghistostats.R
\name{line_labeller}
\alias{line_labeller}
\title{Adds a label to the horizontal or vertical line.}
\usage{
line_labeller(plot, x, y, k = 2, color, label.text,
  line.direction = "vline", jitter = 0.25)
}
\arguments{
\item{plot}{A \code{ggplot} object in which the label needs to be displayed.}

\item{x, y}{The \code{x}- and \code{y}-axes coordinates for the label.}

\item{k}{Number of digits after decimal point (should be an integer)
(Default: \code{k = 2}).}

\item{color}{Color of the label.}

\item{label.text}{The text to include in the label (e.g., \code{"mean"}).}

\item{line.direction}{Character that specifies whether the line on which
label is to be attached is vertical (\code{"vline"}, default) or horizontal
(\code{"hline"}) line.}

\item{jitter}{Numeric that specifies how much the label should be jittered in
the vertical direction (default:  \code{0.25}). The sign will determine the
direction (upwards or downwards).}
}
\description{
Adds a label to the horizontal or vertical line.
}
\examples{
# creating a basic plot
set.seed(123)
library(ggplot2)
p <- ggplot(mtcars, aes(wt, mpg)) + geom_point()

# adding a label
ggstatsplot:::line_labeller(
  plot = p,
  x = median(mtcars$wt),
  y = mean(mtcars$mpg),
  k = 2,
  color = "red",
  label.text = "median"
)
}
\author{
Indrajeet Patil
}
\keyword{internal}
