
main = print .length $ [a^b | a <- [1..9], b <- [1..22], b == (length$show$a^b)]
