package vo;

import java.sql.Timestamp;

public class OrderVO {

	private int orderNum;
	private Timestamp orderDate;
	private String stats;
	private String patCase;
	private int payPrice;
	private String trackingNum;
	private String toName;
	private String toPhone;
	private String toPost;
	private String toAddress;
	private String id;
	
	public OrderVO() {
		super();
	}
	public OrderVO(int orderNum, Timestamp orderDate, String stats, String patCase, int payPrice, String trackingNum,
			String toName, String toPhone, String toPost, String toAddress, String id) {
		super();
		this.orderNum = orderNum;
		this.orderDate = orderDate;
		this.stats = stats;
		this.patCase = patCase;
		this.payPrice = payPrice;
		this.trackingNum = trackingNum;
		this.toName = toName;
		this.toPhone = toPhone;
		this.toPost = toPost;
		this.toAddress = toAddress;
		this.id = id;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public String getStats() {
		return stats;
	}
	public void setStats(String stats) {
		this.stats = stats;
	}
	public String getPatCase() {
		return patCase;
	}
	public void setPatCase(String patCase) {
		this.patCase = patCase;
	}
	public int getPayPrice() {
		return payPrice;
	}
	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}
	public String getTrackingNum() {
		return trackingNum;
	}
	public void setTrackingNum(String trackingNum) {
		this.trackingNum = trackingNum;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
}
