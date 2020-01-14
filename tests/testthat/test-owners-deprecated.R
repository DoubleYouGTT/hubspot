vcr::use_cassette("get_owners", {
  test_that("get_owners works", {
    res <- suppressWarnings(get_owners())
    expect_is(res, "list")
  })

  test_that("get_owners gets a warning", {
    expect_warning(
      get_owners(),
      "deprecated"
    )
  })
})
vcr::use_cassette("get_owners_active", {
  test_that("get_owners works with includeInactive", {
    res <- suppressWarnings(get_owners(include_inactive = FALSE))
    expect_is(res, "list")
    expect_true(all(lengths(purrr::map(res, "remoteList")) > 0))
  })
})

vcr::use_cassette("get_owners_email", {
  test_that("get_owners works with email", {
    res1 <- suppressWarnings(get_owners())
    res <- suppressWarnings(get_owners(email = "demo@hubspot.com"))
    expect_is(res, "list")
    expect_true(length(res) < length(res1))
  })
})



vcr::use_cassette("owners", {
  test_that("owners works", {
    res <- suppressWarnings(
      owners()
    )
    expect_is(res, "tbl_df")
    expect_true(ncol(res) >= 12)
  })

  test_that("owners gets a warning", {
    expect_warning(
      owners(),
      "deprecated"
    )
  })
})
