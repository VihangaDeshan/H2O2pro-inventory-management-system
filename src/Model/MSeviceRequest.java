
package Model;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import java.sql.*;



public class MSeviceRequest {
    ResultSet resultSet;
   public ResultSet servicerequest()
   {  try {Statement st=MyDBConnection.createDBConnection().createStatement();
           resultSet = st.executeQuery("SELECT sr.RequestID, c.Cus_ID, c.fname, c.Telephone, sr.Request_Date,  sr.Request_Type,sr.Request_status, sr.Emp_ID FROM servicerequest sr JOIN Customer c ON sr.Cus_ID = c.Cus_ID");
            }
         catch (SQLException ex) {
            ex.printStackTrace();
        }

        return resultSet;
    }
    public ResultSet servicerequest(String q)
   {  try {Statement st=MyDBConnection.createDBConnection().createStatement();
           resultSet = st.executeQuery(q);
            }
         catch (SQLException ex) {
            ex.printStackTrace();
        }
        return resultSet;
    }
     public void closedrequest(String rid,String EmpId,String status){
    
    try{
     
        PreparedStatement preparedStatement=MyDBConnection.createDBConnection().prepareStatement("UPDATE servicerequest SET request_status = ?, emp_id = ? WHERE RequestId = ?");
         preparedStatement.setString(1, status);
        preparedStatement.setString(2, EmpId);
        preparedStatement.setString(3, rid);

        int row_Count = preparedStatement.executeUpdate();

        if (row_Count > 0) {
            JOptionPane.showMessageDialog(null, "Updated", "Info", JOptionPane.INFORMATION_MESSAGE);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }
}

  
