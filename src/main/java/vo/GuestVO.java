package vo;

public class GuestVO {
	
	private int orderNum;
	private String guestName;
	private String guestPhone;
	private String guestPassword;
	
	
	public GuestVO() {}
	
	
	public GuestVO(int orderNum, String guestName, String guestPhone, String guestPassword) {
		super();
		this.orderNum = orderNum;
		this.guestName = guestName;
		this.guestPhone = guestPhone;
		this.guestPassword = guestPassword;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public String getGuestPhone() {
		return guestPhone;
	}
	public void setGuestPhone(String guestPhone) {
		this.guestPhone = guestPhone;
	}
	public String getGuestPassword() {
		return guestPassword;
	}
	public void setGuestPassword(String guestPassword) {
		this.guestPassword = guestPassword;
	}


	@Override
	public String toString() {
		return "GuestVO [orderNum=" + orderNum + ", guestName=" + guestName + ", guestPhone=" + guestPhone
				+ ", guestPassword=" + guestPassword + "]";
	}

	
	

}
