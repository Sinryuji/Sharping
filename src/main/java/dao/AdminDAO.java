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
	
	//카테고리 뎊스 기준으로 블러오기
	public abstract List<CategoryVO> selectCategoryByCategoryDepth (int categoryDepth);
	
	//부모 카테고리 번호로 카테고리 가져오기
	public abstract List<CategoryVO> selectCategoryByPcNum(int pcNum);
	
	//카테고리 번호 최대값 가져오기
	public abstract int selectMaxCategoryNum();
	
	//카테고리 번호로 카테고리 가져오기
	public abstract CategoryVO selectCategoryByCategoryNum(int categoryNum);
	
	//대분류 카테고리 추가
	public abstract int insertCategoryDepthOne(String categoryName);
	
	//중분류 카테고리 추가
	public abstract int insertCategoryDepthTwo(CategoryVO categoryVO);
	
	//소분류 카테고리 추가
	public abstract int insertCategoryDepthThree(CategoryVO categoryVO);
	
	//카테고리 수정
	public abstract int updateCategory(CategoryVO categoryVO);
	
	//카테고리 삭제
	public abstract int deleteCategory(int categoryNum);
}
