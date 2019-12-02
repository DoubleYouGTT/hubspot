test_that("access with oauth works", {
  skip_if_not(file.exists(".hubspot_token.rds"))
  library("hubspot")
  contacts <- get_contacts(token_path = ".hubspot_token.rds")
  expect_is(contacts, "list")
  expect_equal(length(contacts), 2)
})
