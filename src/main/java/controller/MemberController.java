package controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.MemberService;
import vo.ChangePwVO;
import vo.MemberVO;
import vo.SellerVO;

@Controller
public class MemberController {

	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	// 회원 가입 페이지
	@RequestMapping(value = "/regist")
	public String regist() {
		return "login/Regist";
	}

	// 구매자 회원 가입 탭
	@RequestMapping(value = "/registMember")
	public String registMember() {
		return "login/RegistMember";
	}

	// 판매자 회원 가입 탭
	@RequestMapping(value = "/registSeller")
	public String registSeller() {
		return "login/RegistSeller";
	}

	// 구매자 회원 가입 완료
	@RequestMapping(value = "/registCompleteMember")
	public String registCompleteMember(@Valid MemberVO memberVO) {
		memberService.registMember(memberVO);
		return "login/RegistResult";
	}

	// 판매자 회원 가입 완료
	@RequestMapping(value = "/registCompleteSeller")
	public String registCompleteSeller(@Valid MemberVO memberVO, @Valid SellerVO sellerVO) {
		memberService.registMember(memberVO);
		memberService.registSeller(sellerVO);
		return "login/RegistResult";
	}

	// 아이디 찾기/비밀번호 재설정 페이지
	@RequestMapping(value = "/searchIdChangePw")
	public String searchIdChangePw() {
		return "login/SearchIdChangePw";
	}

	// 아이디 찾기 탭
	@RequestMapping(value = "/searchId")
	public String searchId() {
		return "login/SearchId";
	}

	// 이메일로 아이디 찾기
	@RequestMapping(value = "/searchIdEmail")
	public String searchIdEmail(String email, Model model) {
		String id = memberService.searchIdEmail(email);
		model.addAttribute("id", id);
		return "login/SearchIdResult";
	}

	// 핸드폰 번호로 아이디 찾기
	@RequestMapping(value = "/searchIdPhone")
	public String searchIdPhone(String phone, Model model) {
		String id = memberService.searchIdPhone(phone);
		model.addAttribute("id", id);
		return "login/SearchIdResult";
	}

	// 비밀번호 재설정 탭
	@RequestMapping(value = "/changePw")
	public String changePw() {
		return "login/ChangePw";
	}

	// 이메일로 비밀번호 재설정
	@RequestMapping(value = "/changePwEmail")
	public String changePwEamil(ChangePwVO changePwVO, Model model) {
		memberService.changePwEmail(changePwVO);
		String newPassword = changePwVO.getNewPassword();
		model.addAttribute("newPassword", newPassword);
		return "login/ChangePwResult";
	}

	// 폰번호로 비밀번호 재설정
	@RequestMapping(value = "/changePwPhone")
	public String changePwPhone(ChangePwVO changePwVO, Model model) {
		memberService.changePwPhone(changePwVO);
		String newPassword = changePwVO.getNewPassword();
		model.addAttribute("newPassword", newPassword);
		return "login/ChangePwResult";
	}
}
