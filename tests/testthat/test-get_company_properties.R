context("test-get_company_properties")

test_that("get_company_properties works", {
  res <- get_company_properties()
  expect_is(res, "character")
  expect_true(length(res) > 10)
})
