package leave;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LeaveDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
    
	public static List<Leave> getLeave(String empID) {
		
		ArrayList<Leave> leave = new ArrayList<>();
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from leaves where empID='"+empID+"'";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				int leaveID = rs.getInt(1);
				int eID = rs.getInt(2);
				String leaveCode = rs.getString(3);
				String fdate = rs.getString(4);
				String tdate = rs.getString(5);
				String type = rs.getString(6);
				String reason = rs.getString(7);
				String status = rs.getString(8);
				
				Leave e = new Leave(leaveID, eID, leaveCode, fdate, tdate, type, reason, status);
				leave.add(e);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return leave;
	}
	
public static List<Leave> getPendingLeave() {
		
		ArrayList<Leave> leave = new ArrayList<>();
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from leaves";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				int leaveID = rs.getInt(1);
				int eID = rs.getInt(2);
				String leaveCode = rs.getString(3);
				String fdate = rs.getString(4);
				String tdate = rs.getString(5);
				String type = rs.getString(6);
				String reason = rs.getString(7);
				String status = rs.getString(8);
				
				Leave e = new Leave(leaveID, eID, leaveCode, fdate, tdate, type, reason, status);
				leave.add(e);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return leave;
	}

	public static boolean insertLeave(String empID, String leaveCode, String fdate, String tdate, String type, String reason, String status) {
    
		int convId = Integer.parseInt(empID);
		
    	boolean isSuccess = false;
    	
    	try {
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    	    String sql = "insert into leaves values (0,'"+convId+"','"+leaveCode+"','"+fdate+"','"+tdate+"', '"+type+"','"+reason+"', '"+status+"')";
    		int rs = stmt.executeUpdate(sql);
    		
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
    
    public static boolean updateLeave(String leaveID, String empID, String leaveCode, String fdate, String tdate, String type, String reason, String status) {
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "update leaves set empID='"+empID+"',leaveCode='"+leaveCode+"',fdate='"+fdate+"',tdate='"+tdate+"',type='"+type+"', reason='"+reason+"', status='"+status+"'"
    				+ "where leaveID='"+leaveID+"'";
    		int x = stmt.executeUpdate(sql);
    		
    		if(x > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
    
    public static boolean deleteLeave(String leaveID) {
    	
    	int ConID = Integer.parseInt(leaveID);
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "delete from leaves where leaveID='"+ConID+"'";
    		int x = stmt.executeUpdate(sql);
    		
    		if (x > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }


}
