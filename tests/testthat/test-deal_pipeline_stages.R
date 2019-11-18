vcr::use_cassette("deal_pipeline_stages", {
  test_that("deal_pipeline_stages works", {
    res <- deal_pipeline_stages()
    expect_is(res, "tbl_df")
    expect_true(all(c("pipelineId", "stageId", "createdAt", "label",
                      "displayOrder", "active", "probability",
                      "isClosed") %in%
                       names(res)))
  })
})
