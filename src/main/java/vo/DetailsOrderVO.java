package vo;

public class DetailsOrderVO {
	/*
	 * "orderDetailsNum" number not null, "orderNum" number not null, "productNum"
	 * number not null, "cartStock" number not null,
	 */
	
	private int orderDetailsNum;
	private int orderNum;
	private int optionNum;
	private int cartStock;
	
	public DetailsOrderVO() {};
	
	public DetailsOrderVO(int orderDetailsNum, int orderNum, int optionNum, int cartStock) {
		super();
		this.orderDetailsNum = orderDetailsNum;
		this.orderNum = orderNum;
		this.optionNum = optionNum;
		this.cartStock = cartStock;
	}
	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}
	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
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

	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	
	
	
}
