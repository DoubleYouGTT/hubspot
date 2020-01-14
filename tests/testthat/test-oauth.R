test_that("access with oauth works", {
  skip_if_not(file.exists(".hubspot_token.rds"))
  devtools::load_all(path = gsub("\\/tests\\/testthat\\/", "", getwd()))
  contacts <- hs_contacts_raw(token_path = ".hubspot_token.rds")
  expect_is(contacts, "list")
  expect_equal(length(contacts), 2)
})

test_that("access with oauth and another app works", {
  skip_if_not(file.exists(".hubspot_otherapp.rds"))
  contacts <- hs_contacts_raw(token_path = ".hubspot_otherapp.rds")
  expect_is(contacts, "list")
  expect_equal(length(contacts), 2)
})
