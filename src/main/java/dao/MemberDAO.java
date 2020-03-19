package dao;

import java.util.List;

import vo.ChangeMemberVO;
import vo.ChangePwVO;
import vo.DeleteVO;
import vo.DeliveryAddressVO;
import vo.MemberVO;
import vo.SellerVO;

public interface MemberDAO {

	public abstract int insertMember(MemberVO memberVO);

	public abstract int insertSeller(SellerVO sellerVO);

	public abstract String selectIdByEmail(String email);

	public abstract String selectIdByPhone(String phone);

	public abstract int updatePwByEmail(ChangePwVO changePwVO);

	public abstract int updatePwByPhone(ChangePwVO changePwVO);
	
	public abstract MemberVO selectMemberById(String id);
	
	public abstract int selectMemberId(String id);
	
	public abstract SellerVO selectSellerById(String id);

	
	public abstract int updatePwByIdPw(ChangePwVO changePwVO);
	
	public abstract int updateMemberInfoById(ChangeMemberVO changeMemberVO);
	
	public abstract int deleteMemberByIdPw(DeleteVO deleteVO);
	
	public abstract int updateSellerInfoById(ChangeMemberVO changeMemberVO);
	
	public abstract List<DeliveryAddressVO> selectDeliveryAddressById(String id);
	
	public abstract int insertDeliveryAddress(DeliveryAddressVO deliveryAddressVO);
	
	public abstract int deleteDeliveryAddress(DeliveryAddressVO deliveryAddressVO);
	
	public abstract int updateDeliveryAddress(DeliveryAddressVO deliveryAddressVO);
	
	public abstract DeliveryAddressVO selectDeliveryAddressBydaaNameId(DeliveryAddressVO deliveryAddressVO);
	

}
