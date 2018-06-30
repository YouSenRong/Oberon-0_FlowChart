package exceptions;


// Referenced classes of package exceptions:
//            LexicalException

public class IllegalCommentException extends LexicalException
{

    public IllegalCommentException()
    {
        this("Illegal Comment.");
    }

    public IllegalCommentException(String s)
    {
        super("Illegal Comment.\n"+s);
    }
}
