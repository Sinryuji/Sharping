package service;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import dao.AdminDAO;
import dao.MemberDAO;
import exception.IdPasswordNotMatchingException;
import vo.AdminVO;
import vo.CategoryVO;
import vo.DeclProductVO;
import vo.MemberVO;
import vo.NoticeVO;
import vo.SellerVO;

@Service
public class AdminServiceImpl implements AdminService {

	private AdminDAO adminDAO;
	private MemberDAO memberDAO;
	

	public AdminServiceImpl() {
		super();
	}

	public AdminServiceImpl(AdminDAO adminDAO) {
		super();
		this.adminDAO = adminDAO;
	}

	public AdminDAO getAdminDAO() {
		return adminDAO;
	}

	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	
	public MemberDAO getMemberDAO() {
		return memberDAO;
	}

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	public AdminVO searchAdminById(String adminId) {
		return adminDAO.selectAdminById(adminId);
	}
	
	@Override
	public AdminVO login(String adminId, String adminPassword) {
		AdminVO adminVO = adminDAO.selectAdminById(adminId);

		if (adminVO == null) {
			return null;
		}
		if (!BCrypt.checkpw(adminPassword, adminVO.getAdminPassword())) {
			throw new IdPasswordNotMatchingException();
		} else {
			return new AdminVO(adminVO.getAdminId(), adminVO.getAdminPassword());
		}
	}
	
	@Override
	public int registAdmin(AdminVO adminVO) {
		return adminDAO.insertAdmin(adminVO);
	}
	
	@Override
	public int adminIdCheck(String adminId) {
		int result = adminDAO.selectAdminId(adminId);
		return result;
	}
	
	@Override
	public List<MemberVO> getMemberList(AdminVO adminVO) throws Exception {
		return adminDAO.getMemberList(adminVO);
	}
	
	@Override
	public List<SellerVO> getSellerList(AdminVO adminVO) throws Exception {
		return adminDAO.getSellerList(adminVO);
	}
	
	@Override
	public int deleteMemberById(MemberVO memberVO) {
		return adminDAO.deleteMemberById(memberVO);
	}
	
	@Override
	public int deleteSellerById(SellerVO sellerVO) {
		return adminDAO.deleteSellerById(sellerVO);
	}
	
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO) throws Exception {
		return adminDAO.getNoticeList(noticeVO);
	}
	
	
	@Override
	public NoticeVO selectNoticeByNoticeNum(int noticeNum) throws Exception {
		return adminDAO.selectNoticeByNoticeNum(noticeNum);
	}

	@Override
	public int deleteNoticeByNoticeNum(int noticeNum) throws Exception {
		return adminDAO.deleteNoticeByNoticeNum(noticeNum);
	}
	
	@Override
	public int updateNoticeByNoticeNum(NoticeVO noticeVO) throws Exception {
		return adminDAO.updateNoticeByNoticeNum(noticeVO);
	}
	
	@Override
	public int insertNotice(NoticeVO noticeVO) throws Exception {
		return adminDAO.insertNotice(noticeVO);
	}
	
	@Override
	public List<CategoryVO> selectCategoryByCategoryDepth(int categoryDepth) {
		return adminDAO.selectCategoryByCategoryDepth(categoryDepth);
	}
	
	@Override
	public List<CategoryVO> selectCategoryByPcNum(int pcNum) {
		return adminDAO.selectCategoryByPcNum(pcNum);
	}
	
	@Override
	public int selectMaxCategonryNum() {
		return adminDAO.selectMaxCategoryNum();
	}
	
	@Override
	public CategoryVO selectCategoryByCategoryNum(int categoryNum) {
		return adminDAO.selectCategoryByCategoryNum(categoryNum);
	}
	
	@Override
	public int insertCategoryDepthOne(String categoryName) {
		return adminDAO.insertCategoryDepthOne(categoryName);
	}
	
	@Override
	public int insertCategoryDepthTwo(CategoryVO categoryVO) {
		return adminDAO.insertCategoryDepthTwo(categoryVO);
	}
	
	@Override
	public int insertCategoryDepthThree(CategoryVO categoryVO) {
		return adminDAO.insertCategoryDepthThree(categoryVO);
	}
	
	@Override
	public int updateCategory(CategoryVO categoryVO) {
		return adminDAO.updateCategory(categoryVO);
	}
	
	@Override
	public int deleteCategory(int categoryNum) {
		return adminDAO.deleteCategory(categoryNum);
	}
	
	public int updateNoticePostByNoticeNum(NoticeVO noticeVO) throws Exception {
		return adminDAO.updateNoticePostByNoticeNum(noticeVO);
	}
	
	@Override
	public List<NoticeVO> selectNoticeByNoticePost(String t) throws Exception {
		return adminDAO.selectNoticeByNoticePost(t);
	}
	
	@Override
	public List<DeclProductVO> selectDeclProduct(DeclProductVO declProductVO) {
		return adminDAO.selectDeclProduct(declProductVO);
	}
	
	@Override
	public DeclProductVO selectDeclProductByDeclNum(int declNum) {
		return adminDAO.selectDeclProductByDeclNum(declNum);
	}
	
	@Override
	public int deleteDeclProductByDeclNum(DeclProductVO declProductVO) {
		return adminDAO.deleteDeclProductByDeclNum(declProductVO);
	}
		
}
