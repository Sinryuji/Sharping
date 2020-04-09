package vo;

public class AdminVO {

	private String adminId;
	private String adminPassword;
	public String keywordM;
	private int page;
	private int startNum;
	private int endNum;
	
	
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

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
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

	@Override
	public String toString() {
		return "AdminVO [adminId=" + adminId + ", adminPassword=" + adminPassword + ", keywordM=" + keywordM + ", page="
				+ page + ", startNum=" + startNum + ", endNum=" + endNum + "]";
	}
	
}
