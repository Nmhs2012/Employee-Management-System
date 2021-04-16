package transfer;

public class Department {
	private int dID;
	private String dname;
	private String dlocation;
	private String manager;
	
	public Department(int dID, String dname, String dlocation, String manager) {
		super();
		this.dID = dID;
		this.dname = dname;
		this.dlocation = dlocation;
		this.manager = manager;
	}

	public int getDID() {
		return dID;
	}

	public String getDname() {
		return dname;
	}

	public String getDlocation() {
		return dlocation;
	}

	public String getManager() {
		return manager;
	}

}
