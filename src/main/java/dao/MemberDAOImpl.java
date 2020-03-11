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
	public int registMember(MemberVO memberVO) {
		return sqlSessionTemplate.insert("memberDAO.registMember", memberVO);
	}
	
	@Override
	public int registSeller(SellerVO sellerVO) {
		return sqlSessionTemplate.insert("memberDAO.registSeller", sellerVO);
	}
	
	@Override
	public String searchIdEmail(String email) {
		return sqlSessionTemplate.selectOne("memberDAO.searchIdEmail", email);
	}

	@Override
	public String searchIdPhone(String phone) {
		return sqlSessionTemplate.selectOne("memberDAO.searchIdPhone", phone);
	}
	
	@Override
	public int changePwEmail(ChangePwVO changePwVO) {
		return sqlSessionTemplate.update("memberDAO.changePwEmail", changePwVO);
	}
	
	@Override
	public int changePwPhone(ChangePwVO changePwVO) {
		return sqlSessionTemplate.update("memberDAO.changePwPhone", changePwVO);
	}
}
