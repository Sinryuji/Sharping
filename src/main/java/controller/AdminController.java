package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import exception.AlreadyExistingIdException;
import service.AdminService;
import service.MemberService;
import service.ProductService;
import vo.AdminVO;
import vo.CategoryVO;
import vo.MemberVO;
import vo.NoticeVO;
import vo.ProductVO;
import vo.SellerVO;

@Controller
public class AdminController {

	private AdminService adminService;
	private MemberService memberService;
	private ProductService productService;

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

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
	public ModelAndView categoryManage() {

		ModelAndView mv = new ModelAndView();

		List<CategoryVO> categorys = adminService.selectCategoryByCategoryDepth(1);


		mv.setViewName("admin/CategoryManage");

		mv.addObject("cetegorys", categorys);

		return mv;
	}

	// 카테고리 선택
	@RequestMapping("/admin/selectCategory")
	@ResponseBody
	public List<CategoryVO> selectCategory(int categoryNum) {
		
		System.out.println("@@@@@@@@@@@@@@@@");
		
		System.out.println(categoryNum);

		List<CategoryVO> categorys = adminService.selectCategoryByPcNum(categoryNum);
		
		System.out.println(categorys);

		return categorys;
	}

	// 대분류 카테고리 추가
	@RequestMapping("/admin/insertCategoryDepthOne")
	@ResponseBody
	public CategoryVO insertCategoryDepthOne(String categoryName) {

		adminService.insertCategoryDepthOne(categoryName);

		int maxNum = adminService.selectMaxCategonryNum();

		System.out.println(maxNum);

		CategoryVO category = adminService.selectCategoryByCategoryNum(maxNum);

		return category;

	}

	// 중분류 카테고리 추가
	@RequestMapping("/admin/insertCategoryDepthTwo")
	@ResponseBody
	public CategoryVO insertCategoryDepthTwo(CategoryVO categoryVO) {

		adminService.insertCategoryDepthTwo(categoryVO);

		int maxNum = adminService.selectMaxCategonryNum();

		System.out.println(maxNum);

		CategoryVO category = adminService.selectCategoryByCategoryNum(maxNum);

		return category;

	}

	// 중분류 카테고리 추가
	@RequestMapping("/admin/insertCategoryDepthThree")
	@ResponseBody
	public CategoryVO insertCategoryDepthThree(CategoryVO categoryVO) {

		adminService.insertCategoryDepthThree(categoryVO);

		int maxNum = adminService.selectMaxCategonryNum();

		System.out.println(maxNum);

		CategoryVO category = adminService.selectCategoryByCategoryNum(maxNum);

		return category;

	}
	
	// 카테고리 수정
	@RequestMapping("/admin/updateCategory")
	@ResponseBody
	public CategoryVO updateCategory(CategoryVO categoryVO) {

		adminService.updateCategory(categoryVO);

		CategoryVO category = adminService.selectCategoryByCategoryNum(categoryVO.getCategoryNum());

		return category;

	}
	
	// 카테고리 삭제
	@RequestMapping("/admin/deleteCategory")
	@ResponseBody
	public Map<String, Object> deleteCategory(int categoryNum) {
		
		CategoryVO returnCategory = adminService.selectCategoryByCategoryNum(categoryNum);
		
		List<CategoryVO> categorys = adminService.selectCategoryByPcNum(categoryNum);
		
		int[] categoryNums = new int[categorys.size()];
		
		adminService.deleteCategory(categoryNum);
		
		for(int i = 0 ; i < categorys.size() ; i++) {
			categoryNums[i] = categorys.get(i).getCategoryNum();
			adminService.deleteCategory(categorys.get(i).getCategoryNum());
		}
		
		List<ProductVO> products = productService.selectProductByCategoryNum(categoryNums);
		
		for(int i = 0 ; i < products.size() ; i++) {
			productService.updateProductByCategoryNumZero(products.get(i).getProductNum());
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("category", returnCategory);
		map.put("categorys", categorys);
		
		return map;
		
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

	// 공지사항 삭제
	@RequestMapping(value = "/admin/deleteNotice")
	public String deleteNotice(int noticeNum) throws Exception {
		adminService.deleteNoticeByNoticeNum(noticeNum);
		return "admin/NoticeManage";
	}


	// 공지사항 등록화면
	@RequestMapping(value = "/admin/writeNotice")
	public String writeNotice() throws Exception {

		return "/admin/WriteNotice";
	}

	// 공지사항 작성
	@RequestMapping(value = "/admin/inserNotice", method = RequestMethod.GET)
	public String insertNotice(Model model) {
		model.addAttribute("noticeVO", new NoticeVO());
		return "/admin/insertNotice";
	}

	// 공지사항 작성 등록 요청
	@RequestMapping(value = "/admin/insertNotice", method = RequestMethod.POST)
	public String inertNotice(@Valid NoticeVO noticeVO, BindingResult bindingResult) throws Exception {
		if (bindingResult.hasErrors()) {
			return "/admin/insertNotice";
		}
		if (noticeVO.getNoticePost() == null) {
			noticeVO.setNoticePost("FALSE");
		}
		adminService.insertNotice(noticeVO);
		return "redirect:/admin/noticeManage";
	}

	// 공지사항 수정
	@RequestMapping(value = "/admin/updateNotice", method = RequestMethod.GET)
	public String updateNotice(@RequestParam("noticeNum") int noticeNum, Model model) throws Exception {
		NoticeVO noticeVO = adminService.selectNoticeByNoticeNum(noticeNum);
		model.addAttribute("updateNotice", noticeVO);
		return "/admin/UpdateNotice";
	}

	// 공지사항 수정 등록 요청
	@RequestMapping(value = "/admin/updateNotice", method = RequestMethod.POST)
	public String updateNotice(NoticeVO noticeVO) throws Exception {

		if (noticeVO.getNoticePost() == null) {
			noticeVO.setNoticePost("FALSE");
		}
		adminService.updateNoticeByNoticeNum(noticeVO);
		return "redirect:/admin/noticeManage";
	}

	// 공지사항 진열여부
	@RequestMapping("/admin/updateNoticePost")
	@ResponseBody
	public String updateNoticePost(@RequestParam int noticeNum, @RequestParam String noticePost) throws Exception {
		NoticeVO noticeVO = new NoticeVO();

		noticeVO.setNoticeNum(noticeNum);
		noticeVO.setNoticePost(noticePost);
		adminService.updateNoticePostByNoticeNum(noticeVO);

		return "complete";
	}


}
