vcr::use_cassette("get_owners", {
    test_that("get_owners works", {
      res <- get_owners()
      expect_is(res, "list")
  })
})

vcr::use_cassette("get_owners_active", {
  test_that("get_owners works with includeInactive", {
    res <- get_owners(include_inactive = FALSE)
    expect_is(res, "list")
    expect_true(all(lengths(purrr::map(res, "remoteList")) > 0))
  })
})

vcr::use_cassette("get_owners_email", {
  test_that("get_owners works with email", {
    res1 <- get_owners()
    res <- get_owners(email = "demo@hubspot.com")
    expect_is(res, "list")
    expect_true(length(res) < length(res1))
    })
})

