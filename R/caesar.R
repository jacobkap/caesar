# Caesar cipher for encrypting and decrypting text.
#' Encrypt and decrypt text using the Caesar cipher.
#'
#' @param text
#' String or vector of strings to be ciphered or deciphered.
#' @param distance
#' A single whole number for how far to move the characters in the direction (positive or negative) you choose. If not a whole number, it will be rounded to nearest whole number.
#' @param decrypt
#' If TRUE, (not default) deciphers the coded text.
#'
#' @return
#' String of the ciphered/deciphered text
#' @export
#'
#' @examples
#' # Please see this for more info.
#' # https://en.wikipedia.org/wiki/Caesar_cipher
#'
#' caesar("Experience is the teacher of all things.")
#' caesar("HAshulhqfhclvcwkhcwhdfkhucricdoocwklqjva", decrypt = TRUE)
#'
#' caesar("Veni, vidi, vici.",  distance = 40)
#' caesar(",S1WKN9WRWKN9WQWL", distance = 40, decrypt = TRUE)
#'
#' caesar("No one is so brave that he is not disturbed by something unexpected.", distance = -12)
#' caesar("Bc[cb:[,g[gc[{f]j:[h>]h[>:[,g[bch[;,ghif{:;[{m[gca:h>,b<[ib:ld:}h:;`",
#'        distance = -12, decrypt = TRUE)
caesar <- function(text, distance = 3, decrypt = FALSE) {
  if (!is.character(text)) {
    stop("text must be a string!")
  }

  if (length(distance) != 1) {
    stop("distance must be a single number!")
  }

  if (!is.numeric(distance)) {
    stop("distance must be a number!")
  }

  text <- gsub('\\"', "\\'", text)

  distance <- round(distance)
  distance <- distance %% length(.alphabet$original)
  .alphabet$number <- 1:nrow(.alphabet)
  .alphabet$cipher <- binhf::shift(.alphabet$original,
                                  places = -distance)

  if (decrypt == FALSE) {
    for (i in 1:nchar(text)) {
      index_num <- which(substr(text, i, i) == .alphabet$original)
      substr(text, i, i) <- .alphabet$cipher[index_num]
    }
  } else {
    for (i in 1:nchar(text)) {
      index_num <- which(substr(text, i, i) == .alphabet$cipher)
      substr(text, i, i) <- .alphabet$original[index_num]
    }
  }
  return(text)
}

#' Encrypt and decrypt text using pseduorandom number generation based on the seed set.
#'
#' @param text
#' String to be ciphered or deciphered
#' @param seed
#' A single number to set the seed which will pseudorandomly rearrange
#' the original characters
#' @param decrypt
#' If TRUE, deciphers coded text
#'
#' @return
#' String of the ciphered/deciphered text
#' @export
#'
#' @examples
#' seed_cipher("As a rule, men worry more about what they can't see than about what they can.")
#' seed_cipher("O8GdG@SfhEG9hUG*A@@nG9A@hGd:AS_G*Wd_G_WhnG)dUg_G8hhG_WdUGd:AS_G*Wd_G_WhnG)dUx", decrypt = TRUE)
#'
#'
#' seed_cipher("Men willingly believe what they wish.", seed = 2354)
#' seed_cipher("q39l*D66D9;6.l%36D3d3l*<p4l4<3.l*D <h", seed = 2354, decrypt = TRUE)
#'
#' seed_cipher("What we wish, we readily believe, and what we ourselves think, we imagine others think also.", seed = -100)
#' seed_cipher("}Nf,&3C&3etN4&3C&vCf>eB8&xCBeC]C4&fj>&3Nf,&3C&P9vtCB]Ct&,Nej:4&3C&e-fZejC&P,NCvt&,Nej:&fBtP ", seed = -100, decrypt = TRUE)
seed_cipher <- function(text, seed = 64, decrypt = FALSE) {
  if (!is.character(text)) {
    stop("text must be a string!")
  }

  if (length(seed) != 1) {
    stop("seed must be a single number!")
  }


  if (!is.numeric(seed)) {
    stop("seed must be a number!")
  }
  text <- gsub('\\"', "\\'", text)

  set.seed(seed)
  .alphabet$cipher <- .alphabet$original[sample(1:nrow(.alphabet),
                                              nrow(.alphabet),
                                              replace = FALSE)]


  if (!decrypt) {
    for (i in 1:nchar(text)) {
      index_num <- which(substr(text, i, i) == .alphabet$original)
      substr(text, i, i) <- .alphabet$cipher[index_num]
    }
  } else {
    for (i in 1:nchar(text)) {
      index_num <- which(substr(text, i, i) == .alphabet$cipher)
      substr(text, i, i) <- .alphabet$original[index_num]
    }
  }

  return(text)
}
