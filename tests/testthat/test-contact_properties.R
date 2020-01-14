vcr::use_cassette("hs_contact_properties_raw", {
  test_that("hs_contact_properties_raw works", {
    res <- hs_contact_properties_raw()
    expect_is(res, "list")
  })
})

vcr::use_cassette("hs_contact_properties_tidy", {
  test_that("hs_contact_properties_tidy works", {
    res <- hs_contact_properties_tidy(view = "names")
    expect_is(res, "character")
    expect_true(length(res) > 10)
  })
})
