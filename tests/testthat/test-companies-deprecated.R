vcr::use_cassette("get_companies", {
  test_that("get_companies works", {
    res <- suppressWarnings(
      get_companies(max_iter = 1, max_properties = 1)
    )
    expect_is(res, "list")
  })

  test_that("get_companies gets warning", {
    res <- expect_warning(
      get_companies(max_iter = 1, max_properties = 1),
      "deprecated"
    )
  })
})

vcr::use_cassette("company_properties", {
  test_that("company_properties works", {
    res <- suppressWarnings(
      company_properties()
    )
    expect_is(res, "tbl_df")
    expect_gt(ncol(res), 3)
  })

  test_that("company_properties gets a warning", {
    expect_warning(
      company_properties(),
      "deprecated")
  })
})
