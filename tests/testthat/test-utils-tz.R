vcr::use_cassette("utils-tz", {
  test_that("hubpot_tz works", {
    res <- hubspot_tz()
    expect_is(res, "character")
  })
})
