vcr::use_cassette("hs_owners_raw", {
  test_that("hs_owners_raw works", {
    res <- hs_owners_raw()
    expect_is(res, "list")
  })
})

vcr::use_cassette("hs_owners_raw_active", {
  test_that("hs_owners_raw works with includeInactive", {
    res <- hs_owners_raw(include_inactive = FALSE)
    expect_is(res, "list")
    expect_true(all(lengths(purrr::map(res, "remoteList")) > 0))
  })
})

vcr::use_cassette("hs_owners_raw_email", {
  test_that("hs_owners_raw works with email", {
    res1 <- hs_owners_raw()
    res <- hs_owners_raw(email = "demo@hubspot.com")
    expect_is(res, "list")
    expect_true(length(res) < length(res1))
  })
})


vcr::use_cassette("hs_owners_tidy", {
  test_that("hs_owners_tidy works", {
    res <- hs_owners_tidy()
    expect_is(res, "tbl_df")
    expect_true(ncol(res) >= 12)
  })
})
