package transfer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReportViewServlet")
public class ReportViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Transfer> RtransferDetails = TransferDBUtil.getTransferDetails();
		request.setAttribute("RtransferDetails", RtransferDetails);
		
			if(RtransferDetails.size() != 0) {
				Transfer tr = RtransferDetails.get(0);
				String eid = tr.getEmpID();
		
				List<Employee> emploDetails = TransferDBUtil.getEmployeeDetails(eid);
				request.setAttribute("emploDetails", emploDetails);
			}
		
			RequestDispatcher dis2 = request.getRequestDispatcher("PrintReport.jsp");
			dis2.forward(request, response);
		
		
		
	}

}
