vcr::use_cassette("get_contact_properties", {
  test_that("get_contact_properties works", {
    res <- suppressWarnings(
      get_contact_properties()
    )
    expect_is(res, "character")
    expect_true(length(res) > 10)
  })

  test_that("get_contact_properties gets warning", {
    res <- expect_warning(
      get_contact_properties(),
      "deprecated"
    )
  })
})
