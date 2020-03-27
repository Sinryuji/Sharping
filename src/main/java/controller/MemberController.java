package controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import exception.AlreadyExistingIdException;
import exception.IdPasswordNotMatchingException;
import exception.PasswordNotMatchingException;
import service.AdminService;
import service.MemberService;
import vo.AdminVO;
import vo.AuthInfo;
import vo.ChangeMemberVO;
import vo.ChangePwVO;
import vo.DeleteVO;
import vo.DeliveryAddressVO;
import vo.LoginVO;
import vo.MemberVO;
import vo.SellerVO;

@Controller
public class MemberController {

	private MemberService memberService;
	private AdminService adminService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
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
	public ModelAndView registSeller() {
		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000;
		mv.setViewName("login/RegistSeller");
		mv.addObject("random", ran);
		return mv;
	}

	// 구매자 회원 가입 완료
	@RequestMapping(value = "/registCompleteMember")
	public String registCompleteMember(@Valid MemberVO memberVO) {

//		String addressEtc = memberVO.getAddressEtc();
//
//		String address = memberVO.getAddress();
//
//		String addressFinal = address + " " + addressEtc;
//
//		memberVO.setAddress(addressFinal);

		String pw = memberVO.getPassword();
		String hashPw = BCrypt.hashpw(pw, BCrypt.gensalt());
		memberVO.setPassword(hashPw);
		int result = memberService.idCheck(memberVO.getId());
		if (result == 1) {
			throw new AlreadyExistingIdException();
		}
		memberService.registMember(memberVO);
		return "login/RegistResult";
	}

	// 판매자 회원 가입 완료
	@RequestMapping(value = "/registCompleteSeller")
	public String registCompleteSeller(@Valid MemberVO memberVO, @Valid SellerVO sellerVO) {

//		String addressEtc = memberVO.getAddressEtc();
//
//		String address = memberVO.getAddress();
//
//		String addressFinal = address + " " + addressEtc;
//
//		memberVO.setAddress(addressFinal);

		String pw = memberVO.getPassword();
		String hashPw = BCrypt.hashpw(pw, BCrypt.gensalt());
		memberVO.setPassword(hashPw);
		int result = memberService.idCheck(memberVO.getId());
		if (result == 1) {
			throw new AlreadyExistingIdException();
		}
		memberService.registMember(memberVO);
		memberService.registSeller(sellerVO);
		return "login/RegistResult";
	}

	// 아이디 찾기/비밀번호 재설정 페이지
	@RequestMapping(value = "/searchIdChangePw")
	public String searchIdChangePw() {
		return "login/SearchIdChangePw";
	}

//	// 아이디 찾기 탭
//	@RequestMapping(value = "/searchId")
//	public String searchId() {
//		return "login/SearchId";
//	}

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

	// 비밀번호 재설정
	@RequestMapping(value = "/changePw")
	public ModelAndView changePw() {
		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000;
		mv.setViewName("login/RegistSeller");
		mv.addObject("random", ran);
		return mv;
	}

	// 이메일로 비밀번호 재설정 완료
	@RequestMapping(value = "/changePwEmail")
	public String changePwEamil(ChangePwVO changePwVO, Model model) {
		String pw = changePwVO.getNewPassword();
		String hashPw = BCrypt.hashpw(pw, BCrypt.gensalt());
		changePwVO.setNewPassword(hashPw);
		memberService.changePwByEmail(changePwVO);
		String newPassword = changePwVO.getNewPassword();
		model.addAttribute("newPassword", newPassword);
		return "login/ChangePwResult";
	}

	// 폰번호로 비밀번호 재설정 완료
	@RequestMapping(value = "/changePwPhone")
	public String changePwPhone(ChangePwVO changePwVO, Model model) {
		String pw = changePwVO.getNewPassword();
		String hashPw = BCrypt.hashpw(pw, BCrypt.gensalt());
		changePwVO.setNewPassword(hashPw);
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

			AdminVO adminVO = adminService.login(loginVO.getId(), loginVO.getPassword());
			if (adminVO != null) {
				session.setAttribute("adminInfo", adminVO);

			} else {

				AuthInfo authInfo = memberService.login(loginVO.getId(), loginVO.getPassword());

				session.setAttribute("authInfo", authInfo);
				return "login/LoginResult";
			}
		} catch (IdPasswordNotMatchingException e) {
			return "login/Login";
		}

		return "admin/AdminPage";
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
	public String sendSms(@RequestParam String receiver, @RequestParam int random, HttpServletRequest req) {
		String result = memberService.sendSms(receiver, random, req);
		return result;
//		memberService.sendSms(receiver);
//		return "redirect:/sendSMS";
	}

	// 문자 인증 확인
	@ResponseBody
	@RequestMapping("/smsCheck")

	public String smsCheck(@RequestParam String authCode, @RequestParam String random, HttpSession session) {

		String inputAuthCode = (String) session.getAttribute("authCode");

		String inputRandom = Integer.toString((int) session.getAttribute("random"));

//		String sendCode = Integer.toString(MemberServiceImpl.rand);

		if (inputAuthCode.equals(authCode) && inputRandom.equals(random)) {

			return "ok";
		} else {
			return "no";
		}
	}

	// 아이디 찾기
	@ResponseBody
	@RequestMapping("/searchId")
	public ModelAndView board2() {
		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000;
		mv.setViewName("login/SearchId");
		mv.addObject("random", ran);
		return mv;
	}

	// 이메일 발송
	@RequestMapping(value = "/sendEmail")
	@ResponseBody
	public boolean sendEmail(@RequestParam String email, @RequestParam int random, HttpServletRequest req) {

		String id = memberService.searchIdByEmail(email);
		if (id == null) {
			return false;
		}
		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = req.getSession(true);
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
//		String sendEmailId = JavaMailSender
		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + authCode + "입니다.");
		System.out.println(sb);
		return memberService.sendEmail(subject, sb.toString(), "admin", email, null);
	}

	// 이메일인증체크
	@RequestMapping(value = "/emailCheck")
	@ResponseBody
	public ResponseEntity<String> emailCheck(@RequestParam String authCode, @RequestParam String random,
			HttpSession session) {
		String originalJoinCode = (String) session.getAttribute("authCode");
		String originalRandom = Integer.toString((int) session.getAttribute("random"));
		System.out.println(authCode);
		System.out.println(random);
		if (originalJoinCode.equals(authCode) && originalRandom.equals(random))
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		else
			return new ResponseEntity<String>("false", HttpStatus.OK);
	}

//	@RequestMapping(value = "/searchIdEmail")
//	public String searchIdEmail(String email, Model model) {
//		
//		
//		String id = memberService.searchIdByEmail(email);
//		model.addAttribute("id", id);
//		return "login/SearchIdResult";
//	}

	// 아이디 중복확인
	@RequestMapping(value = "/idCheck")
	@ResponseBody
	public int idCheck(@Valid String id) {
		int result = memberService.idCheck(id);
		return result;

	}

	// 판매자 전환 페이지
	@RequestMapping(value = "/changeSeller")
	public ModelAndView changeSeller() {
		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000;
		mv.setViewName("login/ChangeSeller");
		mv.addObject("random", ran);
		return mv;
	}

	// 판매자 전환 완료
	@RequestMapping(value = "/changeSellerComplete")
	public String chageSellerComplete(@Valid SellerVO sellerVO) {

		/*
		 * String addressEtc = sellerVO.getAddressEtc();
		 * 
		 * String address = sellerVO.getAddress();
		 * 
		 * String addressFinal = address + " " + addressEtc;
		 * 
		 * sellerVO.setAddress(addressFinal);
		 */

		memberService.registSeller(sellerVO);
		return "login/ChangeSellerResult";
	}

	// 회원 정보 수정 페이지
	@RequestMapping(value = "/infoChange")
	public String infoChange() {
		return "mypage/InfoChange";
	}

	// 구매자 회원 정보 수정 탭
	@RequestMapping(value = "/infoChangeMember")
	public String infoChangeMember(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		MemberVO memberVO = memberService.searchMemberById(authInfo.getId());
		model.addAttribute("member", memberVO);
		return "mypage/InfoChangeMember";
	}

	// 판매자 회원 정보 수정 탭
	@RequestMapping(value = "/infoChangeSeller")
	public String infoChangeSeller(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		SellerVO sellerVO = memberService.searchSellerById(authInfo.getId());
		MemberVO memberVO = memberService.searchMemberById(authInfo.getId());
		model.addAttribute("seller", sellerVO);
		model.addAttribute("member", memberVO);
		return "mypage/InfoChangeSeller";
	}

	// 회원 비밀번호 변경
	@RequestMapping(value = "/infoChangePw")
	public String changePw(ChangePwVO changePwVO, Model model) {

		String newPassword = changePwVO.getNewPassword();
		String hashPw = BCrypt.hashpw(newPassword, BCrypt.gensalt());
		changePwVO.setNewPassword(hashPw);
		try {
			memberService.updatePwByIdPw(changePwVO);
		} catch (PasswordNotMatchingException e) {
			e.printStackTrace();
			return "";
		}
		model.addAttribute("newPassword", newPassword);
		return "mypage/InfoChangePwResult";
	}

	// 구매자 회원 정보 수정
	@RequestMapping(value = "/infoChangeMemberComplete")
	public String infoChangeMemberComplete(ChangeMemberVO changeMemberVO) {
		
//		String addressEtc = changeMemberVO.getNewAddressEtc();
//
//		String address = changeMemberVO.getNewAddress();
//
//		String addressFinal = address + " " + addressEtc;
//
//		changeMemberVO.setNewAddress(addressFinal);
		
		memberService.updateMemberInfoById(changeMemberVO);
		return "mypage/InfoChangeMemberResult";
	}

	// 판매자 회원 정보 수정
	@RequestMapping(value = "/infoChangeSellerComplete")
	public String infoChangeSellerComplete(ChangeMemberVO changeMemberVO) {
		
//		String addressEtc = changeMemberVO.getNewAddressEtc();
//
//		String address = changeMemberVO.getNewAddress();
//
//		String addressFinal = address + " " + addressEtc;
//
//		changeMemberVO.setNewAddress(addressFinal);
		
		memberService.updateMemberInfoById(changeMemberVO);
		memberService.updateSellerInfoById(changeMemberVO);
		return "mypage/InfoChangeMemberResult";
	}

	// 회원 탈퇴 페이지
	@RequestMapping(value = "/infoDelete")
	public String infoDelete() {
		return "mypage/InfoDelete";
	}

	// 회원 탈퇴
	@RequestMapping(value = "/infoDeleteComplete")
	public String infoDeleteComplete(DeleteVO deleteVO, HttpSession session) {
		memberService.deleteMemberByIdPw(deleteVO);
		session.invalidate();
		return "mypage/InfoDeleteResult";
	}

	@RequestMapping(value = "/phoneCheck")
	public String phoneCheck() {
		return "mypage/PhoneCheck";

	}

	// 배송주소록
	@RequestMapping(value = "/deliveryAddress")
	public ModelAndView DeliveryAddress(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");

		List<DeliveryAddressVO> deliveryList = memberService.selectDeliveryAddressById(authInfo.getId());

		mv.setViewName("mypage/DeliveryAddress");

		mv.addObject("deliveryList", deliveryList);

		mv.addObject("authInfo", authInfo);

		return mv;
	}

	// 주문 페이지의 배송주소록
	@RequestMapping(value = "/deliveryAddressInOrder")
	public ModelAndView DeliveryAddressInOrder(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");

		List<DeliveryAddressVO> deliveryList = memberService.selectDeliveryAddressById(authInfo.getId());

		mv.setViewName("mypage/DeliveryAddressInOrder");

		mv.addObject("deliveryList", deliveryList);

		mv.addObject("authInfo", authInfo);

		return mv;
	}

	// 마이 페이지
	@RequestMapping(value = "/myPage")
	public ModelAndView myPage(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");

		mv.setViewName("mypage/MyPage");

		mv.addObject("authInfo", authInfo);

		return mv;
	}

	// 배송주소록 신규등록
	@RequestMapping(value = "/deliveryAddressUpload")
	public ModelAndView DeliveryAddressUpload(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");

		mv.setViewName("mypage/DeliveryAddressUpload");
		mv.addObject("authInfo", authInfo);

		return mv;
	}

	// 배송주소록 신규등록 완료
	@RequestMapping(value = "/deliveryAddressUploadComplete")
	public ModelAndView DeliveryAddressUploadComplete(HttpServletRequest req, DeliveryAddressVO deliveryAddressVO) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");

//		String addressEtc = deliveryAddressVO.getAddressEtc();
//
//		String address = deliveryAddressVO.getDaAddress();
//
//		String addressFinal = address + " " + addressEtc;
//
//		deliveryAddressVO.setDaAddress(addressFinal);

		memberService.insertDeliveryAddress(deliveryAddressVO);

		List<DeliveryAddressVO> deliveryList = memberService.selectDeliveryAddressById(authInfo.getId());

		mv.setViewName("redirect:/deliveryAddress");

		mv.addObject("deliveryList", deliveryList);

		mv.addObject("authInfo", authInfo);

		return mv;
	}

	// 배송주소록 삭제
	@RequestMapping(value = "deliveryAddressDelete")
	public ModelAndView DeliveryAddressDelete(@RequestParam String daaName, @RequestParam String id) {
		ModelAndView mv = new ModelAndView();

		DeliveryAddressVO deliveryAddressVO = new DeliveryAddressVO();

		deliveryAddressVO.setDaaName(daaName);
		deliveryAddressVO.setId(id);

		memberService.deleteDeliveryAddress(deliveryAddressVO);

		List<DeliveryAddressVO> deliveryList = memberService.selectDeliveryAddressById(deliveryAddressVO.getId());

		mv.setViewName("mypage/DeliveryAddress");

		mv.addObject("deliveryList", deliveryList);

		return mv;
	}

	// 배송주소록 수정
	@RequestMapping(value = "deliveryAddressUpdate")
	public ModelAndView DeliveryAddressUpdate(@RequestParam String daaName, @RequestParam String id) {
		ModelAndView mv = new ModelAndView();

		DeliveryAddressVO deliveryAddressVO = new DeliveryAddressVO();

		deliveryAddressVO.setDaaName(daaName);
		deliveryAddressVO.setId(id);

		deliveryAddressVO = memberService.selectDeliveryAddressBydaaNameId(deliveryAddressVO);

		mv.setViewName("mypage/DeliveryAddressUpdate");
		mv.addObject("deliveryAddress", deliveryAddressVO);

		return mv;

	}

	// 배송 주소록 수정 완료
	@RequestMapping(value = "deliveryAddressUpdateComplete")
	public ModelAndView DeliveryAddressUpdateComplete(DeliveryAddressVO deliveryAddressVO) {
		ModelAndView mv = new ModelAndView();

		memberService.updateDeliveryAddress(deliveryAddressVO);

		mv.setViewName("redirect:/deliveryAddress");

		return mv;
	}

	// 배송조회
	@RequestMapping("/deliveryTracker")
	public String deliveryTracker() {
		return "mypage/DeliveryTracker";
	}

}
