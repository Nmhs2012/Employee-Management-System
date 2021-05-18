package transfer;

public class Department {

	private String depID;
	private String dname;
	private String manager;

	public Department(String depID, String dname, String manager) {
		this.depID = depID;
		this.dname = dname;
		this.manager = manager;
	}

	public String getDepID() {
		return depID;
	}

	public String getDname() {
		return dname;
	}
	
	public String getManager() {
		return manager;
	}

}
