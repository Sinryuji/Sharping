package vo;

public class OrderListVO {

	private int olNum;
	private String productName;
	private String productThumb;
	private int optionOneNum;
	private int optionTwoNum;
	private int optionThreeNum;
	private int cnt;
	private int orderNum;
	private int optionNum;
	private int productPrice;
	private int productNum;
	
	public OrderListVO() {
		super();
	}
	public OrderListVO(int olNum, String productName, String productThumb, int optionOneNum, int optionTwoNum,

			int optionThreeNum, int cnt, int orderNum, int optionNum, int productPrice, int productNum) {

		super();
		this.olNum = olNum;
		this.productName = productName;
		this.productThumb = productThumb;
		this.optionOneNum = optionOneNum;
		this.optionTwoNum = optionTwoNum;
		this.optionThreeNum = optionThreeNum;
		this.cnt = cnt;
		this.orderNum = orderNum;
		this.optionNum = optionNum;
		this.productPrice = productPrice;
		this.productNum = productNum;
	}

	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getOlNum() {
		return olNum;
	}
	public void setOlNum(int olNum) {
		this.olNum = olNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductThumb() {
		return productThumb;
	}
	public void setProductThumb(String productThumb) {
		this.productThumb = productThumb;
	}
	public int getOptionOneNum() {
		return optionOneNum;
	}
	public void setOptionOneNum(int optionOneNum) {
		this.optionOneNum = optionOneNum;
	}
	public int getOptionTwoNum() {
		return optionTwoNum;
	}
	public void setOptionTwoNum(int optionTwoNum) {
		this.optionTwoNum = optionTwoNum;
	}
	public int getOptionThreeNum() {
		return optionThreeNum;
	}
	public void setOptionThreeNum(int optionThreeNum) {
		this.optionThreeNum = optionThreeNum;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(int optionNum) {
		this.optionNum = optionNum;
	}

	@Override
	public String toString() {
		return "OrderListVO [olNum=" + olNum + ", productName=" + productName + ", productThumb=" + productThumb
				+ ", optionOneNum=" + optionOneNum + ", optionTwoNum=" + optionTwoNum + ", optionThreeNum="
				+ optionThreeNum + ", cnt=" + cnt + ", orderNum=" + orderNum + ", optionNum=" + optionNum
				+ ", productPrice=" + productPrice + ", productNum" + productNum + "]";
	}

	
	

}
