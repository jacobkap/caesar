# Caesar cipher for encrypting and decrypting text

#' Encrypt and Decrypt text using the Caesar cipher
#'
#' @param text
#' String to be ciphered or deciphered
#' @param direction
#' Move the original characters the right or to the left
#' @param distance
#' How far to move the characters in the direction you choose.
#' @param decrypt
#' If TRUE, deciphers the coded text
#'
#' @return
#' String of the ciphered/deciphered text
#' @export
#'
#' @examples
#' # Please see this for more info.
#' # https://en.wikipedia.org/wiki/Caesar_cipher
#'
#' caesar("cats are friends!")
#' caesar("fdwv@duh@iulhqgv&", decrypt = TRUE)
#'
#' caesar("cats are friends!", direction = "right", distance = 40)
#' caesar("ki10:izm:nzqmvl0;", direction = "right", distance = 40, decrypt = TRUE)
#'
#' caesar("cats are #1 friend!", direction = "left", distance = -12)
#' caesar(", hgy f&ypy%f:&b@z", direction = "left", distance = -12, decrypt = TRUE)
caesar <- function(text, direction = "left", distance = 3, decrypt = FALSE) {
  if (!is.character(text)) {
    stop("text must be a string!")
  }

  if (!is.numeric(distance)) {
    stop("distance must be a number!")
  }

  if (!distance %in% -46:46) {
    stop("distance must be between -46 and 46")
  }

  direction <- tolower(direction)
  if (!direction %in% c("left", "right")) {
    stop("direction must be 'left' or 'right'")
  }


  alphabet <- data.frame(original = letters,
                         stringsAsFactors = FALSE)
  special <- data.frame(original = c(0:9, " ", "!", ",",
                                     "@", "&", "%",
                                     "-", "_", ":",
                                     ";", "?", "'"))
  alphabet <- rbind(alphabet, special)
  alphabet$cipher <- binhf::shift(alphabet$original,
                                  places = distance,
                                  dir = direction)
  alphabet <- rbind(alphabet, data.frame(original = c("#", "\n"),
                                         cipher = c("#", "\n")))


  if (!decrypt) {
    text <- tolower(text)
    text <- gsub("[^[:alnum:][:space:]',!@&%-_:;]", "", text)
    text <- gsub("\\.", "", text)
    text <- gsub(" +", " ", text)

    for (i in 1:nchar(text)) {
      index_num <- which(substr(text, i, i) == alphabet$original)
      substr(text, i, i) <- alphabet$cipher[index_num]
    }
  } else {
    text <- gsub(" +", " ", text)
    for (i in 1:nchar(text)) {
      index_num <- which(substr(text, i, i) == alphabet$cipher)
      substr(text, i, i) <- alphabet$original[index_num]
    }
  }

  text <- gsub("\\\n", "\n#", text)
  text <- gsub("#+", "#", text)
  cat(text)
  return(text)
}

#' Encrypt and Decrypt text using pseduorandom number generation
#'
#' @param text
#' String to be ciphered or deciphered
#' @param seed
#' A number to set the seed which will pseudorandomly rearrange
#' the original characters
#' @param decrypt
#' If TRUE, deciphers coded text
#'
#' @return
#' String of the ciphered/deciphered text
#' @export
#'
#' @examples
#' seed_cipher("cats are friends!")
#' seed_cipher("bc204c5d495ud?:08", decrypt = TRUE)
#'
#'
#' seed_cipher("cats are friends!", seed = 2354)
#' seed_cipher("li%1sid3szdp3 j1g", seed = 2354, decrypt = TRUE)
#'
#' seed_cipher("cats are #1 friend!", seed = -100)
#' seed_cipher("hd2imdjpmfm-jcpe&q", seed = -100, decrypt = TRUE)
seed_cipher <- function(text, seed = 64, decrypt = FALSE) {
  if (!is.character(text)) {
    stop("text must be a string!")
  }

  if (!is.numeric(seed)) {
    stop("seed must be a number!")
  }

  alphabet <- data.frame(original = letters,
                         stringsAsFactors = FALSE)
  special <- data.frame(original = c(0:9, " ", "!", ",",
                                     "@", "&", "%",
                                     "-", "_", ":",
                                     ";", "?", "'"))
  alphabet <- rbind(alphabet, special)
  set.seed(seed)
  alphabet$cipher <- alphabet$original[sample(1:48, 48, replace = FALSE)]
  alphabet <- rbind(alphabet, data.frame(original = c("#", "\n"),
                                         cipher = c("#", "\n")))


  if (!decrypt) {
    text <- tolower(text)
    text <- gsub("[^[:alnum:][:space:]',!@&%-_:;]", "", text)
    text <- gsub("\\.", "", text)
    text <- gsub(" +", " ", text)


    for (i in 1:nchar(text)) {
      index_num <- which(substr(text, i, i) == alphabet$original)
      substr(text, i, i) <- alphabet$cipher[index_num]
    }
  } else {
    text <- gsub(" +", " ", text)
    for (i in 1:nchar(text)) {
      index_num <- which(substr(text, i, i) == alphabet$cipher)
      substr(text, i, i) <- alphabet$original[index_num]
    }
  }

  text <- gsub("\\\n", "\n#", text)
  text <- gsub("#+", "#", text)
  cat(text)
  return(text)
}
