# token with default app
hubspot::hubspot_token_create(token_path = "tests/testthat/.hubspot_token.rds",
                              set_renv = FALSE)

# token with another app
myapp <- list(client_secret = "6e0e17e9-a8e4-4fe4-8ac8-c23ba57b9ab2",
              client_id = "8483e11f-2c86-4436-a7d7-da5dd99eb54c",
              app_id = "207639",
              scope = c("actions", "contacts"),
              optional_scope = NULL)
hubspot::hubspot_token_create(app_info = myapp,
                              set_renv = FALSE,
                              token_path = "tests/testthat/.hubspot_otherapp.rds")
