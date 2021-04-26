package transfer;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateTransferServlet")
public class UpdateTransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String tranID = request.getParameter("tranID");
		String cBranch = request.getParameter("cBranch");
		String cDepartment = request.getParameter("cDepartment");
		String tBranch = request.getParameter("tBranch");
		String tDepartment = request.getParameter("tDepartment");
		String reason = request.getParameter("reason");
		String approveBy = request.getParameter("approveBy");
		
		//Take employee id
		String username = Employee.getUsername();
				
		List<Employee> empDetails = TransferDBUtil.getEmployee(username);
				
		Employee emp = empDetails.get(0);
		int empID = emp.getEmpID();
		
		boolean isTrue;
		
		isTrue = TransferDBUtil.updateTransfer(tranID, cBranch, cDepartment, tBranch, tDepartment, reason, approveBy);
		
		if(isTrue == true) {
			out.println("<script type='text/javascript'>");
			out.println("alert('Your transfer details have been updated successfully');");
			out.println("location='PendingTransfer.jsp'");
			out.println("</script>");
			
			List<Transfer> transferDetails = TransferDBUtil.getTransfer(empID);
			request.setAttribute("transferDetails", transferDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("PendingTransfer.jsp");
			dis.forward(request, response);
		}
		else {
			//List<Attendance> attDetails = AttendanceDBUtil.getAttendance(attID);
			//request.setAttribute("attDetails", attDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
			dis.forward(request, response);
		}
	}

}
