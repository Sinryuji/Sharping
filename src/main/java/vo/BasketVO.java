package vo;

public class BasketVO {
	
	private int basketNum;
	private String id;
	private int optionNum;
	private int cnt;
	
	public BasketVO() {};
	
	public BasketVO(int basketNum, String id, int optionNum, int cnt) {
		super();
		this.basketNum = basketNum;
		this.id = id;
		this.optionNum = optionNum;
		this.cnt = cnt;
	}
	public int getBaskitNum() {
		return basketNum;
	}
	public void setBaskitNum(int basketNum) {
		this.basketNum = basketNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(int optionNum) {
		this.optionNum = optionNum;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "BasketVO [basketNum=" + basketNum + ", id=" + id + ", optionNum=" + optionNum + ", cnt=" + cnt + "]";
	}
	
	
	

}
