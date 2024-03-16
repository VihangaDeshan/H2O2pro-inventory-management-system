package Controller;

import Model.MLogin;
import javax.swing.JOptionPane;

public class CLogin {
    public static boolean CLogin(String username, String password, String loginType) {
        // Check if the user is valid
        boolean isValid = MLogin.isValidUser(username, password, loginType);

        // Handle the result
        if (isValid) {
            // User is valid, grant access or perform desired actions
           JOptionPane.showMessageDialog(null, "Login Successfull", "Information", JOptionPane.INFORMATION_MESSAGE);
           return true;
        } else {
            // User is not valid, show an error message or take appropriate action
            JOptionPane.showMessageDialog(null, "Invalid username or password or Login type ", "Error", JOptionPane.ERROR_MESSAGE);
        }
        return false;
    }
}
