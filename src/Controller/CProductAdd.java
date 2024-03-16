
package Controller;

import Model.MProductAdd;
import Model.MProductManagement;
import com.mysql.cj.protocol.Resultset;
import java.sql.ResultSet;

public class CProductAdd {
    public String CProductID(){
    MProductAdd m=new MProductAdd();
   String id= m.getNextProductId();
       return  id;

            }
    public String CinventoryID(){
    MProductAdd m=new MProductAdd();
   String id= m.getInventoryID();
       return  id;

            }
    public ResultSet CaddIds(String q)
    {
           MProductAdd msc=new MProductAdd();
                ResultSet rst= msc.getids(q);
                return rst;
    }
  



    public void addProduct(String productId, String productName, String inventoryId, String categoryId, String supplierId, float price, String description, String productType, String specification) {
        MProductAdd model = new MProductAdd();
        model.MProductAdd(productId, productName, inventoryId, categoryId, supplierId, price, description, productType, specification);
        

       
    }
}



