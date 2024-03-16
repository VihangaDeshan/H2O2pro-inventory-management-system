
package Controller;

import Model.MSeviceRequest;
import java.sql.ResultSet;

public class CserviceRequest {
      public ResultSet servicerequest()
        {
                MSeviceRequest msc=new MSeviceRequest();
                ResultSet rst= msc.servicerequest();
                return rst;
    }
       public ResultSet servicerequest(String q)
        {
                MSeviceRequest msc=new MSeviceRequest();
                ResultSet rst= msc.servicerequest(q);
                return rst;
    }
       public void CUpdaateRequest(String rid,String EmpId,String status)
       {
           MSeviceRequest obj=new MSeviceRequest();
           obj.closedrequest(rid, EmpId, status);
       }
    
}
