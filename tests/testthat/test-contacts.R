vcr::use_cassette("hs_contacts_raw", {
  test_that("hs_contacts_raw works", {
    res <- hs_contacts_raw(max_iter = 1, max_properties = 1)
    expect_is(res, "list")
  })
})

vcr::use_cassette("hs_contacts_tidy", {
  test_that("hs_contacts_tidy properties works", {
    res <- hs_contacts_tidy(view = "properties")
    expect_is(res, "tbl_df")
    expect_gt(ncol(res), 3)
  })
})
