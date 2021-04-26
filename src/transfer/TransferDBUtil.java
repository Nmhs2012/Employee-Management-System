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
						int password = rs.getInt(5);
					
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
				String sql = "select d.depID,d.dname,d.manager from Employee e, Department d where e.empID = d.depID and e.username = '"+username+"'";
							
				rs= stat.executeQuery(sql);
				
				while(rs.next()) {
					int dipID = rs.getInt(1);
					String dname = rs.getString(2);
					String manager = rs.getString(3);
					
					//Create Department Object
					Department d = new Department(dipID, dname, manager);
					dep.add(d);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return dep;
		}
			
			//Get Branch Details 
			public static List<Branch> getBranch(String username){
				
				ArrayList<Branch> branch = new ArrayList<>();
				
				try {
					
					con = DBConnect.getConnection();
					stat = con.createStatement();
					
					//SQL Query			
					String sql = "select b.branchCode, b.bname from Employee e, Branch b where e.empID = b.branchCode and e.username = '"+username+"'";
								
					rs= stat.executeQuery(sql);
					
					while(rs.next()) {
						int branchCode = rs.getInt(1);
						String bname = rs.getString(2);
						
						//Create Department Object
						Branch b = new Branch(branchCode, bname);
						branch.add(b);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				
				return branch;
			}
			
			//Insert Transfer Details
			public static boolean insertTransfer(String dname, String bname, String tBranch, String tDepartment, String reason, String approveBy, int  empID) {
			    
		    	boolean isSuccess = false;
		    	
		    	try {
		    		con = DBConnect.getConnection();
		    		stat = con.createStatement();
		    	    String sql = "insert into transfer values (0, '"+bname+"', '"+dname+"', '"+tBranch+"', '"+tDepartment+"','"+reason+"','"+approveBy+"', '"+empID+"')";
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
			
			//Get Transfer Details 
			public static List<Transfer> getTransfer(int empID){
				
				ArrayList<Transfer> transfer = new ArrayList<>();
				
				try {
					
					con = DBConnect.getConnection();
					stat = con.createStatement();
					
					//SQL Query			
					String sql = "select * from transfer where empID ='"+empID+"'";
								 
					rs= stat.executeQuery(sql);
					
					while(rs.next()) {
						int transferID = rs.getInt(1);
						String cBranch = rs.getString(2);
						String cDepartment = rs.getString(3);
						String tBranch = rs.getString(4);
						String tDepartment = rs.getString(5);
						String reason = rs.getString(6);
						String approveBy = rs.getString(7);
												
						//Create Department Object
						Transfer t = new Transfer(transferID, cBranch, cDepartment, tBranch, tDepartment, reason, approveBy);
						transfer.add(t);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				return transfer;
			}
			
			public static boolean updateTransfer(String tranID, String cBranch, String cDepartment, String tBranch, String tDepartment, String reason, String approveBy) {
				
				
		    	try {
		    		
		    		con = DBConnect.getConnection();
		    		stat = con.createStatement();
		    		String sql = "update transfer set cBranch='"+cBranch+"',cDepartment='"+cDepartment+"',tBranch='"+tBranch+"',tDepartment='"+tDepartment+"',reason='"+reason+"', approveBy='"+approveBy+"'"+ "where tranID='"+tranID+"'";
		    		int rs = stat.executeUpdate(sql);
		    		
		    		if(rs > 0) {
		    			Success = true;
		    		}
		    		else {
		    			Success = false;
		    		}
		    		
		    	}
		    	catch(Exception e) {
		    		e.printStackTrace();
		    	}
		    	
		    	return Success;
		    }
			
			public static List<Transfer> getTransferDetails(String tranID){
				
				int convertID = Integer.parseInt(tranID);
				
				ArrayList<Transfer> transfer = new ArrayList<>();
				
				try {
					
					con = DBConnect.getConnection();
					stat = con.createStatement();
					
					//SQL Query			
					String sql = "select * from transfer where tranID ='"+convertID+"'";
								 
					rs= stat.executeQuery(sql);
					
					while(rs.next()) {
						int transferID = rs.getInt(1);
						String cBranch = rs.getString(2);
						String cDepartment = rs.getString(3);
						String tBranch = rs.getString(4);
						String tDepartment = rs.getString(5);
						String reason = rs.getString(6);
						String approveBy = rs.getString(7);
												
						//Create Department Object
						Transfer t = new Transfer(transferID, cBranch, cDepartment, tBranch, tDepartment, reason, approveBy);
						transfer.add(t);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				return transfer;
			}
			
			//Delete Transfer Data
			public static boolean deleteTransfer(String tranID) {
				
				int convertID = Integer.parseInt(tranID);
				
				//Validate
				try {
							
					con = DBConnect.getConnection();
					stat = con.createStatement();
							
					//SQL Query			
					String sql = "delete from transfer where tranID ='"+convertID+"'";
							
							//Run SQL Query
							int a = stat.executeUpdate(sql); //Returns 0 or 1
							
							if(a > 0) {
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
			
}