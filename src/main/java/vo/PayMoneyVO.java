package vo;

public class PayMoneyVO {
	
	private int payPrice;
	private int bankCode;
	private String vaNum;
	
	public PayMoneyVO() {}
	
	public PayMoneyVO(int payPrice, int bankCode, String vaNum) {
		super();
		this.payPrice = payPrice;
		this.bankCode = bankCode;
		this.vaNum = vaNum;
	}
	public int getPayPrice() {
		return payPrice;
	}
	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
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
	
	
	
	
}