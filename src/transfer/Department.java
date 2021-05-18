package transfer;

public class Department {

	private int depID;
	private String dname;
	private String manager;

	public Department(int depID, String dname, String manager) {
		this.depID = depID;
		this.dname = dname;
		this.manager = manager;
	}

	public int getDepID() {
		return depID;
	}

	public String getDname() {
		return dname;
	}
	
	public String getManager() {
		return manager;
	}

}
