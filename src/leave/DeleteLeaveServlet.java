package leave;

import java.io.IOException;
//import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteLeaveServlet")
public class DeleteLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*PrintWriter out = response.getWriter();
		response.setContentType("text/html");*/
		
		String leaveID = request.getParameter("leaveID");
		String empID = request.getParameter("empID");
		
		boolean isTrue;
		
		isTrue = LeaveDBUtil.deleteLeave(leaveID);
		
		if (isTrue == true) {
			/*out.println("<script type='text/javascript'>");
			out.println("alert('Attendance Record is deleted successfully.');");
			out.println("location='Attaccount.jsp'");
			out.println("</script>");*/
			
			List<Leave> leaveDetails = LeaveDBUtil.getLeave(empID);
			request.setAttribute("leaveDetails", leaveDetails);
			
			RequestDispatcher dis1 = request.getRequestDispatcher("leaveaccount.jsp");
			dis1.forward(request, response);
			
		}
		
		else {
			
			List<Leave> leaveDetails = LeaveDBUtil.getLeave(leaveID);
			request.setAttribute("leaveDetails", leaveDetails);
			
			RequestDispatcher dis2 = request.getRequestDispatcher("DeleteLeave.jsp");
			dis2.forward(request, response);
		}
	}

}
