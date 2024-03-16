
package Model;

import java.sql.Statement;
import java.sql.*;
import javax.swing.JOptionPane;
public class MProductAdd {
     ResultSet resultSet;
    public String getNextProductId() {
        try {
            Statement statement = MyDBConnection.createDBConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT MAX(Product_ID) FROM product");

            if (resultSet.next()) {
                String maxProductId = resultSet.getString(1);

                if (maxProductId != null) {
                    // Extract the numeric part and increment it
                    int numericPart = Integer.parseInt(maxProductId.substring(1)) + 1;

                    // Create the next product ID by concatenating the "P" prefix and the numeric part
                    String nextProductId = "P" + String.format("%04d", numericPart); // Assuming 5 digits, adjust as needed

                    return nextProductId; // Return the next product ID
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Handle error or return a default value as needed
    }
    
    public String getInventoryID() {
        try {
            Statement statement = MyDBConnection.createDBConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT MAX(Inventory_ID) FROM inventory");

            if (resultSet.next()) {
                String maxInventoryID = resultSet.getString(1);

                if (maxInventoryID != null) {
                    // Extract the numeric part and increment it
                    int numericPart = Integer.parseInt(maxInventoryID.substring(1)) + 1;

                    // Create the next product ID by concatenating the "I" prefix and the numeric part
                    String nextInventory = "Q" + String.format("%04d", numericPart); // Assuming 4digits, adjust as needed

                    return nextInventory; // Return the next product ID
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Handle error or return a default value as needed
    }
    public ResultSet getids(String q)
    {
        
         try {Statement st=MyDBConnection.createDBConnection().createStatement();
           resultSet = st.executeQuery(q);
            }
         catch (SQLException ex) {
            ex.printStackTrace();
        }
        return resultSet;
    }
    

    
    public void  MProductAdd(String productId, String productName, String inventoryId, String categoryId, String supplierId, float price, String description, String productType, String specification) {
    try {
    String insertProductQuery = "INSERT INTO product (Product_ID, Name, Category_ID, Supplier_ID, Price, Description, Product_Type, Specification) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    String insertInventoryQuery = "INSERT INTO inventory (Inventory_ID, Product_ID, Quantity) VALUES (?, ?, ?)";

    try (Connection connection = MyDBConnection.createDBConnection();
         PreparedStatement productPreparedStatement = connection.prepareStatement(insertProductQuery);
         PreparedStatement inventoryPreparedStatement = connection.prepareStatement(insertInventoryQuery)) {

        // Set parameters for product insertion
        productPreparedStatement.setString(1, productId);
        productPreparedStatement.setString(2, productName);
        productPreparedStatement.setString(3, categoryId);
        productPreparedStatement.setString(4, supplierId);
        productPreparedStatement.setFloat(5, price);
        productPreparedStatement.setString(6, description);
        productPreparedStatement.setString(7, productType);
        productPreparedStatement.setString(8, specification);

        // Set parameters for inventory insertion
        inventoryPreparedStatement.setString(1, inventoryId);
        inventoryPreparedStatement.setString(2, productId); // Use the same productId for linking to product
        inventoryPreparedStatement.setInt(3, 0); // Set the initial quantity as needed

        int productRowCount = productPreparedStatement.executeUpdate();
        int inventoryRowCount = inventoryPreparedStatement.executeUpdate();

        if (productRowCount > 0 && inventoryRowCount > 0) {
              JOptionPane.showMessageDialog(null, "Data Inserted", "Information", JOptionPane.INFORMATION_MESSAGE);
        }
    }
} catch (SQLException e) {
    e.printStackTrace();
}
    }
}             
        


    

