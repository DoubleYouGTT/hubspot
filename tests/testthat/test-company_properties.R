vcr::use_cassette("company_properties", {
  test_that("company_properties works", {
    res <- company_properties()
    expect_is(res, "tbl_df")
    expect_gt(ncol(res), 3)
  })
})
