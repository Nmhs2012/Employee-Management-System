package transfer;

public class Employee {
	
	private int id;
	private String name;
	private String address;
	private String username;
	private String password;
	
	public Employee(int id, String name, String address, String username, String password) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.username = username;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}
	
}