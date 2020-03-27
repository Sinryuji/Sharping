package vo;

import java.sql.Timestamp;

public class SellerListVO {

	private String id;
	private String email;
	private Timestamp regDate;
	private int sellerGrade;
	
	public SellerListVO() {
		super();
	}
	public SellerListVO(String id, String email, Timestamp regDate, int sellerGrade) {
		super();
		this.id = id;
		this.email = email;
		this.regDate = regDate;
		this.sellerGrade = sellerGrade;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getSellerGrade() {
		return sellerGrade;
	}
	public void setSellerGrade(int sellerGrade) {
		this.sellerGrade = sellerGrade;
	}
	
	
}
