vcr::use_cassette("hs_deals_raw", {
  test_that("hs_deals_raw works", {
    res <- hs_deals_raw(max_iter = 1, max_properties = 1)
    expect_is(res, "list")
  })
})

# to be deprecated
vcr::use_cassette("get_deals", {
  test_that("get_deals works", {
    res <- suppressWarnings(
      get_deals(max_iter = 1, max_properties = 1))
    expect_is(res, "list")
  })
})
