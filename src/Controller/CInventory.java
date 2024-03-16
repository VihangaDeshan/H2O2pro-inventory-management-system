package Controller;

import Model.MInventory;
import java.sql.ResultSet;

public class CInventory {
     public ResultSet inventory()
        {
                MInventory msc=new MInventory();
                ResultSet rst= msc.MInentoryResults();
                return rst;
    }
       public ResultSet inventory(String q)
        {
                MInventory msc=new MInventory();
                ResultSet rst= msc.MInentoryResults(q);
                return rst;
    }
}
