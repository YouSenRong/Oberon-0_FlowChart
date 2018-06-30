package exceptions;


// Referenced classes of package exceptions:
//            LexicalException

public class IllegalIdentifierLengthException extends LexicalException
{

    public IllegalIdentifierLengthException()
    {
        this("Illegal Identifier Length: more than 24.");
    }

    public IllegalIdentifierLengthException(String s)
    {
        super( s);
    }
}
