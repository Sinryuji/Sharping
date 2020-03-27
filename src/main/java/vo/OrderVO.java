package vo;

import java.sql.Timestamp;
import java.util.List;

public class OrderVO {

	private int orderNum;
	private Timestamp orderDate;
	private String state;
	private String payCase;
	private int payPrice;
	private String trackingNum;
	private String toName;
	private String toPhone;
	private String toPost;
	private String toAddress;
	private String id;
	private String toAddressEtc;
	private String impId;
	private String deliveryMessage;
	public OrderVO() {
		super();
	}
	public OrderVO(int orderNum, Timestamp orderDate, String state, String payCase, int payPrice, String trackingNum,
			String toName, String toPhone, String toPost, String toAddress, String id, String toAddressEtc, String impId, String deliveryMessage) {
		super();
		this.orderNum = orderNum;
		this.orderDate = orderDate;
		this.state = state;
		this.payCase = payCase;
		this.payPrice = payPrice;
		this.trackingNum = trackingNum;
		this.toName = toName;
		this.toPhone = toPhone;
		this.toPost = toPost;
		this.toAddress = toAddress;
		this.id = id;
		this.toAddressEtc = toAddressEtc;
		this.impId = impId;
		this.deliveryMessage = deliveryMessage;
	}
	
	public String getDeliveryMessage() {
		return deliveryMessage;
	}
	public void setDeliveryMessage(String deliveryMessage) {
		this.deliveryMessage = deliveryMessage;
	}
	public String getImpId() {
		return impId;
	}
	public void setImpId(String impId) {
		this.impId = impId;
	}
	public String getToAddressEtc() {
		return toAddressEtc;
	}
	public void setToAddressEtc(String toAddressEtc) {
		this.toAddressEtc = toAddressEtc;
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
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPayCase() {
		return payCase;
	}
	public void setPayCase(String payCase) {
		this.payCase = payCase;
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
	@Override
	public String toString() {
		return "OrderVO [orderNum=" + orderNum + ", orderDate=" + orderDate + ", state=" + state + ", payCase="
				+ payCase + ", payPrice=" + payPrice + ", trackingNum=" + trackingNum + ", toName=" + toName
				+ ", toPhone=" + toPhone + ", toPost=" + toPost + ", toAddress=" + toAddress + ", id=" + id
				+ ", toAddressEtc=" + toAddressEtc + ", impId=" + impId + ", deliveryMessage=" + deliveryMessage + "]";
	}
	
	
	
	
	
	
}
