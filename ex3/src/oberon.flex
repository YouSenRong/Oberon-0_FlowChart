/* this is a oberon_0 flex */
/*
author: you
date: 2018/06/25
*/

/* --------------------------Usercode Section------------------------ */

import java_cup.runtime.*;
import java.io.*;
import exceptions.*;

%%
/* -----------------Options and Declarations Section----------------- */

%public
%class OberonScanner
%cupsym Symbol
%type java_cup.runtime.Symbol
%unicode
%ignorecase
%line
%column
%eofval{
	return symbol(Symbol.EOF);
%eofval}
%yylexthrow LexicalException
/* 
   Will switch to a CUP compatibility mode to interface with a CUP
   generated parser.
*/
%cup
/*
  Declarations
   
  Code between %{ and %}, both of which must be at the beginning of a
  line, will be copied letter to letter into the lexer class source.
  Here you declare member variables and functions that are used inside
  scanner actions.  
*/
%{
    /* To create a new java_cup.runtime.Symbol with information about
       the current token, the token will have no value in this
       case. */
    private java_cup.runtime.Symbol symbol(int type) {
        return new java_cup.runtime.Symbol(type, yyline, yycolumn);
    }
    
    /* Also creates a new java_cup.runtime.Symbol with information
       about the current token, but this object has a value. */
    private java_cup.runtime.Symbol symbol(int type, Object value) {
        return new java_cup.runtime.Symbol(type, yyline, yycolumn, value);
    }

    int get_line()
    {
	return yyline;
    }

    int get_column()
    {
	return yycolumn;
    }
%}

/*
  Macro Declarations
  
  These declarations are regular expressions that will be used latter
  in the Lexical Rules Section.  
*/

/* This is reserved word */
Reserved_word = "MODULE" | "PROCEDURE" | "CONST" | "TYPE" | "VAR" | "RECORD" | "ARRAY" | "OF" | "WHILE" | "DO" | "IF" | "THEN" | "ELSIF" | "ELSE" | "BEGIN" | "END" | "INTEGER" | "BOOLEN" 

/* This is logic_operator */
Logic_operator = "OR" | "&" | "~"

/* This is relational opetator */
Relational_operator = "=" | "#" | "<" | "<=" | ">" | ">="

/* This is addictive operator */
Addictive_operator = "+" | "-"

/* This is multiplicative operator */
Multiplicative_operator = "*" | "DIV" | "MOD"

/* This is type operator */
Type_operator = ":"

/* This is selected operator */
Selected_operator = "." | "[" | "]"

/* This is assign operator */
Assign_operator = ":="

/* This is seperated operator */
Seperated_operator = "," | ";"

/* This is Paratheses */
Paratheses = "(" | ")"

/* This is identifier */
Identifier = {letter} ( {letter} | "_" | {digit} )*

/* This is letter */
letter = [a-zA-Z]

/* This is digit */
digit = [0-9]

/* This is number */
Number = {decimal} | {octal}

/* This is decimal */
decimal = [1-9]+[0-9]*

/* This is octal */
octal = 0[1-7]?[0-7]*

/* This is comment */
Comment = "(*" [^*] ~"*)" | "(*" "*"+ ")"

/* A line terminator is a \r (carriage return), \n (line feed), or 
   \r\n. */
LineTerminator = \r|\n|\r\n
   
/* White space is a line terminator, space, tab, or line feed. */
WhiteSpace = {LineTerminator} | [ \t\f]

/* Illegal Statement*/
IllegalIdentifier = {Number}+{Identifier}

IllegalNumber = 0[0-7]*[8|9]+[0-9]* | 00[0-9]*

IllegalComment = "(*" ([^\*] | "*"+[^\)])+ | ([^\(]|"("+[^\*])+"*)"


%%
/* ------------------------Lexical Rules Section---------------------- */

/*
   This section contains regular expressions and actions, i.e. Java
   code, that will be executed when the scanner matches the associated
   regular expression. */
   
   /* YYINITIAL is the state at which the lexer begins scanning.  So
   these regular expressions will only be matched if the scanner is in
   the start state YYINITIAL. */
   
<YYINITIAL> 
{
	/* reserved word */
	"MODULE"		{ return symbol(Symbol.MODULE, yytext()); }
	"PROCEDURE"		{ return symbol(Symbol.PROCEDURE, yytext()); }
	"CONST"			{ return symbol(Symbol.CONST, yytext()); }
	"TYPE"			{ return symbol(Symbol.TYPE, yytext()); }
	"VAR"			{ return symbol(Symbol.VAR, yytext()); }
	"RECORD"		{ return symbol(Symbol.RECORD, yytext()); }
	"ARRAY"			{ return symbol(Symbol.ARRAY, yytext()); }
	"OF"			{ return symbol(Symbol.OF, yytext()); }
	"WHILE"			{ return symbol(Symbol.WHILE, yytext()); }
	"DO"			{ return symbol(Symbol.DO, yytext()); }
	"IF"			{ return symbol(Symbol.IF, yytext()); }
	"THEN"			{ return symbol(Symbol.THEN, yytext()); }
	"ELSIF"			{ return symbol(Symbol.ELSIF, yytext()); }
	"ELSE"			{ return symbol(Symbol.ELSE, yytext()); }
	"BEGIN"			{ return symbol(Symbol.BEGIN, yytext()); }
	"END"			{ return symbol(Symbol.END, yytext()); }
	"INTEGER"		{ return symbol(Symbol.INTEGER, yytext()); }
	"BOOLEAN"		{ return symbol(Symbol.BOOLEAN, yytext()); }

	/* logic opetator */
	"OR"			{ return symbol(Symbol.OR, yytext()); }
	"&"			{ return symbol(Symbol.AND, yytext()); }
	"~"			{ return symbol(Symbol.NOT, yytext()); }
	
	/* relation operator */
	"="			{ return symbol(Symbol.EQUAL, yytext()); }
	"#"			{ return symbol(Symbol.UNEQUAL, yytext()); }
	"<"			{ return symbol(Symbol.LESS, yytext()); }
	"<="			{ return symbol(Symbol.LESS_EQUAL, yytext()); }
	">"			{ return symbol(Symbol.GREAT, yytext()); }
	">="			{ return symbol(Symbol.GREAT_EQUAL, yytext()); }
	
	/* addictive operator */
	"+"			{ return symbol(Symbol.PLUS, yytext()); }
	"-"			{ return symbol(Symbol.MINUS, yytext()); }
	
	/* multiplicative operator */
	"*"			{ return symbol(Symbol.TIMES, yytext()); }
	"DIV"			{ return symbol(Symbol.DIVIDE, yytext()); }
	"MOD"			{ return symbol(Symbol.MOD, yytext()); }
	
	/* type operator */
	":"			{ return symbol(Symbol.COLON, yytext()); }
	
	/* selected operator */
	"."			{ return symbol(Symbol.DOT, yytext()); }
	"["			{ return symbol(Symbol.LBRACKET, yytext()); }
	"]"			{ return symbol(Symbol.RBRACKET, yytext()); }
	
	/* assign operator */
	":="			{ return symbol(Symbol.ASSIGN, yytext()); }
	
	/* seperated operator */
	","			{ return symbol(Symbol.COMMA, yytext()); }
	";"			{ return symbol(Symbol.SEMICOLON, yytext()); }
	
	/* paratheses */
	"("			{ return symbol(Symbol.LPARENTHESES, yytext()); }
	")"			{ return symbol(Symbol.RPARENTHESES, yytext()); }

	/* identifier */
	{Identifier}		{ 
					if(yylength() > 24)
					{
						throw new IllegalIntegerRangeException(yytext());
					}
					else
					{
						return symbol(Symbol.IDENTIFIER, yytext()); 
					}
				}

	/* number */
	{Number}		{ 
					if(yylength() > 24)
					{
						throw new IllegalIntegerRangeException(yytext());
					}
					else
					{
						return symbol(Symbol.NUMBER, yytext()); 
					}
				}

	/* Don't do anything if whitespace is found */
    	{ WhiteSpace }	{ /* just skip what was found, do nothing */ }

	{ Comment }		{ /* do nothing */ }

	{IllegalComment}	{ throw new IllegalCommentException(); }
	
	{IllegalIdentifier}	{ throw new IllegalIdentifierException(); }
	
	{IllegalNumber}		{ throw new IllegalOctalException(); }

}
/* No token was found for the input so through an error.  Print out an
   Illegal character message with the illegal character that was found. */
[^]                    { System.out.println("f**k"); throw new IllegalSymbolException(yytext());}
	















