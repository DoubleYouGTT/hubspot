vcr::use_cassette("get_deals", {
  test_that("get_deals works", {
    res <- suppressWarnings(
      get_deals(max_iter = 1, max_properties = 1))
    expect_is(res, "list")
  })
})

vcr::use_cassette("deal_properties", {
  test_that("deal_properties works", {
    res <- suppressWarnings(deal_properties())
    expect_is(res, "tbl_df")
    expect_gt(ncol(res), 3)
  })
})

vcr::use_cassette("deal_properties_history", {
  test_that("deal_properties_history works", {
    res <- suppressWarnings(deal_properties_history())
    expect_is(res, "tbl_df")
    expect_equal(ncol(res), 7)
  })
})

vcr::use_cassette("deal_stages_history", {
test_that("deal_stages_history works", {
  res <- suppressWarnings(deal_stages_history())
  expect_is(res, "tbl_df")
  expect_equal(ncol(res), 5)
})
})

vcr::use_cassette("deal_associations", {
  test_that("deal_associations works", {
    res <- suppressWarnings(deal_associations())
    expect_is(res, "tbl_df")
    expect_equal(ncol(res), 3)
    expect_true(all(colnames(res) %in% c("dealId", "type", "Ids")))
  })
})
