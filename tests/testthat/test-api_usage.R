vcr::use_cassette("api-usage", {
  test_that("hubspot_api_usage works", {
    res <- hubspot_api_usage()
    expect_is(res, "tbl_df")
    expect_is(res$collectedAt, "POSIXct")
    expect_is(res$resetsAt, "POSIXct")
  })
})
