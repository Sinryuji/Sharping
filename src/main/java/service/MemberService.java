package service;

import javax.servlet.http.HttpServletRequest;

import vo.AuthInfo;
import vo.ChangePwVO;
import vo.MemberVO;
import vo.SellerVO;

public interface MemberService {
	
	public abstract int registMember(MemberVO memberVO);
	
	public abstract int registSeller(SellerVO sellerVO);
	
	public abstract String searchIdByEmail(String email);
	
	public abstract String searchIdByPhone(String phone);
	
	public abstract int changePwByEmail(ChangePwVO changePwVO);
	
	public abstract int changePwByPhone(ChangePwVO changePwVO);
	
	public abstract MemberVO searchMemberById(String id);
	
	public abstract AuthInfo login(String id, String password);
	

	public abstract String sendSms(String receiver, int random, HttpServletRequest req);

	public abstract int idCheck(String id);


}
