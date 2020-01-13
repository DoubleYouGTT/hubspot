vcr::use_cassette("hs_companies_raw", {
  test_that("hs_companies_raw works", {
    res <- hs_companies_raw(max_iter = 1, max_properties = 1)
    expect_is(res, "list")
  })
})

vcr::use_cassette("hs_companies_tidy", {
    test_that("hs_companies_tidy properties works", {
      res <- hs_companies_tidy(view = "properties")
      expect_is(res, "tbl_df")
      expect_gt(ncol(res), 3)
    })
})
