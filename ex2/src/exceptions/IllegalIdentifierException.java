package exceptions;

// Referenced classes of package exceptions:
//            LexicalException

public class IllegalIdentifierException extends LexicalException
{

    public IllegalIdentifierException()
    {
        this("Illegal Identifier, identifier should start with charter or \'_\' but not number.");
    }

    public IllegalIdentifierException(String s)
    {
        super(s);
    }
}
