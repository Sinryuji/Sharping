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

	public ProductVO() {
		super();
	}
	public ProductVO(int productNum, String productName, String productText, int productPrice, String productThumb,
			String productImage, String productDisplay, int stock, int categoryNum, Timestamp productDate, String id,
			String productMeterial, String manufacturer, Date mfDate, String origin, int deliveryPrice,
			String optionOneName, String optionTwoName, String optionThreeName) {
		super();
		this.productNum = productNum;
		this.productName = productName;
		this.productText = productText;
		this.productPrice = productPrice;
		this.productThumb = productThumb;
		this.productImage = productImage;
		this.productDisplay = productDisplay;
		this.stock = stock;
		this.categoryNum = categoryNum;
		this.productDate = productDate;
		this.id = id;
		this.productMeterial = productMeterial;
		this.manufacturer = manufacturer;
		this.mfDate = mfDate;
		this.origin = origin;
		this.deliveryPrice = deliveryPrice;
		this.optionOneName = optionOneName;
		this.optionTwoName = optionTwoName;
		this.optionThreeName = optionThreeName;
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
				+ ", optionThreeName=" + optionThreeName + "]";
	}

	

	
}
