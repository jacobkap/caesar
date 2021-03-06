
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/caesar)](https://cran.r-project.org/package=caesar)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/jacobkap/caesar?branch=master&svg=true)](https://ci.appveyor.com/project/jacobkap/caesar)
[![Build
Status](https://travis-ci.org/jacobkap/caesar.svg?branch=master)](https://travis-ci.org/jacobkap/caesar)
[![](http://cranlogs.r-pkg.org/badges/grand-total/caesar?color=blue)](https://cran.r-project.org/package=caesar)

## Overview

The goal of caesar is to encrypt and decrypt strings using a simple
Caesar cipher or a pseudorandom number generation.

## Installation

``` r
To install this package, use the code
install.packages("caesar")


# The development version is available on Github.
# install.packages("devtools")
devtools::install_github("jacobkap/caesar")
```

## Usage

``` r
library(caesar)
```

There are two functions in this package:

  - `caesar()` uses a traditional Caesar cipher to encrypt or decrypt
    text.  
  - `seed_cipher()` encrypts or decrypts text based on a specific seed.

For both functions the only required parameter is `text` which is a
string or vector of string that you want to encrypt/decrypt. The
functions will output a string with the text encrypted (or decrypted).
If you do decide to change the default value of the `shift` parameter
(`seed` in `seed_cipher()`), which you should to make it secure, make
sure not to forget the value you set.

# caesar()

The Caesar cipher is an ancient cipher which is made by shifting the
letters of the alphabet by a set number. So a shift of -3, for example,
would move each letter to the left by 3, such that A would become X and
D would become A. For this package it also includes numbers and
punctuation but the concept is the same.

``` r
 caesar::caesar(text = "As a rule, men worry more about what they can't see than about what they can.")
```

    ## [1] "Dvcdcuxoh cphqczruuBcpruhcderxwczkdwcwkhBcfdq,wcvhhcwkdqcderxwczkdwcwkhBcfdqa"

You can set the shift yourself as one of the optional parameters. This
can be any whole number (positive or negative). If you do decide to
change the default value of the `shift` parameter (which you should to
make it secure), make sure not to forget the value you set.

``` r
 caesar::caesar(text = "As a rule, men worry more about what they can't see than about what they can.", 
        shift = -100)
```

    ## [1] "rj};}ilc>[}d>e}nfiip}dfi>};:flk}n/;k}k/>p}';e=k}j>>}k/;e};:flk}n/;k}k/>p}';e]"

To decrypt the text change the parameter `decrypt` to TRUE.

``` r
 caesar::caesar(text = "Dvcdcuxoh cphqczruuBcpruhcderxwczkdwcwkhBcfdq,wcvhhcwkdqcderxwczkdwcwkhBcfdqa",
        decrypt = TRUE)
```

    ## [1] "As a rule, men worry more about what they can't see than about what they can."

Make sure the shift value is the same as it was when encrypted.

``` r
 caesar::caesar(text = "rj};}ilc>[}d>e}nfiip}dfi>};:flk}n/;k}k/>p}';e=k}j>>}k/;e};:flk}n/;k}k/>p}';e]", 
        shift = -100, 
        decrypt = TRUE)
```

    ## [1] "As a rule, men worry more about what they can't see than about what they can."

# seed\_cipher()

This method randomizes the alphabet based on a seed you set, making it
far more secure than the Caesar cipher.

``` r
 caesar::seed_cipher(text = "As a rule, men worry more about what they can't see than about what they can.")
```

    ## [1] "R#GdG<VfhbG$hXGeC<<oG$C<hGd+CV/Ge0d/G/0hoG dXg/G#hhG/0dXGd+CV/Ge0d/G/0hoG dX_"

You can set the seed yourself as one of the optional parameters. This
can be any whole number (positive or negative). If you do decide to
change the default value of the `seed` parameter (which you should to
make it secure), make sure not to forget the value you set.

``` r
 caesar::seed_cipher(text = "As a rule, men worry more about what they can't see than about what they can.", 
        seed = -100)
```

    ## [1] "Eucfc{%>D c-Dkc8S{{$c-S{DcfyS%*c8Qf*c*QD$cofkR*cuDDc*QfkcfyS%*c8Qf*c*QD$cofki"

To decrypt the text change the parameter `decrypt` to TRUE.

``` r
 caesar::seed_cipher(text = "R#GdG<VfhbG$hXGeC<<oG$C<hGd+CV/Ge0d/G/0hoGdXg/G#hhG/0dXGd+CV/Ge0d/G/0hoG dX_",
        decrypt = TRUE)
```

    ## [1] "As a rule, men worry more about what they an't see than about what they can."

Make sure the seed value is the same as it was when encrypted.

``` r
 caesar::seed_cipher(text = "Eucfc{%>Dc-Dkc8S{{$c-S{DcfyS%*c8Qf*c*QD$cofkR*cuDDc*QfkcfyS%*c8Qf*c*QD$cofki", 
        seed = -100, 
        decrypt = TRUE)
```

    ## [1] "As a rule men worry more about what they can't see than about what they can."
