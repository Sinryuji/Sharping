package vo;

public class BankVO {
	private int bankCode;
	private String BankName;
	
	
	public BankVO() {};
	 
	public BankVO(int bankCode, String bankName) {
		super();
		this.bankCode = bankCode;
		BankName = bankName;
	}
	public int getBankCode() {
		return bankCode;
	}
	public void setBankCode(int bankCode) {
		this.bankCode = bankCode;
	}
	public String getBankName() {
		return BankName;
	}
	public void setBankName(String bankName) {
		BankName = bankName;
	}

	@Override
	public String toString() {
		return "BankVO [bankCode=" + bankCode + ", BankName=" + BankName + "]";
	}
	
	
	
	

}
