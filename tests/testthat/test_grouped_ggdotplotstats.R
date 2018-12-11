context("grouped_ggdotplotstats")

testthat::test_that(
  desc = "grouped_ggdotplotstats works",
  code = {

    # for reproducibility
    set.seed(123)

    # removing factor level with very few no. of observations
    df <- dplyr::filter(.data = ggplot2::mpg, cyl %in% c("4", "6", "8"))

    # plot
    # when arguments are entered as bare expressions
    set.seed(123)
    p1 <- ggstatsplot::grouped_ggdotplotstats(
      data = df,
      x = cty,
      y = manufacturer,
      xlab = "city miles per gallon",
      ylab = "car manufacturer",
      grouping.var = cyl,
      test.value = 15.5,
      title.prefix = "cylinder count",
      point.color = "red",
      point.size = 5,
      point.shape = 13,
      test.value.line = TRUE,
      ggtheme = ggthemes::theme_par(),
      messages = TRUE,
      title.text = "Fuel economy data"
    )

    # when arguments are entered as characters
    p2 <- ggstatsplot::grouped_ggdotplotstats(
      data = df,
      x = "cty",
      y = "manufacturer",
      grouping.var = "cyl",
      test.value = 15.5,
      title.prefix = "cylinder count",
      messages = FALSE
    )

    # testing output objects are ggplot
    testthat::expect_true(inherits(p1, what = "gg"))
    testthat::expect_true(inherits(p2, what = "gg"))
  }
)