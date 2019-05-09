# Caesar cipher for encrypting and decrypting text.
#' Encrypt and decrypt text using the Caesar cipher.
#'
#' @param text
#' String to be ciphered or deciphered.
#' @param shift
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
#' caesar("Veni, vidi, vici.",  shift = 40)
#' caesar(",S1WKN9WRWKN9WQWL", shift = 40, decrypt = TRUE)
#'
#' caesar("No one is so brave that he is not disturbed by something unexpected.", shift = -12)
#' caesar("Bc[cb:[,g[gc[{f]j:[h>]h[>:[,g[bch[;,ghif{:;[{m[gca:h>,b<[ib:ld:}h:;`",
#'        shift = -12, decrypt = TRUE)
caesar <- function(text,
                   shift = 3,
                   decrypt = FALSE) {
  if (!is.character(text) || length(text) != 1) {
    stop("text must be a single string!")
  }

  if (length(shift) != 1) {
    stop("shift must be a single number!")
  }

  if (!is.numeric(shift)) {
    stop("shift must be a number!")
  }

  text <- gsub('\\"', "\\'", text)

  shift <- round(shift)
  shift <- shift %% length(.alphabet$original)
  .alphabet$number <- 1:nrow(.alphabet)
  .alphabet$cipher <- binhf::shift(.alphabet$original,
                                   places = -shift)

  text <- encrypt_decrypt(text, .alphabet, decrypt)
  return(text)
}

#' Encrypt and decrypt text using pseudorandom number generation based on the seed set.
#'
#' @param text
#' String to be ciphered or deciphered.
#' @param seed
#' A single number to set the seed which will pseudorandomly rearrange
#' the original characters
#' @param decrypt
#' If TRUE (not default), deciphers the coded text.
#'
#' @return
#' String of the ciphered/deciphered text
#' @export
#'
#' @examples
#' seed_cipher("Cowards die many times before their deaths")
#' seed_cipher("'Ced<,#G,QhG$dXoG/Q$h#G+h(C<hG/0hQ<G,hd/0#",
#'             decrypt = TRUE)
#'
#' seed_cipher("Men willingly believe what they wish.",
#'              seed = 2354)
#' seed_cipher("q39l*D66D9;6.l%36D3d3l*<p4l4<3.l*D <h",
#'             seed = 2354,
#'             decrypt = TRUE)
#'
#' seed_cipher("the valiant never taste of death but once.",
#'             seed = -100)
#' seed_cipher("*QDc3f>efk*ckD3D{c*fu*DcS'c]Df*Qcy%*cSkoDi",
#'             seed = -100,
#'             decrypt = TRUE)
seed_cipher <- function(text,
                        seed = 64,
                        decrypt = FALSE) {
  if (!is.character(text) || length(text) != 1) {
    stop("text must be a single string!")
  }

  if (length(seed) != 1) {
    stop("seed must be a single number!")
  }

  if (!is.numeric(seed)) {
    stop("seed must be a number!")
  }

  text <- gsub('\\"', "\\'", text)

  # Sets the R version so seed always the same regardless of
  # version user is using.
  RNGversion("3.5.3")
  base::set.seed(seed)
  .alphabet$cipher <- .alphabet$original[sample(1:nrow(.alphabet),
                                                nrow(.alphabet),
                                                replace = FALSE)]


  text <- encrypt_decrypt(text, .alphabet, decrypt)
  return(text)
}


