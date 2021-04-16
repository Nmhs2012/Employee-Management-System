package transfer;

public class Transfer {
	private int transferID;
	private String depFrom;
	private String depTo;
	private String reason;
	
	public Transfer(int transferID, String depFrom, String depTo, String reason) {
		this.transferID = transferID;
		this.depFrom = depFrom;
		this.depTo = depTo;
		this.reason = reason;
	}

	public int getTransferID() {
		return transferID;
	}

	public String getDepFrom() {
		return depFrom;
	}

	public String getDepTo() {
		return depTo;
	}

	public String getReason() {
		return reason;
	}
	
}
