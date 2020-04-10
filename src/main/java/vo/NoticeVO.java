package vo;

import java.sql.Timestamp;


public class NoticeVO {
	private int noticeNum;
	private String adminId;
	private String noticeSubject;
	private String noticeText;
	private Timestamp noticeDate;
	private String noticePost;
	private int page;
	private int startNum;
	private int endNum;
	
	
	
	
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
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public int getNoticeNum() {
		return noticeNum;
	}
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getNoticeSubject() {
		return noticeSubject;
	}
	public void setNoticeSubject(String noticeSubject) {
		this.noticeSubject = noticeSubject;
	}
	public String getNoticeText() {
		return noticeText;
	}
	public void setNoticeText(String noticeText) {
		this.noticeText = noticeText;
	}
	public Timestamp getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Timestamp noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticePost() {
		return noticePost;
	}
	public void setNoticePost(String noticePost) {
		this.noticePost = noticePost;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNum=" + noticeNum + ", adminId=" + adminId + ", noticeSubject=" + noticeSubject
				+ ", noticeText=" + noticeText + ", noticeDate=" + noticeDate + ", noticePost=" + noticePost + ", page="
				+ page + ", startNum=" + startNum + ", endNum=" + endNum + "]";
	}
	
}
