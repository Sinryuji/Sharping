package vo;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("BoardVO")
public class MemberVO {
	
	public MemberVO() {}

	public MemberVO(String id, String password, String name, String phone, String email, Timestamp regDate,
			int memberGrade) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.regDate = regDate;
		this.memberGrade = memberGrade;
	}

	private String id;
	private String password;
	private String name;
	private String phone;
	private String email;
	private Timestamp regDate;
	private int memberGrade;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public int getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(int memberGrade) {
		this.memberGrade = memberGrade;
	}
	
	
}

	