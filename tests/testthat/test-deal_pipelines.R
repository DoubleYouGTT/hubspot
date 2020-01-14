vcr::use_cassette("hs_deal_pipelines_raw", {
  test_that("hs_deal_pipelines_raw works", {
    res <- hs_deal_pipelines_raw()
    expect_is(res, "list")
  })
})


vcr::use_cassette("hs_deal_pipelines_tidy_stages", {
  test_that("hs_deal_pipelines_tidy stages works", {
    res <- hs_deal_pipelines_tidy(view = "stages")
    expect_is(res, "tbl_df")
    expect_true(all(c(
      "pipelineId", "stageId", "createdAt", "label",
      "displayOrder", "active", "probability",
      "isClosed"
    ) %in%
      names(res)))
  })
})


vcr::use_cassette("hs_deal_pipelines_tidy_properties", {
  test_that("hs_deal_pipelines_tidy properties works", {
    res <- hs_deal_pipelines_tidy(view = "properties")
    expect_is(res, "tbl_df")
    expect_true(all(c(
      "pipelineId", "createdAt", "objectType",
      "objectTypeId", "label",
      "displayOrder", "active", "default"
    ) %in%
      names(res)))
  })
})
