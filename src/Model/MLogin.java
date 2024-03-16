
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MLogin {
    public static boolean isValidUser(String username, String password,String loginType) {
        try ( Connection connection = MyDBConnection.createDBConnection();
              PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT * FROM login WHERE username = ? AND password = ? AND login_type = ?")) {

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, loginType);
            
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next(); // If there's a result, the user is valid.
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
          return  false;  
        }
            
        }

   
}
    

