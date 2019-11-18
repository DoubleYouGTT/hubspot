vcr::use_cassette("get_deal_pipelines", {
  test_that("get_deal_pipelines works", {
    res <- get_deal_pipelines()
    expect_is(res, "list")
  })
})
