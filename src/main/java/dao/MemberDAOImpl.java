package dao;

import org.mybatis.spring.SqlSessionTemplate;

import vo.ChangePwVO;
import vo.MemberVO;
import vo.SellerVO;

public class MemberDAOImpl implements MemberDAO{
	
	private SqlSessionTemplate sqlSessionTemplate;

	
	public MemberDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public int insertMember(MemberVO memberVO) {
		return sqlSessionTemplate.insert("memberDAO.insertMember", memberVO);
	}
	
	@Override
	public int insertSeller(SellerVO sellerVO) {
		return sqlSessionTemplate.insert("memberDAO.rinsertSeller", sellerVO);
	}
	
	@Override
	public String selectIdByEmail(String email) {
		return sqlSessionTemplate.selectOne("memberDAO.selectIdByEmail", email);
	}

	@Override
	public String selectIdByPhone(String phone) {
		return sqlSessionTemplate.selectOne("memberDAO.selectIdByPhone", phone);
	}
	
	@Override
	public int updatePwByEmail(ChangePwVO changePwVO) {
		return sqlSessionTemplate.update("memberDAO.updatePwByEmail", changePwVO);
	}
	
	@Override
	public int updatePwByPhone(ChangePwVO changePwVO) {
		return sqlSessionTemplate.update("memberDAO.updatePwByPhone", changePwVO);
	}
	
	@Override
	public MemberVO selectMemberById(String id) {
		return sqlSessionTemplate.selectOne("memberDAO.selectMemberById", id);
	}
}
