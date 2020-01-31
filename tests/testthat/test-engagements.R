vcr::use_cassette("hs_engagements_raw", {

  test_that("hs_engagements_raw works", {

    expect_is(hs_engagements_raw(), "list")

  })

})

vcr::use_cassette("hs_engagements_tidy", {
  test_that("hs_engagements_tidy works", {
    res <- hs_engagements_tidy(view = "id")
    expect_is(res, "tbl_df")
    expect_true(all(names(res) == c("id", "type", "createdAt", "lastUpdated")))
  })
})

vcr::use_cassette("hs_engagements_tidy", {
  test_that("hs_engagements_tidy contacts works", {
    res <- hs_engagements_tidy(view = "contacts")
    expect_is(res, "tbl_df")
    expect_true(all(names(res) == c("id", "type", "createdAt", "lastUpdated","associatedContacts")))
  })
})

vcr::use_cassette("hs_engagements_tidy", {
  test_that("hs_engagements_tidy companies works", {
    res <- hs_engagements_tidy(view = "companies")
    expect_is(res, "tbl_df")
    expect_true(all(names(res) == c("id", "type", "createdAt", "lastUpdated","associatedCompanies")))
  })
})

vcr::use_cassette("hs_engagements_tidy", {
  test_that("hs_engagements_tidy deals works", {
    res <- hs_engagements_tidy(view = "deals")
    expect_is(res, "tbl_df")
    expect_true(all(names(res) == c("id", "type", "createdAt", "lastUpdated","associatedDeals")))
  })
})
