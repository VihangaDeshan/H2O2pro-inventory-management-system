/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Vihanga Deshan
 */
public class MInventory {
    ResultSet resultSet;
   public ResultSet MInentoryResults()
   {  try {Statement st=MyDBConnection.createDBConnection().createStatement();
           resultSet = st.executeQuery("SELECT i.Inventory_ID, i.Quantity, p.Name,c.Cat_Name FROM inventory i JOIN  product p ON i.Product_ID = p.Product_ID JOIN category c ON p.Category_ID = c.Category_ID ");
            }
         catch (SQLException ex) {
            ex.printStackTrace();
        }

        return resultSet;
    }
    public ResultSet MInentoryResults(String q)
   {  try {Statement st=MyDBConnection.createDBConnection().createStatement();
           resultSet = st.executeQuery(q);
            }
         catch (SQLException ex) {
            ex.printStackTrace();
        }
        return resultSet;
    }
}
