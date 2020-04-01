package service;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import dao.AdminDAO;
import dao.MemberDAO;
import exception.IdPasswordNotMatchingException;
import vo.AdminVO;
import vo.CategoryVO;
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
	public int updateNoticePostByNoticeNum(NoticeVO noticeVO) throws Exception {
		return adminDAO.updateNoticePostByNoticeNum(noticeVO);
	}
	
	@Override
	public List<CategoryVO> selectCategory() throws Exception {
		return adminDAO.selectCategory();
	}
	
	@Override
	public int insertCategory(CategoryVO categoryVO) throws Exception {
		return adminDAO.insertCategory(categoryVO);
	}
	
	@Override
	public int updateCategory(CategoryVO categoryVO) throws Exception {
		return adminDAO.updateCategory(categoryVO);
	}

	@Override
	public int deleteCategory(int categoryNum) throws Exception {
		return adminDAO.deleteCategory(categoryNum);
	}
}
