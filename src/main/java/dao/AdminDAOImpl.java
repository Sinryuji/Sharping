package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import vo.AdminVO;
import vo.CategoryVO;
import vo.DeclProductVO;
import vo.MemberVO;
import vo.NoticeVO;
import vo.SellerVO;

public class AdminDAOImpl implements AdminDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public AdminDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public AdminVO selectAdminById(String adminId) {
		return sqlSessionTemplate.selectOne("adminDAO.selectAdminById", adminId);
	}
	
	@Override
	public int insertAdmin(AdminVO adminVO) {
		return sqlSessionTemplate.insert("adminDAO.insertAdmin", adminVO);
	}
	
	@Override
	public int selectAdminId(String adminId) {
		int result = sqlSessionTemplate.selectOne("adminDAO.selectAdminId", adminId);
		return result;
	}
	
	@Override
	public List<MemberVO> getMemberList(AdminVO adminVO) {
		return sqlSessionTemplate.selectList("adminDAO.getMemberList", adminVO);
	}
	
	@Override
	public List<SellerVO> getSellerList(AdminVO adminVO) {
		return sqlSessionTemplate.selectList("adminDAO.getSellerList", adminVO);
	}
	
	@Override
	public int deleteMemberById(MemberVO memberVO) {
		return sqlSessionTemplate.delete("adminDAO.deleteMemberById", memberVO);
	}
	
	@Override
	public int deleteSellerById(SellerVO sellerVO) {
		return sqlSessionTemplate.delete("adminDAO.deleteSellerById", sellerVO);
	}

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO) throws Exception {
		return sqlSessionTemplate.selectList("adminDAO.getNoticeList", noticeVO);
	}
	

	@Override
	public NoticeVO selectNoticeByNoticeNum(int noticeNum) {
		return sqlSessionTemplate.selectOne("adminDAO.selectNoticeByNoticeNum", noticeNum);
	}
	
	@Override
	public int deleteNoticeByNoticeNum(int noticeNum) {
		return sqlSessionTemplate.delete("adminDAO.deleteNoticeByNoticeNum", noticeNum);
	}
	
	@Override
	public int updateNoticeByNoticeNum(NoticeVO noticeVO) {
		return sqlSessionTemplate.update("adminDAO.updateNoticeByNoticeNum", noticeVO);
	}
	
	@Override
	public int insertNotice(NoticeVO noticeVO) throws Exception {
		return sqlSessionTemplate.insert("adminDAO.insertNotice", noticeVO);
	}
	
	@Override
	public List<CategoryVO> selectCategoryByCategoryDepth(int categoryDepth) {
		return sqlSessionTemplate.selectList("adminDAO.selectCategoryByCategoryDepth", categoryDepth);
	}
	
	@Override
	public List<CategoryVO> selectCategoryByPcNum(int pcNum) {
		return sqlSessionTemplate.selectList("adminDAO.selectCategoryByPcNum", pcNum);
	}
	
	@Override
	public int selectMaxCategoryNum() {
		return sqlSessionTemplate.selectOne("adminDAO.selectMaxCategoryNum");
	}
	
	@Override
	public CategoryVO selectCategoryByCategoryNum(int categoryNum) {
		return sqlSessionTemplate.selectOne("adminDAO.selectCategoryByCategoryNum", categoryNum);
	}
	
	@Override
	public int insertCategoryDepthOne(String categoryName) {
		return sqlSessionTemplate.insert("adminDAO.insertCategoryDepthOne", categoryName);
	}
	
	@Override
	public int insertCategoryDepthTwo(CategoryVO categoryVO) {
		return sqlSessionTemplate.insert("adminDAO.insertCategoryDepthTwo", categoryVO);
	}
	
	@Override
	public int insertCategoryDepthThree(CategoryVO categoryVO) {
		return sqlSessionTemplate.insert("adminDAO.insertCategoryDepthThree", categoryVO);
	}
	
	@Override
	public int updateCategory(CategoryVO categoryVO) {
		return sqlSessionTemplate.update("adminDAO.updateCategory", categoryVO);
	}
	
	@Override
	public int deleteCategory(int categoryNum) {
		return sqlSessionTemplate.delete("adminDAO.deleteCategory", categoryNum);
	}
	
	public int updateNoticePostByNoticeNum(NoticeVO noticeVO) throws Exception {
		return sqlSessionTemplate.update("adminDAO.updateNoticePostByNoticeNum", noticeVO);
	}
	
	@Override
	public List<NoticeVO> selectNoticeByNoticePost(String t) throws Exception {
		return sqlSessionTemplate.selectList("adminDAO.selectNoticeByNoticePost", t);
	}
	
	@Override
	public List<DeclProductVO> selectDeclProduct(DeclProductVO declProductVO) {
		return sqlSessionTemplate.selectList("adminDAO.selectDeclProduct", declProductVO);
	}
	
	@Override
	public DeclProductVO selectDeclProductByDeclNum(int declNum) {
		return sqlSessionTemplate.selectOne("adminDAO.selectDeclProductByDeclNum", declNum);
	}
	
	@Override
	public int deleteDeclProductByDeclNum(DeclProductVO declProductVO) {
		return sqlSessionTemplate.delete("adminDAO.deleteDeclProductByDeclNum", declProductVO);
	}
	
	@Override
	public List<NoticeVO> getNoticeListPaging(NoticeVO noticeVO) {
		return sqlSessionTemplate.selectList("adminDAO.getNoticeListPaging", noticeVO);
	}
	
	@Override
	public List<DeclProductVO> selectDeclProductPaging(DeclProductVO declProductVO) {
		return sqlSessionTemplate.selectList("adminDAO.selectDeclProductPaging", declProductVO);
	}
}
