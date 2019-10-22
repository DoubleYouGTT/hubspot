context("test-deal_pipelines")

test_that("deal_pipelines works", {
  res <- deal_pipelines()
  expect_is(res, "tbl_df")
  expect_true(all(c("pipelineId", "createdAt", "objectType",
                    "objectTypeId", "label",
                    "displayOrder", "active", "default") %in%
                    names(res)))
})
