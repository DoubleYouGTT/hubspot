vcr::use_cassette("get_company_properties", {
  test_that("get_company_properties works", {
    res <- suppressWarnings(
      get_company_properties()
    )
    expect_is(res, "character")
    expect_true(length(res) > 10)
  })

  test_that("get_company_properties gives warning", {
    expect_warning(
      get_company_properties(),
      "deprecated"
      )
  })
})
