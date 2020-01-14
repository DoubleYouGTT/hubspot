test_that("access with oauth works", {
  skip_if_not(file.exists(".hubspot_token.rds"))
  contacts <- hubspot::hs_contacts_raw(token_path = ".hubspot_token.rds")
  expect_is(contacts, "list")
  expect_equal(length(contacts), 2)
})

test_that("access with oauth and another app works", {
  skip_if_not(file.exists(".hubspot_otherapp.rds"))
  contacts <- hubspot::hs_contacts_raw(token_path = ".hubspot_otherapp.rds")
  expect_is(contacts, "list")
  expect_equal(length(contacts), 2)
})
