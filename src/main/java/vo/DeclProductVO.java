package vo;

import java.sql.Timestamp;

public class DeclProductVO {
	private int declNum;
	private String declReason;
	private String declText;
	private int productNum;
	private Timestamp declDate;
	private String sellerId;
	private String declId;
	private String search;
	private int page;
	private int startNum;
	private int endNum;
	
	public DeclProductVO() {
		super();
	}
	
	public DeclProductVO(int declNum, String declReason, String declText, int productNum, Timestamp declDate,
			String sellerId, String declId, String search, int page, int startNum, int endNum) {
		super();
		this.declNum = declNum;
		this.declReason = declReason;
		this.declText = declText;
		this.productNum = productNum;
		this.declDate = declDate;
		this.sellerId = sellerId;
		this.declId = declId;
		this.search = search;
		this.page = page;
		this.startNum = startNum;
		this.endNum = endNum;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getDeclNum() {
		return declNum;
	}

	public void setDeclNum(int declNum) {
		this.declNum = declNum;
	}

	public String getDeclReason() {
		return declReason;
	}

	public void setDeclReason(String declReason) {
		this.declReason = declReason;
	}

	public String getDeclText() {
		return declText;
	}

	public void setDeclText(String declText) {
		this.declText = declText;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public Timestamp getDeclDate() {
		return declDate;
	}

	public void setDeclDate(Timestamp declDate) {
		this.declDate = declDate;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getDeclId() {
		return declId;
	}

	public void setDeclId(String declId) {
		this.declId = declId;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	@Override
	public String toString() {
		return "DeclProductVO [declNum=" + declNum + ", declReason=" + declReason + ", declText=" + declText
				+ ", productNum=" + productNum + ", declDate=" + declDate + ", sellerId=" + sellerId + ", declId="
				+ declId + ", search=" + search + ", page=" + page + ", startNum=" + startNum + ", endNum=" + endNum
				+ "]";
	}

}
