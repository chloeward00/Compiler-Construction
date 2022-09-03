# Compiler-Construction

First, to implement the Lexical and Syntax Analyser for the CCAL Language, I
thoroughly researched how Lexical and Syntax Analyser worked. I then read the
CCAL Language spec and I ensured I followed the language specification to
ensure that my lexer and parser rules were thoroughly correct so that errors would
not occur when I ran the ccal.g4 file against the tests. The grammar file follows the
specification completely.

The CCAL language specification outlines that the language is case insensitive so
to make my grammar case insensitive I outlined all the possible letters that could
occur to make it case insensitive. So from below it shows that bB would match
either b or B in the letter fragments i have outlined. I use this throughout my
grammar to define Main and Void etc so that in the grammar upper and lowercase
letters can be used
