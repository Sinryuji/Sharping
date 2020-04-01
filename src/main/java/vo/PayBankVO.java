package vo;

import java.sql.Timestamp;

public class PayBankVO {
	
	private int payNum;
	private Timestamp payDate;
	private Timestamp cancleDate;
	private int bankCode;
	private String vaNum;
	
	public PayBankVO() {}
	
	
	public PayBankVO(int payNum, Timestamp payDate, Timestamp cancleDate, int bankCode, String vaNum) {
		super();
		this.payNum = payNum;
		this.payDate = payDate;
		this.cancleDate = cancleDate;
		this.bankCode = bankCode;
		this.vaNum = vaNum;
	}


	public int getPayNum() {
		return payNum;
	}
	public void setPayNum(int payNum) {
		this.payNum = payNum;
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
		return "PayBankVO [payNum=" + payNum + ", payDate=" + payDate + ", cancleDate=" + cancleDate + ", bankCode="
				+ bankCode + ", vaNum=" + vaNum + "]";
	}
	
	
	
	
	

}
