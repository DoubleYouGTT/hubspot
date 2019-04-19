context("test-get_owners")

test_that("get_owners works", {
  res <- get_owners()
  expect_is(res, "list")
})
