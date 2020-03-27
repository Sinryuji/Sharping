package vo;

public class AdminVO {

	private String adminId;
	private String adminPassword;
	public String keywordM;
	
	
	public AdminVO() {
		super();
	}
	
	public AdminVO(String keywordM) {
		super();
		this.keywordM = keywordM;
	}


	public AdminVO(String adminId, String adminPassword) {
		super();
		this.adminId = adminId;
		this.adminPassword = adminPassword;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public String getKeywordM() {
		return keywordM;
	}

	public void setKeywordM(String keywordM) {
		this.keywordM = keywordM;
	}
	
	
	
	
	
}
