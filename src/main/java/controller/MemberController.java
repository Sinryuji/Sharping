package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import exception.AlreadyExistingIdException;
import exception.IdPasswordNotMatchingException;
import exception.PasswordNotMatchingException;
import service.AdminService;
import service.MemberService;
import service.OrderService;
import service.ProductService;
import vo.AdminVO;
import vo.AuthInfo;
import vo.BankVO;
import vo.CategoryVO;
import vo.ChangeMemberVO;
import vo.ChangePwVO;
import vo.DeleteVO;
import vo.DeliveryAddressVO;
import vo.DetailOptionVO;
import vo.LoginVO;
import vo.MemberVO;
import vo.NoticeVO;
import vo.OptionVO;
import vo.OrderListVO;
import vo.OrderVO;
import vo.ProductVO;
import vo.ReviewVO;
import vo.SellerVO;
import vo.WishListVO;

@Controller
public class MemberController {

	private MemberService memberService;
	private AdminService adminService;
	private OrderService orderService;
	private ProductService productService;

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

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
	public ModelAndView main() throws Exception {

		String t = "TRUE";

		ModelAndView mv = new ModelAndView();

		List<CategoryVO> categorys = adminService.selectCategoryByCategoryDepth(1);
		List<NoticeVO> noticeList = adminService.selectNoticeByNoticePost(t);

		mv.setViewName("MainPage");
		mv.addObject("categorys", categorys);
		mv.addObject("noticeList", noticeList);
		mv.addObject("noticeSize", noticeList.size());

		return mv;
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
		
		List<BankVO> bankVO = orderService.selectBankCodeList();

		mv.addObject("bankInfo", bankVO);
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
	
//	// 이메일 존재 여부 확인
//	@RequestMapping(value = "/searchEmail")
//	@ResponseBody
//	public int searchEmail(String email) {
//		MemberVO member = memberService.selectMemberByEmail(email);
//		int result = 0;
//		if(member == null) {
//			result = -1;
//		}
//		else if(member != null) {
//			result = 1;
//		}
//		return result;
//	}

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
		mv.setViewName("login/ChangePw");
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
	public ModelAndView login(HttpServletRequest req) {

		ModelAndView mv = new ModelAndView();

		mv.setViewName("login/Login");

		Cookie[] cookies = req.getCookies();

		String rememberId = "";

		for (Cookie cookie : cookies) {

			if (cookie.getName().equals("rememberId")) {

				try {
					rememberId = URLDecoder.decode(cookie.getValue(), "UTF-8");
					System.out.println(rememberId);
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}

		mv.addObject("rememberId", rememberId);

		return mv;
	}

	// 로그인
	@RequestMapping(value = "/loginComplete")
	public String loginComplete(LoginVO loginVO, HttpSession session, String rememberId, HttpServletResponse resp) {
		String remember = rememberId;
		try {

			AdminVO adminVO = adminService.login(loginVO.getId(), loginVO.getPassword());
			if (adminVO != null) {
				session.setAttribute("adminVO", adminVO);

			} else {

				AuthInfo authInfo = memberService.login(loginVO.getId(), loginVO.getPassword());

				session.setAttribute("authInfo", authInfo);

				if (remember != null) {
					if (remember.equals("true")) {
						Cookie cookie;
						try {
							cookie = new Cookie("rememberId", URLEncoder.encode(authInfo.getId(), "UTF-8"));
							cookie.setMaxAge(60 * 60 * 72);
							resp.addCookie(cookie);
						} catch (UnsupportedEncodingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

					}
				} else {

					Cookie cookie;
					try {
						cookie = new Cookie("rememberId", URLEncoder.encode(authInfo.getId(), "UTF-8"));
						cookie.setMaxAge(0);
						resp.addCookie(cookie);
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}
				return "redirect:main";
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
	public String sendSms(@RequestParam(required=false) String id, @RequestParam String receiver, @RequestParam int random, HttpServletRequest req) {
		if(id != null) {
			System.out.println("@@@@@@@@@@@@@@@@@1");
			if(memberService.searchMemberById(id) != null) {
				System.out.println("@@@@@@@@@@@@@@@@@2");
				if(!memberService.searchMemberById(id).getPhone().equals(receiver)) {
					return "noMatch";
				}
			}
			else {
				System.out.println("@@@@@@@@@@@@@@@@@3");
				return "noMember";
			}
		}

		System.out.println(receiver);
		String result = memberService.sendSms(id, receiver, random, req);
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
	public String sendEmail(@RequestParam(required=false) String idd, @RequestParam String email, @RequestParam int random, HttpServletRequest req) {
		
		if(idd != null) {
			System.out.println(idd);
			System.out.println(memberService.searchMemberById(idd));
			if(memberService.searchMemberById(idd) != null) {
				if(!memberService.searchMemberById(idd).getEmail().equals(email)) {
					return "noMatch";
				}
			}
			else {
				return "noMember";
			}
		}

		String id = memberService.searchIdByEmail(email);
		if (id == null) {
			return "false";
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
	
	// 핸드폰 중복확인
	@RequestMapping(value = "/phoneOverlapCheck")
	@ResponseBody
	public int phoneOverlapCheck(@Valid String phone) {
		String id = memberService.searchIdByPhone(phone);
		int result = 0;
		if(id == null ) {
			result = 1;
		}
		else if(id != null) {
			result = -1;
		}
		return result;

	}
	
	// 이메일 중복확인
	@RequestMapping(value = "/emailOverlapCheck")
	@ResponseBody
	public int emailOverlapCheck(@Valid String email) {
		String id = memberService.searchIdByEmail(email);
		int result = 0;
		if(id == null ) {
			result = 1;
		}
		else if(id != null) {
			result = -1;
		}
		return result;

	}

	// 판매자 전환 페이지
	@RequestMapping(value = "/changeSeller")
	public ModelAndView changeSeller() {
		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000;
		mv.setViewName("login/ChangeSeller");
		mv.addObject("random", ran);

		List<BankVO> bankVO = orderService.selectBankCodeList();

		mv.addObject("bankInfo", bankVO);
		return mv;
	}

	// 판매자 전환 완료
	@RequestMapping(value = "/changeSellerComplete")
	public String chageSellerComplete(@Valid SellerVO sellerVO, HttpServletRequest req) {

		/*
		 * String addressEtc = sellerVO.getAddressEtc();
		 * 
		 * String address = sellerVO.getAddress();
		 * 
		 * String addressFinal = address + " " + addressEtc;
		 * 
		 * sellerVO.setAddress(addressFinal);
		 */

		HttpSession session = req.getSession();

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		authInfo.setSellerCheck("true");

		session.removeAttribute("authInfo");

		session.setAttribute("authInfo", authInfo);

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
			model.addAttribute("falsee", "falsee");
			return "mypage/InfoChangePwResult";
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
	@ResponseBody
	public ModelAndView myPage(HttpServletRequest req, @RequestParam(required = false) String keywordO,
			@RequestParam(required = false) String state, @RequestParam(required = false) Date firstDate,
			@RequestParam(required = false) Date secondDate) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");

		List<OrderVO> orders = new ArrayList<OrderVO>();

		OrderVO order = new OrderVO();

		if (keywordO == null && state == null && firstDate == null && secondDate == null) {

			System.out.println("그냥 마이페이지");
			orders = orderService.selectOrderById(authInfo.getId());

		} else {
			order = new OrderVO();

			order.setId(authInfo.getId());

			if (keywordO != null) {

				order.setKeywordO(keywordO);

			}

			if (state != null) {

				order.setState(state);

			}

			if (firstDate != null && secondDate != null) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				long firstTimestampLong = firstDate.getTime();
				long secondTimestampLong = secondDate.getTime();

				Timestamp firstTimestamp = Timestamp.valueOf(sdf.format(firstTimestampLong));
				Timestamp secondTimestamp = Timestamp.valueOf(sdf.format(secondTimestampLong));
				order.setFirstDate(firstTimestamp);
				order.setSecondDate(secondTimestamp);

			}

			order.setId(authInfo.getId());
			orders = orderService.selectOrderSearch(order);
		}

		if (keywordO != null && state == null && firstDate == null && secondDate == null) {

			System.out.println("검색 마이페이지");
			order = new OrderVO();

			order.setId(authInfo.getId());
			order.setKeywordO(keywordO);
			orders = orderService.selectOrderSearch(order);

		}

		if (keywordO == null && state != null && firstDate == null && secondDate == null) {

			System.out.println("정렬 마이페이지");
			order = new OrderVO();

			if (state.equals("전체 주문 상태")) {
				orders = orderService.selectOrderById(authInfo.getId());
			} else {
				order.setId(authInfo.getId());
				order.setState(state);
				;
				orders = orderService.selectOrderSort(order);
			}

		}

		if (keywordO == null && state == null && firstDate != null && secondDate != null) {

			System.out.println("날짜 마이페이지");
			order = new OrderVO();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			long firstTimestampLong = firstDate.getTime();
			long secondTimestampLong = secondDate.getTime();

			Timestamp firstTimestamp = Timestamp.valueOf(sdf.format(firstTimestampLong));
			Timestamp secondTimestamp = Timestamp.valueOf(sdf.format(secondTimestampLong));

			order.setId(authInfo.getId());
			order.setFirstDate(firstTimestamp);
			order.setSecondDate(secondTimestamp);
			orders = orderService.selectOrderDate(order);

		}

		JSONArray ordersJsonArray = new JSONArray();

		for (int i = 0; i < orders.size(); i++) {
			JSONArray orderListsJsonArray = new JSONArray();
			JSONObject orderJson = new JSONObject();
			orderJson.put("orderNum", orders.get(i).getOrderNum());
			orderJson.put("orderData", orders.get(i).getOrderDate());
			orderJson.put("state", orders.get(i).getState());
			orderJson.put("payNum", orders.get(i).getPayNum());
			int currentPayNum = orders.get(i).getPayNum();
			int payNumCount = 0;
			int payPrice = 0;
			for (int j = 0; j < orders.size(); j++) {
				if (orders.get(j).getPayNum() == currentPayNum) {
					payNumCount++;
					payPrice += orders.get(j).getPayPrice();
				}
			}
			orderJson.put("payPrice", payPrice);
			orderJson.put("payNumCount", payNumCount);
			if (i != 0) {
				orderJson.put("prePayNum", orders.get(i - 1).getPayNum());
			}
			if (i == 0) {
				orderJson.put("prePayNum", orders.get(i).getPayNum());
			}
			List<OrderListVO> orderLists = orderService.selectOrderListByOrderNum(orders.get(i).getOrderNum());
			System.out.println(orderLists.size());
			for (int j = 0; j < orderLists.size(); j++) {
				JSONObject orderListJson = new JSONObject();
				orderListJson.put("productThumb", orderLists.get(j).getProductThumb());
				orderListJson.put("productName", orderLists.get(j).getProductName());
				orderListJson.put("optionNum", orderLists.get(j).getOptionNum());
				orderListJson.put("olNum", orderLists.get(j).getOlNum());
				OptionVO optionVO = productService.selectOptionByOptionNum(orderLists.get(j).getOptionNum());
				ProductVO productVO = productService.selectProduct(optionVO.getProductNum());
				orderListJson.put("productNum", optionVO.getProductNum());
				SellerVO sellerVO = memberService.searchSellerById(productVO.getId());
				String optionName = "";
				DetailOptionVO detailOptionVO1 = productService.selectDetailOptionByDoNum(optionVO.getOptionOneNum());
				DetailOptionVO detailOptionVO2 = productService.selectDetailOptionByDoNum(optionVO.getOptionTwoNum());
				DetailOptionVO detailOptionVO3 = productService.selectDetailOptionByDoNum(optionVO.getOptionThreeNum());
				if (detailOptionVO1 != null) {
					optionName += detailOptionVO1.getOptionName();
				}
				if (detailOptionVO2 != null) {
					optionName += " / " + detailOptionVO2.getOptionName();
				}
				if (detailOptionVO3 != null) {
					optionName += " / " + detailOptionVO3.getOptionName();
				}
				orderListJson.put("storeName", sellerVO.getStoreName());
				orderListJson.put("optionName", optionName);
				orderListsJsonArray.add(orderListJson);
			}
			orderJson.put("orderLists", orderListsJsonArray);
			orderJson.put("orderListsSize", orderLists.size());
			ordersJsonArray.add(orderJson);
		}
		;

		String ordersToString = ordersJsonArray.toString();

		System.out.println(ordersToString);

		mv.setViewName("mypage/MyPage");

		mv.addObject("authInfo", authInfo);

		mv.addObject("ordersToString", ordersToString);

		mv.addObject("ordersJsonArray", ordersJsonArray);

		mv.addObject("state", state);

		mv.addObject("keywordO", keywordO);

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

	// 마이페이지 배송 조회
	@RequestMapping(value = "deliveryTracking")
	public ModelAndView deliveryTracking(int orderNum) {
		ModelAndView mv = new ModelAndView();

		OrderVO order = orderService.selectOrderByorderNum(orderNum);

		mv.setViewName("mypage/DeliveryTrackingByMyPage");

		System.out.println(order.getTrackingCode());
		System.out.println(order.getTrackingNum());

		mv.addObject("trackingCode", order.getTrackingCode());
		mv.addObject("trackingNum", order.getTrackingNum());

		return mv;
	}
	
	// 관심상품
	@RequestMapping("/wishControl")
	@ResponseBody
	public String wishControl(@RequestParam int productNum , @RequestParam String result , HttpServletRequest req) {
		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		
		WishListVO wishListVO = new WishListVO();

		wishListVO.setId(authInfo.getId());
		wishListVO.setProductNum(productNum);
		int rs = Integer.parseInt(result);
		if(rs == 0) {
			memberService.deleteWishListByIdProductNum(wishListVO);
		}else {
			memberService.insertWishList(wishListVO);
		}
		return "complete";
	}
	
	// 관심상품 목록
	@RequestMapping("/wishList")
	public ModelAndView wishList(HttpServletRequest req) {
		
		HttpSession session = req.getSession();

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		
		WishListVO wishListVO = new WishListVO();
		
		wishListVO.setId(authInfo.getId());
		
		List<ProductVO> productList = new ArrayList<ProductVO>();
		
		List<WishListVO> list = memberService.selectWishListById(wishListVO);
		
		for(int i = 0 ; i<list.size() ; i++) {
			productList.add(productService.selectProduct(list.get(i).getProductNum()));
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/WishList");
		
		mv.addObject("productList", productList);
	
		return mv;
	}
	
	// 관심상품 상품 선택 삭제
		@RequestMapping(value = "deleteSelectWishByProductNum")
		@ResponseBody
		public ModelAndView deleteSelectWishByProductNum(HttpServletRequest req,
			@RequestParam(value = "chk[]") List<String> selArr, WishListVO wishListVO) {
		HttpSession session = req.getSession();

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		
		wishListVO.setId(authInfo.getId());

		int productNum = 0;

		if (authInfo != null) {
			for (String i : selArr) {
				productNum = Integer.parseInt(i);
				wishListVO.setProductNum(productNum);
				memberService.deleteWishListByIdProductNum(wishListVO);
			}
		}
		
		ModelAndView mv = new ModelAndView();

		List<ProductVO> productList = new ArrayList<ProductVO>();
		
		List<WishListVO> list = memberService.selectWishListById(wishListVO);
		
		for(int i = 0 ; i<list.size() ; i++) {
			productList.add(productService.selectProduct(list.get(i).getProductNum()));
		}
		
		mv.setViewName("mypage/WishList");
		
		mv.addObject("productList", productList);
	
		return mv;
	}
		
	// 후기 작성 팝업
	@RequestMapping("/review")
	public String review() {
		return "mypage/Review";
	}
	
	// 후기 등록
	@RequestMapping("/insertReview")
	@ResponseBody
	public void insertReview(MultipartHttpServletRequest mtfRequest) {
		ReviewVO reviewVO = new ReviewVO();
		
		String uploadPath = "d:\\dev\\opload\\review";
		File dir = new File(uploadPath);
		if (!dir.exists()) {
			dir.mkdir();
		}
		UUID uid = UUID.randomUUID();
		if(mtfRequest.getFile("reviewImage").getOriginalFilename().equals("")) {
			reviewVO.setReviewImage("없음");
		} else {
			MultipartFile mf = mtfRequest.getFile("reviewImage");
			String fileName = mf.getOriginalFilename();
			String saveName = "r_" + uid.toString() + "_" + fileName;
			File target = new File(uploadPath, saveName);
			try {
				FileCopyUtils.copy(mf.getBytes(), target);
			} catch (IOException e) {
				e.printStackTrace();
			}
			reviewVO.setReviewImage(File.separator + "opload" + File.separator + "review" + File.separator + saveName);
		}
		
		reviewVO.setOrderNum(Integer.parseInt(mtfRequest.getParameter("orderNum")));
		
		reviewVO.setId(mtfRequest.getParameter("id"));
		
		reviewVO.setReviewText(mtfRequest.getParameter("reviewText"));
		
		if(Integer.parseInt(mtfRequest.getParameter("score")) == 0) {
			reviewVO.setScore(1);
		} else {
			reviewVO.setScore(Integer.parseInt(mtfRequest.getParameter("score")));
		}
		
		reviewVO.setReviewTitle(mtfRequest.getParameter("reviewTitle"));
		
		memberService.insertReview(reviewVO);
		
	}
	
	// 해당 주문에 대한 후기가 있는지 체크
	@RequestMapping("/reviewChk")
	@ResponseBody
	public int reviewChk(@RequestParam int orderNum, HttpServletRequest req) {
		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		
		ReviewVO reviewVO = new ReviewVO();

		reviewVO.setId(authInfo.getId());
		reviewVO.setOrderNum(orderNum);
		
		int result = 0;
		
		List<ReviewVO> list = memberService.selectReviewByOrderNumId(reviewVO);
		if(list != null) {
			result = list.size();
		}
		
		return result;
	}


}
