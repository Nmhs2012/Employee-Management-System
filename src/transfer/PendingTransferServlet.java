package transfer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PendingTransferServlet")
public class PendingTransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public PendingTransferServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//Take employee id
		String username = Employee.getUsername();
				
		List<Employee> empDetails = TransferDBUtil.getEmployee(username);
				
		Employee emp = empDetails.get(0);
		String empID = emp.getEmpID();
				
		List<Transfer> transferDetails = TransferDBUtil.getTransfer(empID);
		request.setAttribute("transferDetails", transferDetails);
		
		RequestDispatcher dis2 = request.getRequestDispatcher("PendingTransfer.jsp");
		dis2.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
