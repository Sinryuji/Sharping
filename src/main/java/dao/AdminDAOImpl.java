package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import vo.AdminVO;
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
}
