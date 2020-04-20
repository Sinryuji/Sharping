package vo;

import java.sql.Date;
import java.sql.Timestamp;

public class ProductVO {

	private int productNum;
	private String productName;
	private String productText;
	private int productPrice;
	private String productThumb;
	private String productImage;
	private String productDisplay;
	private int stock;
	private int categoryNum;
	private Timestamp productDate;
	private String id;
	private String productMeterial;
	private String manufacturer;
	private Date mfDate;
	private String origin;
	private int deliveryPrice;
	private String optionOneName;
	private String optionTwoName;
	private String optionThreeName;
	private String storeName;
	private int page;
	private int startNum;
	private int endNum;
	private String productSale;
	

	public String getProductSale() {
		return productSale;
	}



	public void setProductSale(String productSale) {
		this.productSale = productSale;
	}



	public ProductVO() {
		super();
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



	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductText() {
		return productText;
	}
	public void setProductText(String productText) {
		this.productText = productText;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductThumb() {
		return productThumb;
	}
	public void setProductThumb(String productThumb) {
		this.productThumb = productThumb;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public String getProductDisplay() {
		return productDisplay;
	}
	public void setProductDisplay(String productDisplay) {
		this.productDisplay = productDisplay;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public Timestamp getProductDate() {
		return productDate;
	}
	public void setProductDate(Timestamp productDate) {
		this.productDate = productDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductMeterial() {
		return productMeterial;
	}
	public void setProductMeterial(String productMeterial) {
		this.productMeterial = productMeterial;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}


	public Date getMfDate() {
		return mfDate;
	}

	public void setMfDate(Date mfDate) {
		this.mfDate = mfDate;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public String getOptionOneName() {
		return optionOneName;
	}
	public void setOptionOneName(String optionOneName) {
		this.optionOneName = optionOneName;
	}
	public String getOptionTwoName() {
		return optionTwoName;
	}
	public void setOptionTwoName(String optionTwoName) {
		this.optionTwoName = optionTwoName;
	}
	public String getOptionThreeName() {
		return optionThreeName;
	}
	public void setOptionThreeName(String optionThreeName) {
		this.optionThreeName = optionThreeName;
	}

	@Override
	public String toString() {
		return "ProductVO [productNum=" + productNum + ", productName=" + productName + ", productText=" + productText
				+ ", productPrice=" + productPrice + ", productThumb=" + productThumb + ", productImage=" + productImage
				+ ", productDisplay=" + productDisplay + ", stock=" + stock + ", categoryNum=" + categoryNum
				+ ", productDate=" + productDate + ", id=" + id + ", productMeterial=" + productMeterial
				+ ", manufacturer=" + manufacturer + ", mfDate=" + mfDate + ", origin=" + origin + ", deliveryPrice="
				+ deliveryPrice + ", optionOneName=" + optionOneName + ", optionTwoName=" + optionTwoName
				+ ", optionThreeName=" + optionThreeName + ", storeName=" + storeName + ", page=" + page + ", startNum="
				+ startNum + ", endNum=" + endNum + ", productSale=" + productSale + "]";
	}

	
}
