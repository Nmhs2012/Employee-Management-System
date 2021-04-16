package transfer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TransferDBUtil {

	//Create objects for database Connection class
		private static boolean Success = false;
		private static Connection con = null;
		private static Statement stat = null;
		private static ResultSet rs = null;
		
		
		public static boolean validate(String username, String password){
			
			try {
				
				con = DBConnect.getConnection();
				stat = con.createStatement();
						
				String sql = "select * from Employee where username = '"+username+"' and password ='"+password+"'";
				
				rs= stat.executeQuery(sql);
				
				if(rs.next()) {
					Success = true;	
				}
				
				else {
					Success = false;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return Success;
		}
		
		public static List<Employee> getEmployee(String username){
			
			ArrayList<Employee> emp = new ArrayList<>();
			
			try {
				
				con = DBConnect.getConnection();
				stat = con.createStatement();
				
				//SQL Query			
				String sql = "select * from Employee where username = '"+username+"'";
							
				rs= stat.executeQuery(sql);
				
				while(rs.next()) {
					int empID = rs.getInt(1);
					String name = rs.getString(2);
					String address = rs.getString(3);
					String userName = rs.getString(4);
					String password = rs.getString(5);
				
					//Create Employee Object
					Employee e = new Employee(empID, name, address, userName, password);
					emp.add(e);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return emp;
		}
		
		//Get Department Details 
		public static List<Department> getDepartment(String username){
			
			ArrayList<Department> dep = new ArrayList<>();
			
			try {
				
				con = DBConnect.getConnection();
				stat = con.createStatement();
				
				//SQL Query			
				String sql = "select d.did,d.dname,d.dlocation,d.manager from Employee e, Department d where e.eid = d.did and e.username = '"+username+"'";
							
				rs= stat.executeQuery(sql);
				
				while(rs.next()) {
					int dipID = rs.getInt(1);
					String dname = rs.getString(2);
					String dlocation = rs.getString(3);
					String manager = rs.getString(4);
					
					//Create Department Object
					Department d = new Department(dipID, dname, dlocation, manager);
					dep.add(d);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return dep;
		}
		
		//Insert Transfer Details
		public static boolean insertTransfer(String cBranch, String cDepartment, String tBranch, String tDepartment, String reason) {
			
	    	boolean isSuccess = false;
	    	
	    	try {
	    		con = DBConnect.getConnection();
	    		stat = con.createStatement();
	    	    String sql = "insert into transfer (tid, cBranch, cDepartment, tBranch, tDepartment, reason) values (0, '"+cBranch+"', '"+cDepartment+"', '"+tBranch+"','"+tDepartment+"','"+reason+"')";
	    		int rs = stat.executeUpdate(sql);
	    		
	    		if(rs > 0) {
	    			isSuccess = true;
	    		} else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch (Exception e) {
	    		e.printStackTrace();
	    	}
	 	
	    	return isSuccess;
	    }
		
}

