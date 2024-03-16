/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Vihanga Deshan
 */
public class MProductManagement {
      ResultSet resultSet;
  
    public ResultSet ProductManagement(String q)
   {  try {Statement st=MyDBConnection.createDBConnection().createStatement();
           resultSet = st.executeQuery(q);
            }
         catch (SQLException ex) {
            ex.printStackTrace();
        }
        return resultSet;
    }
      public void updateQyt(String IId,int qyt){
    
    try{
     
        PreparedStatement preparedStatement=MyDBConnection.createDBConnection().prepareStatement("UPDATE inventory i JOIN product p ON i.Product_ID = p.Product_ID JOIN category c ON p.Category_ID = c.Category_ID SET i.quantity = ? WHERE i.Inventory_ID = ?");
         
        preparedStatement.setInt(1, qyt);
        preparedStatement.setString(2 , IId);        

        int row_Count = preparedStatement.executeUpdate();

        if (row_Count > 0) {
            JOptionPane.showMessageDialog(null, "Updated", "Info", JOptionPane.INFORMATION_MESSAGE);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }
       public void updatePrice(String pid,float price){
    
    try{
     
        PreparedStatement preparedStatement=MyDBConnection.createDBConnection().prepareStatement("UPDATE product SET price = ? WHERE Product_ID = ?");
         preparedStatement.setFloat(1, price);
        preparedStatement.setString(2, pid);      

        int row_Count = preparedStatement.executeUpdate();

        if (row_Count > 0) {
            JOptionPane.showMessageDialog(null, "Updated", "Info", JOptionPane.INFORMATION_MESSAGE);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }
}
