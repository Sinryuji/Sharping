package vo;

import java.sql.Timestamp;

public class PayBankVO {
	
	private String orderNum;
	private Timestamp payDate;
	private Timestamp cancleDate;
	private int bankCode;
	private String vaNum;
	
	public PayBankVO() {}
	public PayBankVO(String orderNum, Timestamp payDate, Timestamp cancleDate, int bankCode, String vaNum) {
		super();
		this.orderNum = orderNum;
		this.payDate = payDate;
		this.cancleDate = cancleDate;
		this.bankCode = bankCode;
		this.vaNum = vaNum;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public Timestamp getPayDate() {
		return payDate;
	}
	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}
	public Timestamp getCancleDate() {
		return cancleDate;
	}
	public void setCancleDate(Timestamp cancleDate) {
		this.cancleDate = cancleDate;
	}
	public int getBankCode() {
		return bankCode;
	}
	public void setBankCode(int bankCode) {
		this.bankCode = bankCode;
	}
	public String getVaNum() {
		return vaNum;
	}
	public void setVaNum(String vaNum) {
		this.vaNum = vaNum;
	}
	@Override
	public String toString() {
		return "PayBankVO [orderNum=" + orderNum + ", payDate=" + payDate + ", cancleDate=" + cancleDate + ", bankCode="
				+ bankCode + ", vaNum=" + vaNum + "]";
	}
	
	
	
	

}
