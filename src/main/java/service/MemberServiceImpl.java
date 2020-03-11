package service;

import org.springframework.stereotype.Service;

import dao.MemberDAO;
import vo.ChangePwVO;
import vo.MemberVO;
import vo.SellerVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	private MemberDAO memberDAO;
	
	
	
	public MemberDAO getMemberDAO() {
		return memberDAO;
	}

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public int registMember(MemberVO memberVO) {
		return memberDAO.registMember(memberVO);
	}
	
	@Override
	public int registSeller(SellerVO sellerVO) {
		return memberDAO.registSeller(sellerVO);
		
	}
	
	@Override
	public String searchIdEmail(String email) {
		return memberDAO.searchIdEmail(email);
	}
	
	@Override
	public String searchIdPhone(String phone) {
		return memberDAO.searchIdPhone(phone);
	}
	
	@Override
	public int changePwEmail(ChangePwVO changePwVO) {
		return memberDAO.changePwEmail(changePwVO);
	}
	
	@Override
	public int changePwPhone(ChangePwVO changePwVO) {
		return memberDAO.changePwPhone(changePwVO);
	}

}
