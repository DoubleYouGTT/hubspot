vcr::use_cassette("hs_contact_lists_raw", {
  test_that("hs_contact_lists_raw works", {
    expect_is(hs_contact_lists_raw(), "list")
  })
})


vcr::use_cassette("hs_contact_lists_tidy", {
  test_that("hs_contact_lists_tidy works", {
    res <- hs_contact_lists_tidy()
    expect_is(res, "tbl_df")
    expect_true(all(names(res) == c("id", "name")))
  })
})

