/* this is a oberon_0 lexical */
/*
author: you
date: 2018/06/22
*/
/* --------------------------Usercode Section------------------------ */
/* import java_cup.runtime.*; */

import java.io.*;
import exceptions.*;

%%
/* -----------------Options and Declarations Section----------------- */

%public
/* 
   The name of the class JFlex will create will be Lexer.
   Will write the code to the file Lexer.java. 
*/
%class OberonScanner
%type int
%unicode
%ignorecase

/*
  The current line number can be accessed with the variable yyline
  and the current column number with the variable yycolumn.
*/
%line
%column
%eofval{
	return OberonLexical.EOF;
%eofval}
%yylexthrow LexicalException
/* 
   Will switch to a CUP compatibility mode to interface with a CUP
   generated parser.
*/
/* %cup */

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
    /*private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }*/
    
    /* Also creates a new java_cup.runtime.Symbol with information
       about the current token, but this object has a value. */
    /*private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }*/

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
Reserved_word = "MODULE" | "PROCEDURE" | "CONST" | "TYPE" | "VAR" | "RECORD" | "ARRAY" | "OF" | "WHILE" | "DO" | "IF" | "THEN" | "ELSIF" | "ELSE" | "BEGIN" | "END" | "INTEGER" | "BOOLEAN" 

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
/*Comment = "(*" [^*] ~"*)" | "(*" ("*")+ ")"*/
Comment = "(*"~"*)"


/* A line terminator is a \r (carriage return), \n (line feed), or 
   \r\n. */
LineTerminator = \r|\n|\r\n
   
/* White space is a line terminator, space, tab, or line feed. */
WhiteSpace = {LineTerminator} | [ \t\f]

/* Illegal Statement*/
IllegalIdentifier = {Number}+{Identifier}

IllegalNumber = 0[0-7]*[8|9]+[0-9]* | 00[0-9]*

/* IllegalComment = "(*" ([^*] | "*"+[^)])* | ([^(]|"("+[^*])* "*)"; */
IllegalComment = "(*" ([^\*] | "*"+[^\)])* | ([^\(]|"("+[^\*])* "*)"

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
	
	{ Comment }		{ return OberonLexical.Comment; }

	{IllegalComment}	{ throw new IllegalCommentException(); }
	
	{IllegalIdentifier}	{ throw new IllegalIdentifierException(); }
	
	{IllegalNumber}		{ throw new IllegalOctalException(); }	

	{ Reserved_word } 	{ return OberonLexical.Reserved_word; }

	{ Logic_operator }	{ return OberonLexical.Logic_operator; }

	{ Relational_operator }	{ return OberonLexical.Relational_operator; }
	
	{ Addictive_operator }	{ return OberonLexical.Addictive_operator; }

	{ Multiplicative_operator }	{ return OberonLexical.Multiplicative_operator; }

	{ Type_operator }	{ return OberonLexical.Type_operator; }

	{ Selected_operator }	{ return OberonLexical.Selected_operator; }
	
	{ Assign_operator }	{ return OberonLexical.Assign_operator; }
	
	{ Seperated_operator }	{ return OberonLexical.Seperated_operator; }

	{ Paratheses }		{ return OberonLexical.Paratheses; }

	{ Identifier }		{ return OberonLexical.Identifier; }

	{ Number }		{ return OberonLexical.Number; }

	{ LineTerminator }	{ return OberonLexical.LineTerminator; }

	/* Don't do anything if whitespace is found */
    	{ WhiteSpace }	{ /* just skip what was found, do nothing */ }	

}

/* No token was found for the input so through an error.  Print out an
   Illegal character message with the illegal character that was found. */
/* [^]                    { throw new Error("Illegal character <"+yytext()+">"); } */


