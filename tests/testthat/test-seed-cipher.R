context("test-seed-cipher")

test_that("Caesar encryption works", {
  expect_equal(seed_cipher("Veni Vidi Vici.",
                      seed = 64),
               "BhXQGBQ,QGBQ Q_")


})

test_that("Caesar deencryption works", {
  expect_equal(seed_cipher("BhXQGBQ,QGBQ Q_",
                           seed = 64,
                           decrypt = TRUE),
               "Veni Vidi Vici.")


})
