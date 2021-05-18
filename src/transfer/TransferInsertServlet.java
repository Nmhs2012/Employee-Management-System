package transfer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TransferInsertServlet")
public class TransferInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tBranch = request.getParameter("tBranch");
		String tDepartment = request.getParameter("tDepartment");
		String reason = request.getParameter("reason");
		String approveBy = request.getParameter("approveBy");
				
		//Take employee id
		String username = Employee.getUsername();
		
		List<Employee> empDetails = TransferDBUtil.getEmployee(username);
		
		Employee emp = empDetails.get(0);
		String empID = emp.getEmpID();
		
		//Take current department and Branch
		List<Department> depDetails = TransferDBUtil.getDepartment(username);
		
		Department dep = depDetails.get(0);
		String dname = dep.getDname();
		
		List<Branch> branchDetails = TransferDBUtil.getBranch(username);
		
		Branch branch = branchDetails.get(0);
		String bname = branch.getBname();
		
		boolean isTrue;
		
		isTrue = TransferDBUtil.insertTransfer(dname, bname, tBranch, tDepartment, reason, approveBy, empID);
		
		if(isTrue == true) {
			
			List<Transfer> transferDetails = TransferDBUtil.getTransfer(empID);
			request.setAttribute("transferDetails", transferDetails);
			
			RequestDispatcher dis2 = request.getRequestDispatcher("PendingTransfer.jsp");
			dis2.forward(request, response);
						
		} 
		
		else {

			
			RequestDispatcher dis3 = request.getRequestDispatcher("Transfer.jsp");
			dis3.forward(request, response);

		}
		
	}

}
