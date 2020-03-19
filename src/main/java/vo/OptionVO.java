package vo;

public class OptionVO {
	private int optionNum;
	private int productNum;
	private int cnt;
	private int optionOneNum;
	private int optionTwoNum;
	private int optionThreeNum;
	
	
	public OptionVO() {
		super();
	}


	public OptionVO(int optionNum, int productNum, int cnt, int optionOneNum, int optionTwoNum, int optionThreeNum) {
		super();
		this.optionNum = optionNum;
		this.productNum = productNum;
		this.cnt = cnt;
		this.optionOneNum = optionOneNum;
		this.optionTwoNum = optionTwoNum;
		this.optionThreeNum = optionThreeNum;
	}


	public int getOptionNum() {
		return optionNum;
	}


	public void setOptionNum(int optionNum) {
		this.optionNum = optionNum;
	}


	public int getProductNum() {
		return productNum;
	}


	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	public int getOptionOneNum() {
		return optionOneNum;
	}


	public void setOptionOneNum(int optionOneNum) {
		this.optionOneNum = optionOneNum;
	}


	public int getOptionTwoNum() {
		return optionTwoNum;
	}


	public void setOptionTwoNum(int optionTwoNum) {
		this.optionTwoNum = optionTwoNum;
	}


	public int getOptionThreeNum() {
		return optionThreeNum;
	}


	public void setOptionThreeNum(int optionThreeNum) {
		this.optionThreeNum = optionThreeNum;
	}
	
	
	
	
}
