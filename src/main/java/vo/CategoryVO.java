package vo;

public class CategoryVO {
	private int categoryNum;
	private String categoryName;
	private int categoryDepth;
	private int pcNum;

	public CategoryVO() {
		super();
	}
	public CategoryVO(int categoryNum, String categoryName, int categoryDepth, int pcNum) {
		super();
		this.categoryNum = categoryNum;
		this.categoryName = categoryName;
		this.categoryDepth = categoryDepth;
		this.pcNum = pcNum;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getCategoryDepth() {
		return categoryDepth;
	}
	public void setCategoryDepth(int categoryDepth) {
		this.categoryDepth = categoryDepth;
	}
	public int getPcNum() {
		return pcNum;
	}
	public void setPcNum(int pcNum) {
		this.pcNum = pcNum;
	}
	@Override
	public String toString() {
		return "CategoryVO [categoryNum=" + categoryNum + ", categoryName=" + categoryName + ", categoryDepth="
				+ categoryDepth + ", pcNum=" + pcNum + "]";
	}
	
}
