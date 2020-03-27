package vo;

public class DeliveryAddressVO {
	
	private String daaName;
	private String id;
	private String daPost;
	private String daAddress;
	private String daName;
	private String daPhone;
	private String daAddressEtc;
	private String newDaaName;
	
	public DeliveryAddressVO() {
		super();
	}

	
	public DeliveryAddressVO(String daaName, String id, String daPost, String daAddress, String daName, String daPhone,
			String daAddressEtc, String newDaaName) {
		super();
		this.daaName = daaName;
		this.id = id;
		this.daPost = daPost;
		this.daAddress = daAddress;
		this.daName = daName;
		this.daPhone = daPhone;
		this.daAddressEtc = daAddressEtc;
		this.newDaaName = newDaaName;
	}
	
	public String getNewDaaName() {
		return newDaaName;
	}


	public void setNewDaaName(String newDaaName) {
		this.newDaaName = newDaaName;
	}


	public String getDaAddressEtc() {
		return daAddressEtc;
	}


	public void setDaAddressEtc(String daAddressEtc) {
		this.daAddressEtc = daAddressEtc;
	}


	public String getDaaName() {
		return daaName;
	}
	public void setDaaName(String daaName) {
		this.daaName = daaName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDaPost() {
		return daPost;
	}
	public void setDaPost(String daPost) {
		this.daPost = daPost;
	}
	public String getDaAddress() {
		return daAddress;
	}
	public void setDaAddress(String daAddress) {
		this.daAddress = daAddress;
	}
	public String getDaName() {
		return daName;
	}
	public void setDaName(String daName) {
		this.daName = daName;
	}
	public String getDaPhone() {
		return daPhone;
	}
	public void setDaPhone(String daPhone) {
		this.daPhone = daPhone;
	}
	
	

}
