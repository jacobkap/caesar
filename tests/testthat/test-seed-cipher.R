context("test-seed-cipher")

test_that("Caesar encryption works", {
  expect_equal(seed_cipher("Veni Vidi Vici.",
                           seed = 64),
               "BhXQGBQ,QGBQ Q_")
  expect_equal(seed_cipher(c("Veni Vidi Vici.", NA, NULL),
                           seed = 64),
               c("BhXQGBQ,QGBQ Q_", NA, NULL))

  test_that("Caesar encryption works", {
    expect_equal(seed_cipher(c("Veni Vidi Vici.",
                               "Vici. Vidi Veni",
                               "The best way of avenging thyself is not to become like the wrong doer."),
                             seed = 64),
                 c("BhXQGBQ,QGBQ Q_",
                   "BQ Q_GBQ,QGBhXQ",
                   "-0hG+h#/GedoGC(Gd2hX]QX]G/0o#hf(GQ#GXC/G/CG+h C$hGfQEhG/0hGe<CX]G,Ch<_"))


  })

  test_that("Caesar deencryption works", {
    expect_equal(seed_cipher(c("BhXQGBQ,QGBQ Q_",
                               "-0hG+h#/GedoGC(Gd2hX]QX]G/0o#hf(GQ#GXC/G/CG+h C$hGfQEhG/0hGe<CX]G,Ch<_"),
                             seed = 64,
                             decrypt = TRUE),
                 c("Veni Vidi Vici.",
                   "The best way of avenging thyself is not to become like the wrong doer."))
    expect_equal(seed_cipher(c("BhXQGBQ,QGBQ Q_",
                               "-0hG+h#/GedoGC(Gd2hX]QX]G/0o#hf(GQ#GXC/G/CG+h C$hGfQEhG/0hGe<CX]G,Ch<_", NA, NULL),
                             seed = 64,
                             decrypt = TRUE),
                 c("Veni Vidi Vici.",
                   "The best way of avenging thyself is not to become like the wrong doer.", NA, NULL))
  })

})


