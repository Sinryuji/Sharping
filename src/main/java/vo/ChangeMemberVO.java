package vo;

public class ChangeMemberVO {
	private String id;
	private String newPhone;
	private String newEmail;
	private String newStoreName;
	private String newStoreAddress;
	private String newStoreText;
	private String newPost;
	private String newAddress;
	private int newBankCode;
	private String newBankAccount;

	
	public ChangeMemberVO() {}
	
	public ChangeMemberVO(String id, String newPhone, String newEmail, String newStoreName, String newStoreAddress,
			String newStoreText, String newPost, String newAddress, int newBankCode, String newBankAccount) {
		super();
		this.id = id;
		this.newPhone = newPhone;
		this.newEmail = newEmail;
		this.newStoreName = newStoreName;
		this.newStoreAddress = newStoreAddress;
		this.newStoreText = newStoreText;
		this.newPost = newPost;
		this.newAddress = newAddress;
		this.newBankCode = newBankCode;
		this.newBankAccount = newBankAccount;
	}

	public String getNewStoreName() {
		return newStoreName;
	}

	public void setNewStoreName(String newStoreName) {
		this.newStoreName = newStoreName;
	}

	public String getNewStoreAddress() {
		return newStoreAddress;
	}

	public void setNewStoreAddress(String newStoreAddress) {
		this.newStoreAddress = newStoreAddress;
	}

	public String getNewStoreText() {
		return newStoreText;
	}

	public void setNewStoreText(String newStoreText) {
		this.newStoreText = newStoreText;
	}

	public String getNewPost() {
		return newPost;
	}

	public void setNewPost(String newPost) {
		this.newPost = newPost;
	}

	public String getNewAddress() {
		return newAddress;
	}

	public void setNewAddress(String newAddress) {
		this.newAddress = newAddress;
	}

	public int getNewBankCode() {
		return newBankCode;
	}

	public void setNewBankCode(int newBankCode) {
		this.newBankCode = newBankCode;
	}

	public String getNewBankAccount() {
		return newBankAccount;
	}

	public void setNewBankAccount(String newBankAccount) {
		this.newBankAccount = newBankAccount;
	}

	public String getNewPhone() {
		return newPhone;
	}

	public void setNewPhone(String newPhone) {
		this.newPhone = newPhone;
	}

	public String getNewEmail() {
		return newEmail;
	}

	public void setNewEmail(String newEmail) {
		this.newEmail = newEmail;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "ChangeMemberVO [id=" + id + ", newPhone=" + newPhone + ", newEmail=" + newEmail + ", newStoreName="
				+ newStoreName + ", newStoreAddress=" + newStoreAddress + ", newStoreText=" + newStoreText
				+ ", newPost=" + newPost + ", newAddress=" + newAddress + ", newBankCode=" + newBankCode
				+ ", newBankAccount=" + newBankAccount + "]";
	}	
	
	
}
