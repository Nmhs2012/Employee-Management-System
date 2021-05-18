package leave;

public class Leave {
	private int leaveID;
	private int empID;
	private String leaveCode;
    private String fdate;
    private String tdate;
    private String type;
    private String reason;
    private String status;
    
  //Constructor
	public Leave(int leaveID, int empID, String leaveCode, String fdate, String tdate, String type, String reason,
			String status) {
		this.leaveID = leaveID;
		this.empID = empID;
		this.leaveCode = leaveCode;
		this.fdate = fdate;
		this.tdate = tdate;
		this.type = type;
		this.reason = reason;
		this.status = status;
	}

	//Getters
	public int getLeaveID() {
		return leaveID;
	}

	public int getEmpID() {
		return empID;
	}

	public String getLeaveCode() {
		return leaveCode;
	}

	public String getFdate() {
		return fdate;
	}
	
	public String getTdate() {
		return tdate;
	}

	public String getType() {
		return type;
	}

	public String getReason() {
		return reason;
	}

	public String getStatus() {
		return status;
	}

}
