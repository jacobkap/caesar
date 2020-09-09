context("test-errors-silent-stop")

test_that("returns silent", {
  expect_silent(caesar("Experience is the teacher of all things.",
                       shift = 3))
  expect_silent(caesar("Experience is the teacher of all things.",
                       shift = 0))

  expect_silent(caesar("HAshulhqfhclvcwkhcwhdfkhucricdoocwklqjva",
                       shift = 3,
                       decrypt = TRUE))
  expect_silent(caesar("Experience is the teacher of all things.",
                       shift = 0,
                       decrypt = TRUE))


})


test_that("caesar - returns errors", {
  # shift isn't a single number
  expect_error(caesar("Experience is the teacher of all things.",
                      shift = "2"),
               "shift must be a number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      shift = c("cat", "cat")),
               "shift must be a single number!")
  expect_error(caesar("HAshulhqfhclvcwkhcwhdfkhucricdoocwklqjva",
                      shift = 1:3,
                      decrypt = TRUE),
               "shift must be a single number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      shift = c(1:5, 7),
                      decrypt = TRUE),
               "shift must be a single number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      shift = c(1:5, 7, "cat"),
                      decrypt = TRUE),
               "shift must be a single number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      shift = as.Date("2011-01-22"),
                      decrypt = TRUE),
               "shift must be a number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      shift = mtcars,
                      decrypt = TRUE),
               "shift must be a single number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      shift = as.factor(2),
                      decrypt = TRUE))
  expect_error(caesar("Experience is the teacher of all things.",
                      shift = as.character(2),
                      decrypt = TRUE),
               "shift must be a number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      shift = as.data.frame(2),
                      decrypt = TRUE),
               "shift must be a number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      shift = TRUE,
                      decrypt = TRUE),
               "shift must be a number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      shift = FALSE,
                      decrypt = TRUE),
               "shift must be a number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      shift = NULL,
                      decrypt = TRUE),
               "shift must be a single number!")
  expect_error(caesar("Experience is the teacher of all things.",
                      shift = NA,
                      decrypt = TRUE),
               "shift must be a number!")



  # shift isn't a string
  expect_error(caesar(as.Date("2011-01-22"),
                      shift = 2),
               "text must be a string or vector of strings!")
  expect_error(caesar(mtcars,
                      shift = 2,
                      decrypt = TRUE),
               "text must be a string or vector of strings!")
  expect_error(caesar(as.factor(letters),
                      shift = 2,
                      decrypt = TRUE),
               "text must be a string or vector of strings!")

  expect_error(caesar(TRUE,
                      shift = 2),
               "text must be a string or vector of strings!")
  expect_error(caesar(FALSE,
                      shift = 2),
               "text must be a string or vector of strings!")





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



  # seed isn't a single string
  expect_error(seed_cipher(as.Date("2011-01-22"),
                           seed = 2),
               "text must be a string or vector of strings!")
  expect_error(seed_cipher(mtcars,
                           seed = 2,
                           decrypt = TRUE),
               "text must be a string or vector of strings!")


  expect_error(seed_cipher(TRUE,
                           seed = 2),
               "text must be a string or vector of strings!")
  expect_error(seed_cipher(FALSE,
                           seed = 2),
               "text must be a string or vector of strings!")
  expect_error(seed_cipher(NULL,
                           seed = 2,
                           decrypt = TRUE),
               "text must be a string or vector of strings!")
  expect_error(seed_cipher(NA,
                           seed = 2,
                           decrypt = TRUE),
               "text must be a string or vector of strings!")




})
