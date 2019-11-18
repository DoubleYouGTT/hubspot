vcr::use_cassette("get_contact_properties", {
  test_that("get_contact_properties works", {
    res <- get_contact_properties()
    expect_is(res, "character")
    expect_true(length(res) > 10)
  })
})
