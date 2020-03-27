package vo;

import java.sql.Timestamp;


public class NoticeVO {
	private int noticeNum;
	private String adminId;
	private String noticeSubject;
	private String noticeText;
	private Timestamp noticeDate;
	private String noticePost;
	
	

	public Integer getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(Integer noticeNum) {
		this.noticeNum = noticeNum;
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
	
	
	
}
