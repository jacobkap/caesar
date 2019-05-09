context("test-caesar-cipher")

test_that("Caesar encryption works", {
  expect_equal(caesar("Experience is the teacher of all things.",
                      distance = 3),
               "HAshulhqfhclvcwkhcwhdfkhucricdoocwklqjva")
  expect_equal(caesar("Experience is the teacher of all things.",
                      distance = 0),
               "Experience is the teacher of all things.")
  expect_equal(caesar("Experience is the teacher of all things.",
                      distance = 5),
               "JCujwnjshjenxeymjeyjfhmjwetkefqqeymnslxc")
  expect_equal(caesar("Experience is the teacher of all things.",
                      distance = -10),
               "unf<h/<d:<{/i{j.<{j<}:.<h{e>{}bb{j./d,i[")
  expect_equal(caesar("It is easier to find men who will volunteer to die, than to find those who are willing to endure pain with patience.",
                      distance = 15),
               "XIoxHotpHxtGoIDouxCsoBtCoLwDoLxAAoKDAJCIttGoIDosxtloIwpCoIDouxCsoIwDHtoLwDopGtoLxAAxCvoIDotCsJGtoEpxCoLxIwoEpIxtCrtm")
  expect_equal(caesar("It is easier to find men who will volunteer to die, than to find those who are willing to endure pain with patience.",
                      distance = -17),
               "rc_;b_[+b;[a_c._];,~_>[,_f}._f;<<_e.<d,c[[a_c._~;[(_c}+,_c._];,~_c}.b[_f}._+a[_f;<<;,{_c._[,~da[_/+;,_f;c}_/+c;[,`[)")
  expect_equal(caesar("What we wish, we readily believe, and what we ourselves think, we imagine others think also. 123 !@#",
                      distance = -17),
               "F}+c_f[_f;b}(_f[_a[+~;<h_=[<;[e[(_+,~_f}+c_f[_.dab[<e[b_c};,'(_f[_;>+{;,[_.c}[ab_c};,'_+<b.)_KLM_TUV")
  expect_equal(caesar("What we wish, we readily believe, and what we ourselves think, we imagine others think also. 123 !@#",
                      distance = 1),
               "Xibuaxfaxjti.axfasfbejmzacfmjfwf.aboeaxibuaxfapvstfmwftauijol.axfajnbhjofapuifstauijolabmtp/a234a@#$")
  expect_equal(caesar("Veni, vidi, vici. (I came, I saw, I conquered.)",
                      distance = 1),
               "Wfoj.awjej.awjdj/a)Jadbnf.aJatbx.aJadporvfsfe/-")
  expect_equal(caesar("Veni, vidi, vici. (I came, I saw, I conquered.)",
                      distance = 5),
               "0jsnbeAninbeAnhnce=NehfrjbeNexfBbeNehtsvzjwjic`")



  expect_equal(caesar("Veni, vidi, vici. (I came, I saw, I conquered.)",
                      distance = 100),
               "4nwrfiErmrfiErlrgi]RiljvnfiRiBjFfiRilxwzDnAnmg{")
  expect_equal(caesar("Veni, vidi, vici. (I came, I saw, I conquered.)",
                      distance = 1500),
               "aW50OR$0V0OR$0U0PRx[RUS4WOR[R!S%OR[RU658#W9WVPy")
  expect_equal(caesar("Veni, vidi, vici. (I came, I saw, I conquered.)",
                      distance = -100),
               "M>e [}m < [}m ' ]}9z}';d>[}z}j;n[}z}'fehl>i><]!")
  expect_equal(caesar("Veni, vidi, vici. (I came, I saw, I conquered.)",
                      distance = -123),
               "p@-^36{^!^36{^9^46Mc697)@36c6~7}36c69_-=]@`@!4N")


})



test_that("Caesar deencryption works", {
  expect_equal(caesar("HAshulhqfhclvcwkhcwhdfkhucricdoocwklqjva",
                      distance = 3,
                      decrypt = TRUE),
               "Experience is the teacher of all things.")
  expect_equal(caesar("Experience is the teacher of all things.",
                      distance = 0,
                      decrypt = TRUE),
               "Experience is the teacher of all things.")
  expect_equal(caesar("JCujwnjshjenxeymjeyjfhmjwetkefqqeymnslxc",
                      distance = 5,
                      decrypt = TRUE),
               "Experience is the teacher of all things.")
  expect_equal(caesar("unf<h/<d:<{/i{j.<{j<}:.<h{e>{}bb{j./d,i[",
                      distance = -10,
                      decrypt = TRUE),
               "Experience is the teacher of all things.")
  expect_equal(caesar("XIoxHotpHxtGoIDouxCsoBtCoLwDoLxAAoKDAJCIttGoIDosxtloIwpCoIDouxCsoIwDHtoLwDopGtoLxAAxCvoIDotCsJGtoEpxCoLxIwoEpIxtCrtm",
                      distance = 15,
                      decrypt = TRUE),
               "It is easier to find men who will volunteer to die, than to find those who are willing to endure pain with patience.")
  expect_equal(caesar("rc_;b_[+b;[a_c._];,~_>[,_f}._f;<<_e.<d,c[[a_c._~;[(_c}+,_c._];,~_c}.b[_f}._+a[_f;<<;,{_c._[,~da[_/+;,_f;c}_/+c;[,`[)",
                      distance = -17,
                      decrypt = TRUE),
               "It is easier to find men who will volunteer to die, than to find those who are willing to endure pain with patience.")
  expect_equal(caesar("F}+c_f[_f;b}(_f[_a[+~;<h_=[<;[e[(_+,~_f}+c_f[_.dab[<e[b_c};,'(_f[_;>+{;,[_.c}[ab_c};,'_+<b.)_KLM_TUV",
                      distance = -17,
                      decrypt = TRUE),
               "What we wish, we readily believe, and what we ourselves think, we imagine others think also. 123 !@#")
  expect_equal(caesar("Xibuaxfaxjti.axfasfbejmzacfmjfwf.aboeaxibuaxfapvstfmwftauijol.axfajnbhjofapuifstauijolabmtp/a234a@#$",
                      distance = 1,
                      decrypt = TRUE),
               "What we wish, we readily believe, and what we ourselves think, we imagine others think also. 123 !@#")
  expect_equal(caesar("Wfoj.awjej.awjdj/a)Jadbnf.aJatbx.aJadporvfsfe/-",
                      distance = 1,
                      decrypt = TRUE),
               "Veni, vidi, vici. (I came, I saw, I conquered.)")
  expect_equal(caesar("0jsnbeAninbeAnhnce=NehfrjbeNexfBbeNehtsvzjwjic`",
                      distance = 5,
                      decrypt = TRUE),
               "Veni, vidi, vici. (I came, I saw, I conquered.)")


  expect_equal(caesar("4nwrfiErmrfiErlrgi]RiljvnfiRiBjFfiRilxwzDnAnmg{",
                      distance = 100,
                      decrypt = TRUE),
               "Veni, vidi, vici. (I came, I saw, I conquered.)")
  expect_equal(caesar("aW50OR$0V0OR$0U0PRx[RUS4WOR[R!S%OR[RU658#W9WVPy",
                      distance = 1500,
                      decrypt = TRUE),
               "Veni, vidi, vici. (I came, I saw, I conquered.)")
  expect_equal(caesar("M>e [}m < [}m ' ]}9z}';d>[}z}j;n[}z}'fehl>i><]!",
                      distance = -100,
                      decrypt = TRUE),
               "Veni, vidi, vici. (I came, I saw, I conquered.)")
  expect_equal(caesar("p@-^36{^!^36{^9^46Mc697)@36c6~7}36c69_-=]@`@!4N",
                      distance = -123,
                      decrypt = TRUE),
               "Veni, vidi, vici. (I came, I saw, I conquered.)")
})
