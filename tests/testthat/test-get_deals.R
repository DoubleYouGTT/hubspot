vcr::use_cassette("get_deals", {
  test_that("get_deals works", {
    res <- get_deals(max_iter = 1, max_properties = 1,
                     property_history = "false")
    expect_is(res, "list")
  })

  test_that("get_deals works with history", {
    res <- get_deals(max_iter = 1, max_properties = 2,
                     property_history = "false")
    res2 <- get_deals(max_iter = 1, max_properties = 2,
                     property_history = "true")
    expect_is(res2, "list")
    expect_equal(length(res$`931633510`$properties$hs_lastmodifieddate$versions),
                 1)
    expect_equal(length(res2$`931633510`$properties$hs_lastmodifieddate$versions),
                 3)
  })
})

