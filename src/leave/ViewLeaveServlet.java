package leave;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewLeaveServlet")
public class ViewLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		List<Leave> leaveDetails = LeaveDBUtil.getPendingLeave();
		request.setAttribute("leaveDetails", leaveDetails);
		
		RequestDispatcher dis1 = request.getRequestDispatcher("report.jsp");
		dis1.forward(request, response);
	}

}
