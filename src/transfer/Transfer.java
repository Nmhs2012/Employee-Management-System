package transfer;

public class Transfer {

	private int tranID;
	private String cBranch;
	private String cDepartment;
	private String tBranch;
	private String tDepartment;
	private String reason;
	private String approveBy;
	private String status;
	private String empID;

	public Transfer(int tranID, String cBranch, String cDepartment, String tBranch, String tDepartment, String reason,
			String approveBy, String status, String empID) {
		this.tranID = tranID;
		this.cBranch = cBranch;
		this.cDepartment = cDepartment;
		this.tBranch = tBranch;
		this.tDepartment = tDepartment;
		this.reason = reason;
		this.approveBy = approveBy;
		this.status = status;
		this.empID = empID;
	}

	public int getTranID() {
		return tranID;
	}

	public String getcBranch() {
		return cBranch;
	}

	public String getcDepartment() {
		return cDepartment;
	}

	public String gettBranch() {
		return tBranch;
	}

	public String gettDepartment() {
		return tDepartment;
	}

	public String getReason() {
		return reason;
	}

	public String getApproveBy() {
		return approveBy;
	}
	
	public String getStatus() {
		return status;
	}
	
	public String getEmpID() {
		return empID;
	}
	

}
