context("kw_eta_h_ci")

testthat::test_that(
  desc = "confidence interval for effect size for Kruskal-Wallis test ",
  code = {
    testthat::skip_on_cran()
    testthat::skip_if_not(R.version$minor >= "6.0")

    # percentile
    set.seed(123)
    df1 <-
      suppressWarnings(ggstatsplot:::kw_eta_h_ci(
        data = movies_long,
        genre,
        budget,
        nboot = 50,
        conf.level = 0.999,
        conf.type = "perc"
      ))

    # basic
    set.seed(123)
    df2 <- ggstatsplot:::kw_eta_h_ci(
      data = ggplot2::msleep,
      x = vore,
      y = sleep_rem,
      nboot = 100,
      conf.level = 0.90,
      conf.type = "basic"
    )

    # bca
    set.seed(123)
    df3 <- suppressWarnings(ggstatsplot:::kw_eta_h_ci(
      data = ggplot2::msleep,
      x = vore,
      y = sleep_rem,
      nboot = 100,
      conf.level = 0.95,
      conf.type = "bca"
    ))

    # percentile
    testthat::expect_equal(df1$estimate, 0.1263433, tolerance = 0.001)
    testthat::expect_equal(df1$conf.low, 0.09194167, tolerance = 0.0001)
    testthat::expect_equal(df1$conf.high, 0.1739922, tolerance = 0.0003)
    testthat::expect_equal(df1$conf, 0.999, tolerance = 0.01)
    testthat::expect_equal(df1$nboot, 50L)

    # basic
    testthat::expect_equal(df2$estimate, 0.1165873, tolerance = 0.001)
    testthat::expect_equal(df2$conf.low, -0.09807447, tolerance = 0.0001)
    testthat::expect_equal(df2$conf.high, 0.2325179, tolerance = 0.0003)

    # bca
    testthat::expect_equal(df3$estimate, 0.1165873, tolerance = 0.001)
    testthat::expect_equal(df3$conf.low, -0.03205744, tolerance = 0.0001)
    testthat::expect_equal(df3$conf.high, 0.2477084, tolerance = 0.0003)
  }
)
