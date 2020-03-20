package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import vo.ChangeMemberVO;
import vo.ChangePwVO;
import vo.DeleteVO;
import vo.DeliveryAddressVO;
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
		return sqlSessionTemplate.insert("memberDAO.insertSeller", sellerVO);
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
	
	@Override
	public SellerVO selectSellerById(String id) {
		return sqlSessionTemplate.selectOne("memberDAO.selectSellerById", id);
	}
	
	@Override
	public int selectMemberId(String id) {
		int result = sqlSessionTemplate.selectOne("memberDAO.selectMemberId", id);
		return result;
	}
	


	public int updatePwByIdPw(ChangePwVO changePwVO) {
		return sqlSessionTemplate.update("memberDAO.updatePwByIdPw", changePwVO);
	}
	
	@Override
	public int updateMemberInfoById(ChangeMemberVO changeMemberVO) {
		return sqlSessionTemplate.update("memberDAO.updateMemberInfoById", changeMemberVO);
	}
	
	@Override
	public int deleteMemberByIdPw(DeleteVO deleteVO) {
		return sqlSessionTemplate.delete("memberDAO.deleteMemberByIdPw", deleteVO);
	}
	
	@Override
	public int updateSellerInfoById(ChangeMemberVO changeMemberVO) {
		return sqlSessionTemplate.update("memberDAO.updateSellerInfoById", changeMemberVO);
	}
	

	@Override
	public List<DeliveryAddressVO> selectDeliveryAddressById(String id) {
		return sqlSessionTemplate.selectList("memberDAO.selectDeliveryAddressById", id);
	}
	
	@Override
	public int insertDeliveryAddress(DeliveryAddressVO deliveryAddressVO) {
		return sqlSessionTemplate.insert("memberDAO.insertDeliveryAddress", deliveryAddressVO);
	}
	
	@Override
	public int deleteDeliveryAddress(DeliveryAddressVO deliveryAddressVO) {
		return sqlSessionTemplate.delete("memberDAO.deleteDeliveryAddress", deliveryAddressVO);
	}
	
	@Override
	public int updateDeliveryAddress(DeliveryAddressVO deliveryAddressVO) {
		return sqlSessionTemplate.update("memberDAO.updateDeliveryAddress", deliveryAddressVO);
	}
	
	@Override
	public DeliveryAddressVO selectDeliveryAddressBydaaNameId(DeliveryAddressVO deliveryAddressVO) {
		return sqlSessionTemplate.selectOne("memberDAO.selectDeliveryAddressBydaaNameId", deliveryAddressVO);
	}


}
