package vo;

public class BasketListVO {
	
	private int basketNum;
	private String id;
	private int optionNum;
	private int cnt;
	private String productImage;
	private int productPrice;
	private int deliveryPrice;
	private int productNum;
	private String productName;
	private int stock;
	
	
	public BasketListVO() {}
	


	public BasketListVO(int basketNum, String id, int optionNum, int cnt, String productImage, int productPrice,
			int deliveryPrice, int productNum, String productName, int stock) {
		super();
		this.basketNum = basketNum;
		this.id = id;
		this.optionNum = optionNum;
		this.cnt = cnt;
		this.productImage = productImage;
		this.productPrice = productPrice;
		this.deliveryPrice = deliveryPrice;
		this.productNum = productNum;
		this.productName = productName;
		this.stock = stock;
	}















	public int getStock() {
		return stock;
	}




	public void setStock(int stock) {
		this.stock = stock;
	}




	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getBasketNum() {
		return basketNum;
	}


	public void setBasketNum(int basketNum) {
		this.basketNum = basketNum;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getOptionNum() {
		return optionNum;
	}


	public void setOptionNum(int optionNum) {
		this.optionNum = optionNum;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	public String getProductImage() {
		return productImage;
	}


	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public int getDeliveryPrice() {
		return deliveryPrice;
	}


	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}


	public int getProductNum() {
		return productNum;
	}


	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	




	@Override
	public String toString() {
		return "BasketListVO [basketNum=" + basketNum + ", id=" + id + ", optionNum=" + optionNum + ", cnt=" + cnt
				+ ", productImage=" + productImage + ", productPrice=" + productPrice + ", deliveryPrice="
				+ deliveryPrice + ", productNum=" + productNum + ", productName=" + productName + ", stock=" + stock
				+ ", productPriceSum="+"]";
	}
	
	
	
	
	
	
	
	
	

}
