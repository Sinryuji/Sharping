package vo;

public class WishListVO {
	private int wishNum;
	private String id;
	private int productNum;
	
	
	public WishListVO() {
		super();
	}


	public WishListVO(int wishNum, String id, int productNum) {
		super();
		this.wishNum = wishNum;
		this.id = id;
		this.productNum = productNum;
	}


	public int getWishNum() {
		return wishNum;
	}


	public void setWishNum(int wishNum) {
		this.wishNum = wishNum;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getProductNum() {
		return productNum;
	}


	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}


	@Override
	public String toString() {
		return "WishListVO [wishNum=" + wishNum + ", id=" + id + ", productNum=" + productNum + "]";
	}

	
}
