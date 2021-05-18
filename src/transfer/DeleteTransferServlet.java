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

@WebServlet("/DeleteTransferServlet")
public class DeleteTransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String tranID = request.getParameter("tranID");
		
		
		//Take employee id
		String username = Employee.getUsername();
		
		List<Employee> empDetails = TransferDBUtil.getEmployee(username);
		
		Employee emp = empDetails.get(0);
		String empID = emp.getEmpID();
		
		boolean True = TransferDBUtil.deleteTransfer(tranID) ;
		
		if(True == true) {
			
			out.println("<script type='text/javascript'>");
			out.println("alert('Your transfer details have been deleted successfully');");
			out.println("location='PendingTransfer.jsp'");
			out.println("</script>");
			
			List<Transfer> transferDetails = TransferDBUtil.getTransfer(empID);
			request.setAttribute("transferDetails", transferDetails);
			
			
			RequestDispatcher dis1 = request.getRequestDispatcher("PendingTransfer.jsp");		
			dis1.forward(request, response);
		}
		
		else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Error...');");
			out.println("location='Login.jsp'");
			out.println("</script>");
			
			RequestDispatcher dis2 = request.getRequestDispatcher("DeleteTransfer.jsp");		
			dis2.forward(request, response);
		}
		
	}

}
