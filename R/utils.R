alphabet <- data.frame(original = c(letters,
                                    LETTERS,
                                    0:9,
                                    "!",
                                    "@",
                                    "#",
                                    "$",
                                    "%",
                                    "^",
                                    "&",
                                    "*",
                                    "(",
                                    ")",
                                    "-",
                                    "_",
                                    "+",
                                    "=",
                                    "`",
                                    "~",
                                    "[",
                                    "]",
                                    "{",
                                    "}",
                                    ";",
                                    ":",
                                    "'",
                                    "<",
                                    ">",
                                    ",",
                                    ".",
                                    "/",
                                    " "),
                       stringsAsFactors = FALSE)


encrypt_decrypt <- function(text, .alphabet, decrypt) {
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
