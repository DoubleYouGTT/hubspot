vcr::use_cassette("get_deal_properties", {
  test_that("get_deal_properties works", {
    res <- suppressWarnings(
      get_deal_properties()
    )
    expect_is(res, "character")
    expect_true(length(res) > 10)
  })

  test_that("get_deal_properties gets warning", {
    res <- expect_warning(
      get_deal_properties(),
      "deprecated"
    )
  })
})
