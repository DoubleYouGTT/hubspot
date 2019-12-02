vcr::use_cassette("hs_deals_raw", {
  test_that("hs_deals_raw works", {
    res <- hs_deals_raw(max_iter = 1, max_properties = 1)
    expect_is(res, "list")
  })
})

vcr::use_cassette("hs_deals_tidy_properties", {
  test_that("hs_deals_tidy properties works", {
    res <- hs_deals_tidy(view = "properties")
    expect_is(res, "tbl_df")
    expect_gt(ncol(res), 3)
  })
})

vcr::use_cassette("hs_deals_tidy_properties_history", {
  test_that("hs_deals_tidy properties history works", {
    res <- hs_deals_tidy(view = "properties history")
    expect_is(res, "tbl_df")
    expect_equal(ncol(res), 7)
  })
})

vcr::use_cassette("hs_deals_tidy_stages_history", {
  test_that("hs_deals_tidy stages history works", {
    res <- hs_deals_tidy(view = "stages history")
    expect_is(res, "tbl_df")
    expect_equal(ncol(res), 5)
  })
})


vcr::use_cassette("hs_deals_tidy_deal_associations", {
  test_that("hs_deals_tidy associations works", {
    res <- suppressWarnings(hs_deals_tidy(view = "associations"))
    expect_is(res, "tbl_df")
    expect_equal(ncol(res), 3)
    expect_true(all(colnames(res) %in% c("dealId", "type", "Ids")))
  })
})
