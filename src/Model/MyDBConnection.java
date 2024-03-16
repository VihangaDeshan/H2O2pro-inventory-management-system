package Model;
import java.sql.*;
public class MyDBConnection 
{
    private static Connection con;
    public static Connection createDBConnection()
    {
        try{
        String dbloc="jdbc:mysql://localhost/Company";
        con=DriverManager.getConnection(dbloc,"root","");
        }
        catch(SQLException E)
        {
            System.err.println(E.getMessage());
        }
        return con;
    }
   
}
