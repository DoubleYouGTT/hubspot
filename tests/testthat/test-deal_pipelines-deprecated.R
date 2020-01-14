vcr::use_cassette("get_deal_pipelines", {
  test_that("get_deal_pipelines works", {
    res <- suppressWarnings(
      get_deal_pipelines()
    )
    expect_is(res, "list")
  })

  test_that("get_deal_pipelines gets a warning", {
    expect_warning(
      get_deal_pipelines(),
      "deprecated"
    )
  })
})



vcr::use_cassette("deal_pipeline_stages", {
  test_that("deal_pipeline_stages works", {
    res <- suppressWarnings(
      deal_pipeline_stages()
    )
    expect_is(res, "tbl_df")
    expect_true(all(c(
      "pipelineId", "stageId", "createdAt", "label",
      "displayOrder", "active", "probability",
      "isClosed"
    ) %in%
      names(res)))
  })

  test_that("deal_pipeline_stages gets a warning", {
    expect_warning(deal_pipeline_stages(),
                   "deprecated")
  })


})

vcr::use_cassette("deal_pipelines", {
  test_that("deal_pipelines works", {
    res <- deal_pipelines()
    expect_is(res, "tbl_df")
    expect_true(all(c(
      "pipelineId", "createdAt", "objectType",
      "objectTypeId", "label",
      "displayOrder", "active", "default"
    ) %in%
      names(res)))
  })

  test_that("deal_pipelines gets a warning", {
    expect_warning(deal_pipelines(), "deprecated")
})

})
