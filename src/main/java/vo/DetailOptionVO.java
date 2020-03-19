package vo;

public class DetailOptionVO {
	private int doNum;
	private String optionName;
	private int optionLevel;
	private int productNum;
	
	
	public DetailOptionVO() {
		super();
	}


	public DetailOptionVO(int doNum, String optionName, int optionLevel, int productNum) {
		super();
		this.doNum = doNum;
		this.optionName = optionName;
		this.optionLevel = optionLevel;
		this.productNum = productNum;
	}


	public int getDoNum() {
		return doNum;
	}


	public void setDoNum(int doNum) {
		this.doNum = doNum;
	}


	public String getOptionName() {
		return optionName;
	}


	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}


	public int getOptionLevel() {
		return optionLevel;
	}


	public void setOptionLevel(int optionLevel) {
		this.optionLevel = optionLevel;
	}


	public int getProductNum() {
		return productNum;
	}


	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	
	
	
	
	
	
	
	
}
