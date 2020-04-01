package dao;

import java.util.List;

import vo.AdminVO;
import vo.CategoryVO;
import vo.MemberVO;
import vo.NoticeVO;
import vo.SellerVO;

public interface AdminDAO {

	public abstract AdminVO selectAdminById(String adminId);
	
	public abstract int insertAdmin(AdminVO adminVO);
	
	public abstract int selectAdminId(String adminId);
	
	//일반회원리스트
	public abstract List<MemberVO> getMemberList(AdminVO adminVO) throws Exception;
	
	//판매회원리스트
	public abstract List<SellerVO> getSellerList(AdminVO adminVO) throws Exception;
	
	// 회원 삭제
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
	
	//공지사항 작성
	public abstract int insertNotice(NoticeVO noticeVO) throws Exception;
	
	//공지사항 진열여부
	public abstract int updateNoticePostByNoticeNum(NoticeVO noticeVO) throws Exception;
	
	//카테고리 조회
	public abstract List<CategoryVO> selectCategory() throws Exception;
	
	//카테고리 등록
	public abstract int insertCategory(CategoryVO categoryVO) throws Exception;
	
	//카테고리 수정
	public abstract int updateCategory(CategoryVO categoryVO) throws Exception;
	
	//카테고리 삭제
	public abstract int deleteCategory(int categoryNum) throws Exception;
}
