/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;


import Model.MProductManagement;
import Model.MSeviceRequest;
import java.sql.ResultSet;

/**
 *
 * @author Vihanga Deshan
 */
public class CProductManagement {
    
       public ResultSet Management(String q)
        {
                MProductManagement msc=new MProductManagement();
                ResultSet rst= msc.ProductManagement(q);
                return rst;
    }
         public void CUpdaateRequestQyt(String iid,int qyt)
       {
           MProductManagement obj=new MProductManagement();
           obj.updateQyt(iid, qyt);
       }
           public void CUpdaateRequest(String pid,float price)
       {
           MProductManagement obj=new MProductManagement();
           obj.updatePrice(pid, price);
       }
}
