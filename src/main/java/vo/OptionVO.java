package vo;

public class OptionVO {

	private int optionNum;
	private int productNum;
	private int stock;
	private int optionOneNum;
	private int optionTwoNum;
	private int optionThreeNum;

	public OptionVO() {
		super();
	}
	



	public OptionVO(int optionNum, int productNum, int stock, int optionOneNum, int optionTwoNum, int optionThreeNum) {

		super();
		this.optionNum = optionNum;
		this.productNum = productNum;
		this.stock = stock;
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

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
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




	@Override
	public String toString() {
		return "OptionVO [optionNum=" + optionNum + ", productNum=" + productNum + ", stock=" + stock
				+ ", optionOneNum=" + optionOneNum + ", optionTwoNum=" + optionTwoNum + ", optionThreeNum="
				+ optionThreeNum + "]";
	}

	

}

