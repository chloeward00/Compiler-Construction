# Compiler-Construction

Implementation:
First, to implement the Lexical and Syntax Analyser for the CCAL Language, I
thoroughly researched how Lexical and Syntax Analyser worked. I then read the
CCAL Language spec and I ensured I followed the language specification to
ensure that my lexer and parser rules were thoroughly correct so that errors would
not occur when I ran the ccal.g4 file against the tests. The grammar file follows the
specification completely.
Case InSensitive:
The CCAL language specification outlines that the language is case insensitive so
to make my grammar case insensitive I outlined all the possible letters that could
occur to make it case insensitive. So from below it shows that bB would match
either b or B in the letter fragments i have outlined. I use this throughout my
grammar to define Main and Void etc so that in the grammar upper and lowercase
letters can be used.
Reserved Words:
I added the reserved words that exist in the grammar into the ccal.g4 file. These
words consisted of var, const, integer, boolean, void, main, if , else, true, false,
while, skip. I noticed that both skip and fragment couldnt be used in my grammar
as it was a reserved word in antlr4.
Number:
The CCAL language specification highlights that a number is a string of one
or more digits from 0-9 but can not start with a 0, zero or more times. The
number rule I have created below using regex caters for all of this. It
matches digits 1-9. The regex caters for digits that are minus which is the ‘-’
as it is a valid number as the language specification outlines.
Identifiers:
Identifiers are strings of letters, digits, or underscores beginning with a letter. The
rule that I have created for the Identifiers. This rule checks that the ID begins with a
letter and if either followed by a letter, underscores or a number 0 times or more.
Comments:
A comment can occur near two tokens. The forms of comments are ‘*/ */’
which can be nested and ‘//’ which may be limited to the end of the line and it is
not nested. So the rule that I created to cater for comments. The COMMENT rule
skips the nested comments and the COMMENTS rule skips the single line
comments.
Whitespace:
The whitespace rule skips any whitespace in regards to \t \n \r.
Operators:
The operators in the language are shown below. These operators are shown
throughout the CCAL language spec and can be seen in my grammar file.
Epsilon:
To match the epsilon that was shown in the specification, Epsilon is used to match to
nothing, so to implement this I followed it exactly as the specifications hows but used
/* epsilon */ to match it to nothing.
Left recursion:
When implementing the expression and fragment rule in the grammar, I kept
receiving left recursion errors. After thoroughly trying to implement it and failing I
found a solution on stackoverflow which helped me fix the left recursion error as I
took inspiration from it to fit it into the CCAL language specification that we were
provided with. Instead of calling frag binary_arith_op frag i opt for expr instead and
this solved my left recursion error.
Testing:
When testing the files, I created a tests folder in the projects directory with all the
tests in the CCAL specification. To test it I run the command:
CCAL.JAVA File:
The ccal.java file is used to take a file input in. I learned this code from the lecture
video that is on the course webpage. In the code a file is taken in and a lexer takes
an input from the character stream and takes tokens from the token stream from the
lexer. The parser then takes these tokens. Below is how the code is implemented.
