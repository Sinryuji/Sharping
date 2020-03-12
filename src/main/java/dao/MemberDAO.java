package dao;

import vo.ChangePwVO;
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
}
