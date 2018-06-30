import java.io.*;
import exceptions.*;
public class Main
{
public static void main(String argv[]) 
{
	int return_id;
	if (argv.length == 0)
	{
		System.out.println("There need a parameter(s), Usage: java Main <*.obr>");
	}
	else
	{
		for (int i = 0; i < argv.length; i++)
		{
			OberonScanner scanner = null;
			try
			{
				scanner = new OberonScanner(new java.io.FileReader(argv[i]));
				while (true)
				{
					try
					{
						return_id = scanner.yylex();
					}
					catch (LexicalException ex)
					{
						System.out.println(argv[i]+ " : "+ex.getMessage());
						System.out.println("line : "+scanner.get_line()+", colume : "+scanner.get_column());
						System.out.println(scanner.yytext()+"\n");
						break;
					}
					if (return_id > 0 && return_id != OberonLexical.WhiteSpace);	//token is valid,do nothing
						//System.out.println(return_id +" : " + scanner.yytext());
					else
					{
						if (return_id == 0)
						{
							System.out.println("There is not lexical error in" + argv[i]);
							break;
						}
					}
				}
			}
			catch (java.io.FileNotFoundException e) 
			{
				System.out.println("File not found : \""+argv[i]+"\"");
			}
			catch (java.io.IOException e) 
			{
				System.out.println("IO error scanning file \""+argv[i]+"\"");
				System.out.println(e);
			}
			catch (Exception e)
			{
				System.out.println("Unexpected exception:");
				e.printStackTrace();
			}
		}
	}
}
}

