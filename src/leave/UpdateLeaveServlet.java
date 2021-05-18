package leave;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateLeaveServlet")
public class UpdateLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String leaveID = request.getParameter("leaveID");
		String empID = request.getParameter("empID");
		String leaveCode = request.getParameter("leaveCode");
		String fdate = request.getParameter("fdate");
		String tdate = request.getParameter("tdate");
		String type = request.getParameter("type");
		String reason = request.getParameter("reason");
		String status = request.getParameter("status");
		
		boolean isTrue;
		
		isTrue = LeaveDBUtil.updateLeave(leaveID, empID, leaveCode,fdate, tdate, type, reason, status);
		
		if(isTrue == true) {
			
			List<Leave> leaveDetails = LeaveDBUtil.getLeave(empID);
			request.setAttribute("leaveDetails", leaveDetails);
			
			RequestDispatcher dis1 = request.getRequestDispatcher("leaveaccount.jsp");
			dis1.forward(request, response);
		}
		
		else {
			
			List<Leave> leaveDetails = LeaveDBUtil.getLeave(leaveID);
			request.setAttribute("leaveDetails", leaveDetails);
			
			RequestDispatcher dis2 = request.getRequestDispatcher("UpdateLeave.jsp");
			dis2.forward(request, response);
		}
	}

}
