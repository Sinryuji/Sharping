package vo;

public class OrderProductVO {
	private int orderNum;
	private String productThumb;
	private String productName;
	private String id;
	private int payPrice;
	private String payCase;
	private String toName;
	private String toPhone;
	private String toPost;
	private String toAddress;
	private String state;
	private String search;
	private int page;
	private int startNum;
	private int endNum;
	
	public OrderProductVO() {
		super();
	}

	
	

	public OrderProductVO(int orderNum, String productThumb, String productName, String id, int payPrice,
			String payCase, String toName, String toPhone, String toPost, String toAddress, String state, String search,
			int page, int startNum, int endNum) {
		super();
		this.orderNum = orderNum;
		this.productThumb = productThumb;
		this.productName = productName;
		this.id = id;
		this.payPrice = payPrice;
		this.payCase = payCase;
		this.toName = toName;
		this.toPhone = toPhone;
		this.toPost = toPost;
		this.toAddress = toAddress;
		this.state = state;
		this.search = search;
		this.page = page;
		this.startNum = startNum;
		this.endNum = endNum;
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

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getProductThumb() {
		return productThumb;
	}

	public void setProductThumb(String productThumb) {
		this.productThumb = productThumb;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPayPrice() {
		return payPrice;
	}

	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}

	public String getPayCase() {
		return payCase;
	}

	public void setPayCase(String payCase) {
		this.payCase = payCase;
	}

	public String getToName() {
		return toName;
	}

	public void setToName(String toName) {
		this.toName = toName;
	}

	public String getToPhone() {
		return toPhone;
	}

	public void setToPhone(String toPhone) {
		this.toPhone = toPhone;
	}

	public String getToPost() {
		return toPost;
	}

	public void setToPost(String toPost) {
		this.toPost = toPost;
	}

	public String getToAddress() {
		return toAddress;
	}

	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "OrderProductVO [orderNum=" + orderNum + ", productThumb=" + productThumb + ", productName="
				+ productName + ", id=" + id + ", payPrice=" + payPrice + ", payCase=" + payCase + ", toName=" + toName
				+ ", toPhone=" + toPhone + ", toPost=" + toPost + ", toAddress=" + toAddress + ", state=" + state
				+ ", search=" + search + ", page=" + page + ", startNum=" + startNum + ", endNum=" + endNum + "]";
	}
	
}
