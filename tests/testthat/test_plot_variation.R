context("plot_variation")

test_that("plot_variation is OK", {
  expect_error(plot_variation())

  data <- readRDS("data/start_plot.rds")
  expect_equal_to_reference(plot_variation(input_data = data),
                            "data/plot_variation1.rds")

  expect_null(plot_variation(input_data = data, type = "tmp"))
})