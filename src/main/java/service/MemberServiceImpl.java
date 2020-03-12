package service;

import org.springframework.stereotype.Service;

import dao.MemberDAO;
import exception.IdPasswordNotMatchingException;
import vo.AuthInfo;
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
		return memberDAO.insertMember(memberVO);
	}
	
	@Override
	public int registSeller(SellerVO sellerVO) {
		return memberDAO.insertSeller(sellerVO);
		
	}
	
	@Override
	public String searchIdByEmail(String email) {
		return memberDAO.selectIdByEmail(email);
	}
	
	@Override
	public String searchIdByPhone(String phone) {
		return memberDAO.selectIdByPhone(phone);
	}
	
	@Override
	public int changePwByEmail(ChangePwVO changePwVO) {
		return memberDAO.updatePwByEmail(changePwVO);
	}
	
	@Override
	public int changePwByPhone(ChangePwVO changePwVO) {
		return memberDAO.updatePwByPhone(changePwVO);
	}
	
	@Override
	public MemberVO searchMemberById(String id) {
		return memberDAO.selectMemberById(id);
	}
	
	@Override
	public AuthInfo login(String id, String password) {
		MemberVO memberVO = memberDAO.selectMemberById(id);
		if(memberVO == null) {
			throw new IdPasswordNotMatchingException();
		}
		if(!memberVO.getPassword().equals((password))) {
			throw new IdPasswordNotMatchingException();
		}
		return new AuthInfo(memberVO.getId(), memberVO.getEmail(), memberVO.getName());
	}
	
	@Override
	public int idCheck(String id) {
		int result = memberDAO.selectMemberId(id);
		return result;
	}
}
	

