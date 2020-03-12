package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import exception.IdPasswordNotMatchingException;
import service.MemberService;
import service.MemberServiceImpl;
import vo.AuthInfo;
import vo.ChangePwVO;
import vo.LoginVO;
import vo.MemberVO;
import vo.SellerVO;

@Controller
public class MemberController {

	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	// 메인
	@RequestMapping("/main")
	public String main() {
		return "MainPage";
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
		String id = memberService.searchIdByEmail(email);
		model.addAttribute("id", id);
		return "login/SearchIdResult";
	}

	// 핸드폰 번호로 아이디 찾기
	@RequestMapping(value = "/searchIdPhone")
	public String searchIdPhone(String phone, Model model) {
		String id = memberService.searchIdByPhone(phone);
		model.addAttribute("id", id);
		return "login/SearchIdResult";
	}

	// 비밀번호 재설정 탭
	@RequestMapping(value = "/changePw")
	public String changePw() {
		return "login/ChangePw";
	}

	// 이메일로 비밀번호 재설정 완료
	@RequestMapping(value = "/changePwEmail")
	public String changePwEamil(ChangePwVO changePwVO, Model model) {
		memberService.changePwByEmail(changePwVO);
		String newPassword = changePwVO.getNewPassword();
		model.addAttribute("newPassword", newPassword);
		return "login/ChangePwResult";
	}

	// 폰번호로 비밀번호 재설정 완료
	@RequestMapping(value = "/changePwPhone")
	public String changePwPhone(ChangePwVO changePwVO, Model model) {
		memberService.changePwByPhone(changePwVO);
		String newPassword = changePwVO.getNewPassword();
		model.addAttribute("newPassword", newPassword);
		return "login/ChangePwResult";
	}

	// 로그인 페이지
	@RequestMapping(value = "/login")
	public String login() {
		return "login/Login";
	}

	// 로그인
	@RequestMapping(value = "/loginComplete")
	public String loginComplete(LoginVO loginVO, HttpSession session) {
		try {
			AuthInfo authInfo = memberService.login(loginVO.getId(), loginVO.getPassword());

			session.setAttribute("authInfo", authInfo);

			return "login/LoginResult";
		} catch (IdPasswordNotMatchingException e) {
			return "login/Login";
		}
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	// 인증 문자 발송
	@ResponseBody
	@RequestMapping("/sendSms")
	public String sendSms(String receiver) {
		String result = memberService.sendSms(receiver);
		return result;
//		memberService.sendSms(receiver);
//		return "redirect:/sendSMS";
	}
	
	// 문자 인증 확인
	@ResponseBody
	@RequestMapping("/smsCheck")
	public String smsCheck(String code) {
		
		String sendCode = Integer.toString(MemberServiceImpl.rand);
		
		if(code.equals(sendCode)) {
			return "ok";
		} else {
			return "no";
		}
	}
}
