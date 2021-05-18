package transfer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayDetailsServlet")
public class DisplayDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public DisplayDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String username = Employee.getUsername();
		
		List<Employee> empDetails = TransferDBUtil.getEmployee(username);
		request.setAttribute("empDetails", empDetails);
		
		List<Department> depDetails = TransferDBUtil.getDepartment(username);
		request.setAttribute("depDetails", depDetails);
		
		List<Branch> branchDetails = TransferDBUtil.getBranch(username);
		request.setAttribute("branchDetails", branchDetails);
		
		RequestDispatcher dis1 = request.getRequestDispatcher("Transfer.jsp");		
		dis1.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
