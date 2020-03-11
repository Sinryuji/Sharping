package dao;

import vo.ChangePwVO;
import vo.MemberVO;
import vo.SellerVO;

public interface MemberDAO {

	public abstract int registMember(MemberVO memberVO);

	public abstract int registSeller(SellerVO sellerVO);

	public abstract String searchIdEmail(String email);

	public abstract String searchIdPhone(String phone);

	public abstract int changePwEmail(ChangePwVO changePwVO);

	public abstract int changePwPhone(ChangePwVO changePwVO);
}
