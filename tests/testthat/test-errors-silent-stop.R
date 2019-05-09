context("test-errors-silent-stop")

test_that("returns silent", {
  expect_silent(caesar("Experience is the teacher of all things.",
                      distance = 3))
  expect_silent(caesar("Experience is the teacher of all things.",
                      distance = 0))

  expect_silent(caesar("HAshulhqfhclvcwkhcwhdfkhucricdoocwklqjva",
                      distance = 3,
                      decrypt = TRUE))
  expect_silent(caesar("Experience is the teacher of all things.",
                      distance = 0,
                      decrypt = TRUE))


})


test_that("caesar - returns errors", {
  # Distance isn't a single number
  expect_error(caesar("Experience is the teacher of all things.",
                       distance = "2"),
               "distance must be a number!")
  expect_error(caesar("Experience is the teacher of all things.",
                       distance = c("cat", "cat")),
               "distance must be a single number!")
  expect_error(caesar("HAshulhqfhclvcwkhcwhdfkhucricdoocwklqjva",
                       distance = 1:3,
                       decrypt = TRUE),
               "distance must be a single number!")
  expect_error(caesar("Experience is the teacher of all things.",
                       distance = c(1:5, 7),
                       decrypt = TRUE),
               "distance must be a single number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      distance = c(1:5, 7, "cat"),
                      decrypt = TRUE),
               "distance must be a single number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      distance = as.Date("2011-01-22"),
                      decrypt = TRUE),
               "distance must be a number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      distance = mtcars,
                      decrypt = TRUE),
               "distance must be a single number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      distance = as.factor(2),
                      decrypt = TRUE))
  expect_error(caesar("Experience is the teacher of all things.",
                      distance = as.character(2),
                      decrypt = TRUE),
               "distance must be a number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      distance = as.data.frame(2),
                      decrypt = TRUE),
               "distance must be a number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      distance = TRUE,
                      decrypt = TRUE),
               "distance must be a number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      distance = FALSE,
                      decrypt = TRUE),
               "distance must be a number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      distance = NULL,
                      decrypt = TRUE),
               "distance must be a single number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      distance = NA,
                      decrypt = TRUE),
               "distance must be a number!")



  # Distance isn't a string
  expect_error(caesar(2,
                      distance = 2),
               "text must be a string!")
  expect_error(caesar(as.Date("2011-01-22"),
                      distance = 2),
               "text must be a string!")
  expect_error(caesar(mtcars,
                      distance = 2,
                      decrypt = TRUE),
               "text must be a string!")
  expect_error(caesar(as.factor(letters),
                      distance = 2,
                      decrypt = TRUE),
               "text must be a string!")
  expect_error(caesar(2:10,
                      distance = 2,
                      decrypt = TRUE),
               "text must be a string!")

  expect_error(caesar(TRUE,
                      distance = 2),
               "text must be a string!")
  expect_error(caesar(FALSE,
                      distance = 2),
               "text must be a string!")
  expect_error(caesar(NULL,
                      distance = 2,
                      decrypt = TRUE),
               "text must be a string!")
  expect_error(caesar(NA,
                      distance = 2,
                      decrypt = TRUE),
               "text must be a string!")



})



test_that("seed - returns errors", {
  # seed isn't a single number
  expect_error(seed_cipher("Experience is the teacher of all things.",
                           seed = "2"),
               "seed must be a number!")
  expect_error(seed_cipher("Experience is the teacher of all things.",
                           seed = c("cat", "cat")),
               "seed must be a single number!")
  expect_error(seed_cipher("HAshulhqfhclvcwkhcwhdfkhucricdoocwklqjva",
                           seed = 1:3,
                           decrypt = TRUE),
               "seed must be a single number!")
  expect_error(seed_cipher("Experience is the teacher of all things.",
                           seed = c(1:5, 7),
                           decrypt = TRUE),
               "seed must be a single number!")
  expect_error(seed_cipher("Experience is the teacher of all things.",
                           seed = c(1:5, 7, "cat"),
                           decrypt = TRUE),
               "seed must be a single number!")
  expect_error(seed_cipher("Experience is the teacher of all things.",
                           seed = as.Date("2011-01-22"),
                           decrypt = TRUE),
               "seed must be a number!")
  expect_error(seed_cipher("Experience is the teacher of all things.",
                           seed = mtcars,
                           decrypt = TRUE),
               "seed must be a single number!")
  expect_error(seed_cipher("Experience is the teacher of all things.",
                           seed = as.factor(2),
                           decrypt = TRUE))
  expect_error(seed_cipher("Experience is the teacher of all things.",
                           seed = as.character(2),
                           decrypt = TRUE),
               "seed must be a number!")
  expect_error(seed_cipher("Experience is the teacher of all things.",
                           seed = as.data.frame(2),
                           decrypt = TRUE),
               "seed must be a number!")
  expect_error(seed_cipher("Experience is the teacher of all things.",
                           seed = TRUE,
                           decrypt = TRUE),
               "seed must be a number!")
  expect_error(seed_cipher("Experience is the teacher of all things.",
                           seed = FALSE,
                           decrypt = TRUE),
               "seed must be a number!")
  expect_error(seed_cipher("Experience is the teacher of all things.",
                           seed = NULL,
                           decrypt = TRUE),
               "seed must be a single number!")
  expect_error(seed_cipher("Experience is the teacher of all things.",
                           seed = NA,
                           decrypt = TRUE),
               "seed must be a number!")



  # seed isn't a string
  expect_error(seed_cipher(2,
                           seed = 2),
               "text must be a string!")
  expect_error(seed_cipher(as.Date("2011-01-22"),
                           seed = 2),
               "text must be a string!")
  expect_error(seed_cipher(mtcars,
                           seed = 2,
                           decrypt = TRUE),
               "text must be a string!")
  expect_error(seed_cipher(as.factor(letters),
                           seed = 2,
                           decrypt = TRUE),
               "text must be a string!")
  expect_error(seed_cipher(2:10,
                           seed = 2,
                           decrypt = TRUE),
               "text must be a string!")

  expect_error(seed_cipher(TRUE,
                           seed = 2),
               "text must be a string!")
  expect_error(seed_cipher(FALSE,
                           seed = 2),
               "text must be a string!")
  expect_error(seed_cipher(NULL,
                           seed = 2,
                           decrypt = TRUE),
               "text must be a string!")
  expect_error(seed_cipher(NA,
                           seed = 2,
                           decrypt = TRUE),
               "text must be a string!")



})
