vcr::use_cassette("get_companies", {
  test_that("get_companies works", {
    res <- get_companies(max_iter = 1, max_properties = 1)
    expect_is(res, "list")
  })
})
