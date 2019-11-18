vcr::use_cassette("get_contacts", {
  test_that("get_contacts works", {
    res <- get_contacts(max_iter = 1, max_properties = 1)
    expect_is(res, "list")
  })
})
