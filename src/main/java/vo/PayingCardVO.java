package vo;

public class PayingCardVO {
	
	private String productName;
	private int payPrice;
	private String memberEmail;
	private String memberName;
	private String memberPhone;
	private String memberAddress;
	private String memberPost;
	private int payNum;
	
	public PayingCardVO() {
		super();
	}
	

	public PayingCardVO(String productName, int payPrice, String memberEmail, String memberName, String memberPhone,
			String memberAddress, String memberPost, int payNum) {
		super();
		this.productName = productName;
		this.payPrice = payPrice;
		this.memberEmail = memberEmail;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.memberPost = memberPost;
		this.payNum = payNum;
	}

	public int getPayNum() {
		return payNum;
	}
	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPayPrice() {
		return payPrice;
	}
	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public String getMemberPost() {
		return memberPost;
	}
	public void setMemberPost(String memberPost) {
		this.memberPost = memberPost;
	}

}

