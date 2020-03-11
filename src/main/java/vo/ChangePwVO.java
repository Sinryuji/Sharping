package vo;

public class ChangePwVO {

	String email;
	String newPassword;
	String phone;
	
	public ChangePwVO() {
		super();
	}
	
	
	public ChangePwVO(String email, String newPassword, String phone) {
		super();
		this.email = email;
		this.newPassword = newPassword;
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
