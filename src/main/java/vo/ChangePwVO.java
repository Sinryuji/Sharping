package vo;

public class ChangePwVO {
	String id;
	String password;
	String email;
	String newPassword;
	String phone;
	
	public ChangePwVO() {
		super();
	}
	
	public ChangePwVO(String id, String email, String newPassword, String phone) {
		super();
		this.id = id;
		this.email = email;
		this.newPassword = newPassword;
		this.phone = phone;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
