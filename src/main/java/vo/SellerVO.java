package vo;

public class SellerVO{

	public String id;
	public String storeName;
	public String storeAddress;
	public String storeText;
	public int sellerGrade;
	public String post;
	public String address;
	public int bankCode;
	public String bankAccount;
	
	public SellerVO() {
		super();
	}
	public SellerVO(String id, String storeName, String storeAddress, String storeText, int sellerGrade, String post,
			String address, int bankCode, String bankAccount) {
		this.id = id;
		this.storeName = storeName;
		this.storeAddress = storeAddress;
		this.storeText = storeText;
		this.sellerGrade = sellerGrade;
		this.post = post;
		this.address = address;
		this.bankCode = bankCode;
		this.bankAccount = bankAccount;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public String getStoreText() {
		return storeText;
	}
	public void setStoreText(String storeText) {
		this.storeText = storeText;
	}
	public int getSellerGrade() {
		return sellerGrade;
	}
	public void setSellerGrade(int sellerGrade) {
		this.sellerGrade = sellerGrade;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getBankCode() {
		return bankCode;
	}
	public void setBankCode(int bankCode) {
		this.bankCode = bankCode;
	}
	public String getBankAccount() {
		return bankAccount;
	}
	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	
	
}
