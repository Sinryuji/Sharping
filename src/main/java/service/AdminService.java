package service;

import java.util.List;

import vo.AdminVO;
import vo.MemberVO;
import vo.NoticeVO;
import vo.SellerVO;

public interface AdminService {
	
	public abstract AdminVO searchAdminById(String adminId);
	
	//관리자 로그인
	public abstract AdminVO login(String adminId, String adminPassword);
	
	//관리자 계정 등록
	public abstract int registAdmin(AdminVO adminVO);
	
	//관리자 아이디 중복확인
	public abstract int adminIdCheck(String adminId);

	//일반회원리스트
	public abstract List<MemberVO> getMemberList(AdminVO adminVO) throws Exception;

	//판매회원리스트
	public abstract List<SellerVO> getSellerList(AdminVO adminVO) throws Exception;
	
	// 일반 회원 삭제
	public abstract int deleteMemberById(MemberVO memberVO);

	// 판매 권한 회수
	public abstract int deleteSellerById(SellerVO sellerVO);
	
	// 공지사항 리스트
	public abstract List<NoticeVO> getNoticeList(NoticeVO noticeVO) throws Exception;
	
	//공지사항 번호로 검색
	public abstract NoticeVO selectNoticeByNoticeNum(int noticeNum) throws Exception;
	
	//공지사항 삭제
	public abstract int deleteNoticeByNoticeNum(int noticeNum) throws Exception;
	
	//공지사항 수정
	public abstract int updateNoticeByNoticeNum(NoticeVO noticeVO) throws Exception;
	
	//공지사항 등록
	public abstract int insertNotice(NoticeVO noticeVO) throws Exception;
}
