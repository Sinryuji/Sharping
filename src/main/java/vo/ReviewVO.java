package vo;

public class ReviewVO {
	private int reviewNum;
	private int orderNum;
	private String id;
	private String reviewText;
	private int score;
	private String reviewImage;
	private String reviewTitle;
	
	public ReviewVO() {
		super();
	}

	public ReviewVO(int reviewNum, int orderNum, String id, String reviewText, int score, String reviewImage,
			String reviewTitle) {
		super();
		this.reviewNum = reviewNum;
		this.orderNum = orderNum;
		this.id = id;
		this.reviewText = reviewText;
		this.score = score;
		this.reviewImage = reviewImage;
		this.reviewTitle = reviewTitle;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReviewText() {
		return reviewText;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getReviewImage() {
		return reviewImage;
	}

	public void setReviewImage(String reviewImage) {
		this.reviewImage = reviewImage;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNum=" + reviewNum + ", orderNum=" + orderNum + ", id=" + id + ", reviewText="
				+ reviewText + ", score=" + score + ", reviewImage=" + reviewImage + ", reviewTitle=" + reviewTitle
				+ "]";
	}
	
	
	
	
}
