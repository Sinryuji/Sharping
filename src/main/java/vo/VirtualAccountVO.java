package vo;

import java.sql.Date;

public class VirtualAccountVO {
	
	
	private String vaNum;
	private int payNum;
	private int bankCode;
	private int payPrice;
	private String respCode;
	private Date depositDate;
	public VirtualAccountVO() {}
	

	

	public VirtualAccountVO(String vaNum, int payNum, int bankCode, int payPrice, String respCode, Date depositDate) {
		super();
		this.vaNum = vaNum;
		this.payNum = payNum;
		this.bankCode = bankCode;
		this.payPrice = payPrice;
		this.respCode = respCode;
		this.depositDate = depositDate;
	}




	public String getRespCode() {
		return respCode;
	}




	public void setRespCode(String respCode) {
		this.respCode = respCode;
	}




	public String getVaNum() {
		return vaNum;
	}

	public void setVaNum(String vaNum) {
		this.vaNum = vaNum;
	}

	public int getPayNum() {
		return payNum;
	}

	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}

	public int getBankCode() {
		return bankCode;
	}

	public void setBankCode(int bankCode) {
		this.bankCode = bankCode;
	}

	public int getPayPrice() {
		return payPrice;
	}

	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}

	public Date getDepositDate() {
		return depositDate;
	}

	public void setDepositDate(Date depositDate) {
		this.depositDate = depositDate;
	}




	@Override
	public String toString() {
		return "VirtualAccountVO [vaNum=" + vaNum + ", payNum=" + payNum + ", bankCode=" + bankCode + ", payPrice="
				+ payPrice + ", respCode=" + respCode + ", depositDate=" + depositDate + "]";
	}

	

}
