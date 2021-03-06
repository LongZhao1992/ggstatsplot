% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helpers_ggbetween_anova_subtitles.R
\name{subtitle_anova_robust}
\alias{subtitle_anova_robust}
\title{Making text subtitle for the robust ANOVA}
\usage{
subtitle_anova_robust(data, x, y, paired = FALSE, tr = 0.1,
  nboot = 100, conf.level = 0.95, conf.type = "norm",
  messages = TRUE, k = 2, ...)
}
\arguments{
\item{data}{A dataframe (or a tibble) from which variables specified are to
be taken. A matrix or tables will \strong{not} be accepted.}

\item{x}{The grouping variable from the dataframe \code{data}.}

\item{y}{The response (a.k.a. outcome or dependent) variable from the
dataframe \code{data}.}

\item{paired}{Logical that decides whether the design is repeated
measures/within-subjects (in which case one-way Friedman Rank Sum Test will
be carried out) or between-subjects (in which case one-way Kruskal–Wallis H
test will be carried out). The default is \code{FALSE}.}

\item{tr}{Trim level for the mean when carrying out \code{robust} tests. If you
get error stating "Standard error cannot be computed because of Winsorized
variance of 0 (e.g., due to ties). Try to decrease the trimming level.",
try to play around with the value of \code{tr}, which is by default set to
\code{0.1}. Lowering the value might help.}

\item{nboot}{Number of bootstrap samples for computing confidence interval
for the effect size (Default: \code{100}).}

\item{conf.level}{Scalar between 0 and 1. If unspecified, the defaults return
\code{95\%} lower and upper confidence intervals (\code{0.95}).}

\item{conf.type}{A vector of character strings representing the type of
intervals required. The value should be any subset of the values \code{"norm"},
\code{"basic"}, \code{"perc"}, \code{"bca"}. For more, see \code{?boot::boot.ci}.}

\item{messages}{Decides whether messages references, notes, and warnings are
to be displayed (Default: \code{TRUE}).}

\item{k}{Number of digits after decimal point (should be an integer)
(Default: \code{k = 2}).}

\item{...}{Additional arguments.}
}
\description{
Making text subtitle for the robust ANOVA
}
\examples{

\dontrun{
# for reproducibility
set.seed(123)

# ------------------------ between-subjects -----------------------------

# going with the defaults
ggstatsplot::subtitle_anova_robust(
  data = ggplot2::midwest,
  x = state,
  y = percbelowpoverty,
  paired = FALSE,
  nboot = 10
)

# changing defaults
subtitle_anova_robust(
  data = ggplot2::midwest,
  x = state,
  y = percollege,
  paired = FALSE,
  conf.level = 0.99,
  tr = 0.2,
  nboot = 10
)

# ------------------------ within-subjects -----------------------------

ggstatsplot::subtitle_anova_robust(
  data = iris_long,
  x = condition,
  y = value,
  paired = TRUE,
  tr = 0.2,
  k = 3
)
}
}
\author{
Indrajeet Patil
}
