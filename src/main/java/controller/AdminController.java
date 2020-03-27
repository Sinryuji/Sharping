package controller;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import exception.AlreadyExistingIdException;
import service.AdminService;
import service.MemberService;
import vo.AdminVO;
import vo.MemberVO;
import vo.NoticeVO;
import vo.SellerVO;

@Controller
public class AdminController {

	private AdminService adminService;
	private MemberService memberService;

	public MemberService getMemberService() {
		return memberService;
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

	// 관리자 메인
	@RequestMapping("/admin")
	public String admin() {
		return "admin/AdminPage";
	}

	// 새 관리자등록
	@RequestMapping("/admin/registerAdmin")
	public String registerAdmin() {
		return "admin/RegisterAdmin";
	}

	// 아이디 중복확인
	@RequestMapping(value = "/adminIdCheck")
	@ResponseBody
	public int adminIdCheck(@Valid String adminId) {
		int result = adminService.adminIdCheck(adminId);
		return result;
	}

	// 새 관리자 등록 완료
	@RequestMapping(value = "/admin/registerCompleteAdmin")
	public String registCompleteMember(@Valid AdminVO adminVO) {

		String pw = adminVO.getAdminPassword();
		String hashPw = BCrypt.hashpw(pw, BCrypt.gensalt());
		adminVO.setAdminPassword(hashPw);
		int result = adminService.adminIdCheck(adminVO.getAdminId());
		if (result == 1) {
			throw new AlreadyExistingIdException();
		}
		adminService.registAdmin(adminVO);
		return "redirect:/admin";
	}

	// 카테고리관리
	@RequestMapping("/admin/categoryManage")
	public String categoryManage() {
		return "admin/CategoryManage";
	}

	// 일반회원목록리스트

	@RequestMapping(value = "/admin/memberList", method = RequestMethod.GET)
	public String getMemberList(Model model, @RequestParam(required = false) String keywordM) throws Exception {
		AdminVO adminVO = new AdminVO();
		adminVO.setKeywordM(keywordM);

		model.addAttribute("memberList", adminService.getMemberList(adminVO));
		model.addAttribute("sellerList", adminService.getSellerList(adminVO));
		model.addAttribute("keywordM", keywordM);

		return "admin/MemberManage";
	}

	// 일반회원목록리스트
	@RequestMapping(value = "/admin/memberManage", method = RequestMethod.GET)
	public String memberManage(Model model, @RequestParam(required = false) String keywordM) throws Exception {
		AdminVO adminVO = new AdminVO();
		adminVO.setKeywordM(keywordM);

		model.addAttribute("memberList", adminService.getMemberList(adminVO));
		model.addAttribute("sellerList", adminService.getSellerList(adminVO));
		model.addAttribute("keywordM", keywordM);

		return "admin/MemberManage";
	}

	// 판매회원목록리스트
	@RequestMapping(value = "/admin/sellerList", method = RequestMethod.GET)
	public String getSellerList(Model model, @RequestParam(required = false) String keywordM) throws Exception {
		AdminVO adminVO = new AdminVO();
		adminVO.setKeywordM(keywordM);

		model.addAttribute("memberList", adminService.getMemberList(adminVO));
		model.addAttribute("sellerList", adminService.getSellerList(adminVO));
		model.addAttribute("keywordM", keywordM);

		return "admin/MemberManage";
	}

	// 회원세부정보 열람
	@RequestMapping("/admin/infoDetail")
	public ModelAndView infoDetail(String id) {

		MemberVO memberVO = memberService.searchMemberById(id);
		SellerVO sellerVO = memberService.searchSellerById(id);

		ModelAndView mv = new ModelAndView();

		if (sellerVO != null) {
			mv.setViewName("admin/InfoSellerDetail");
			mv.addObject("seller", sellerVO);
			mv.addObject("member", memberVO);

		} else if (sellerVO == null) {
			mv.setViewName("admin/InfoMemberDetail");
			mv.addObject("member", memberVO);
		}

		return mv;
	}

	// 관리자 비밀번호 확인 페이지
	@RequestMapping(value = "/admin/adminPw")
	public String adminPw() {
		return "admin/AdminPw";
	}

	// 관리자 비밀번호 확인
	@RequestMapping(value = "/adminPwChk", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String adminPwChk(HttpSession session, @RequestParam String pw) {
		// ModelAndView mv = new ModelAndView();
		AdminVO adminVO = (AdminVO) session.getAttribute("adminVO");
		String data = "";
		if (!BCrypt.checkpw(pw, adminVO.getAdminPassword())) {
			data = "false";

		} else {
			data = "true";
		}
		return data;
	}

	// 일반회원삭제하기
	@RequestMapping(value = "/admin/deleteMember")
	public String deleteMember(MemberVO memberVO) throws Exception {
		adminService.deleteMemberById(memberVO);
		return "admin/MemberManage";
	}
	
	// 판매회원삭제하기
	@RequestMapping(value = "/admin/deleteSeller")
	public String deleteSeller(SellerVO sellerVO) throws Exception {
		adminService.deleteSellerById(sellerVO);
		return "admin/MemberManage";
	}
	
	// 공지사항관리
	@RequestMapping(value = "/admin/noticeManage", method = RequestMethod.GET)
	public String getnoticeList(Model model) throws Exception {
		NoticeVO noticeVO = new NoticeVO();

		model.addAttribute("noticeList", adminService.getNoticeList(noticeVO));
		
		return "admin/NoticeManage";
	}
	
	// 공지사항 열람
	@RequestMapping("/admin/noticeContent")
	public ModelAndView noticeView(int noticeNum) throws Exception {
		NoticeVO noticeVO = adminService.selectNoticeByNoticeNum(noticeNum);
		
		
		ModelAndView mv = new ModelAndView();

			mv.setViewName("admin/NoticeContent");
			mv.addObject("notice", noticeVO);

		return mv;
	}
	
	//공지사항 삭제
	@RequestMapping(value = "/admin/deleteNotice")
	public String deleteNotice(int noticeNum) throws Exception {
		adminService.deleteNoticeByNoticeNum(noticeNum);
		return "admin/NoticeManage";
	}
	
	//공지사항 수정
//	@RequestMapping(value = "/admin/updateNotice", method = RequestMethod.GET)
//	public String updateNotice(@RequestParam("noticeNum") int noticeNum,
//								@RequestParam(value = "mode", required=false) String mode, Model model) throws Exception {
//		
//		model.addAttribute("noticeContent", adminService.selectNoticeByNoticeNum(noticeNum));
//		model.addAttribute("mode", mode);
//		model.addAttribute("noticeVO", new NoticeVO());
//		return "admin/WriteNotice";
//	}
	
	//공지사항 등록화면
	@RequestMapping(value = "/admin/writeNotice")
	public String writeNotice() throws Exception{
		return "/admin/WriteNotice";
	}
	
	//공지사항 새글작성
	@RequestMapping(value = "/admin/insertNotice")
	public ModelAndView insertNotice(NoticeVO noticeVO, HttpSession session) throws Exception {
		AdminVO adminVO = (AdminVO) session.getAttribute("adminVO");
        ModelAndView mv = new ModelAndView("redirect:/admin/noticeManage");
        adminService.insertNotice(noticeVO);
        return mv;
	}
	
	//공지사항 새 글 저장
	@RequestMapping(value = "/admin/saveNotice", method=RequestMethod.POST)
	public String saveNotice(@ModelAttribute("NoticeVO") NoticeVO noticeVO,	
							RedirectAttributes rttr) throws Exception {

			adminService.insertNotice(noticeVO);
			return "redirect:/admin/noticeManage";
	}

	
}

