public class OberonLexical
{
	  /* terminals */
	  public static final int Reserved_word = 1;
	  public static final int Logic_operator = 2;
	  public static final int Relational_operator = 3;
	  public static final int Addictive_operator = 4;
	  public static final int Multiplicative_operator = 5;
	  public static final int Type_operator = 6;
	  public static final int Selected_operator = 7;
	  public static final int Assign_operator = 8;
	  public static final int Seperated_operator = 9;
	  public static final int Paratheses = 10;
	  public static final int Identifier = 11;
	  public static final int Number = 12;
	  public static final int Comment = 13;
	  public static final int LineTerminator = 14;
	  public static final int WhiteSpace = 15;

	  public static final int EOF = 0;
	  
	  public static final int legalSymbol = -1;
	  public static final int IllegalInteger = -2;	//no blank before identifier
	  public static final int IllegalItegerRange = -3;	//more than 12
	  public static final int IllegalOctal = -4;
	  public static final int IllegalIdentifierLength = -5;
	  public static final int MismatchedComment = -6;	//without match	  
}
