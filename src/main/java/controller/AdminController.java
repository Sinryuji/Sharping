package controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import vo.DeclProductVO;
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

		System.out.println("으아아아아아" + categorys);

		int[] categoryNums = new int[categorys.size()];

		adminService.deleteCategory(categoryNum);

		for (int i = 0; i < categorys.size(); i++) {
			categoryNums[i] = categorys.get(i).getCategoryNum();
			adminService.deleteCategory(categorys.get(i).getCategoryNum());
		}

		List<ProductVO> products = productService.selectProductByCategoryNum(categoryNums);

		if (products.size() != 0) {
			for (int i = 0; i < products.size(); i++) {
				productService.updateProductByCategoryNumZero(products.get(i).getProductNum());
			}
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

		List<MemberVO> list1 = adminService.getMemberList(adminVO);
		List<SellerVO> list2 = adminService.getSellerList(adminVO);

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
	@RequestMapping(value = "/admin/noticeManage")
	public String getnoticeList(Model model, int page) throws Exception {
		NoticeVO noticeVO = new NoticeVO();

		List<NoticeVO> list1 = adminService.getNoticeList(noticeVO);

		int totCnt = list1.size();

		if (page == 1) {
			noticeVO.setStartNum(1);
			noticeVO.setEndNum(20);
		} else {
			noticeVO.setStartNum(page + (19 * (page - 1)));
			noticeVO.setEndNum(page * 20);
			if (noticeVO.getEndNum() < totCnt) {
				noticeVO.setEndNum(totCnt);
			}
		}

		List<NoticeVO> list2 = adminService.getNoticeListPaging(noticeVO);

		model.addAttribute("noticeList", list2);
		model.addAttribute("totCnt", totCnt);
		model.addAttribute("startNum", noticeVO.getStartNum());

		return "admin/NoticeManage";
	}

	// 공지사항관리(페이징)
	@RequestMapping(value = "/admin/noticeManagePaging")
	@ResponseBody
	public Map<String, Object> getnoticeListPaging(Model model, int page) throws Exception {
		NoticeVO noticeVO = new NoticeVO();

		List<NoticeVO> list1 = adminService.getNoticeList(noticeVO);

		int totCnt = list1.size();

		if (page == 1) {
			noticeVO.setStartNum(1);
			noticeVO.setEndNum(20);
		} else {
			noticeVO.setStartNum(page + (19 * (page - 1)));
			noticeVO.setEndNum(page * 20);
			if (noticeVO.getEndNum() < totCnt) {
				noticeVO.setEndNum(totCnt);
			}
		}

		List<NoticeVO> list2 = adminService.getNoticeListPaging(noticeVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("noticeList", list2);
		map.put("totCnt", totCnt);
		map.put("startNum", noticeVO.getStartNum());

		return map;
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

	// 메인에 공지사항 띄우기
	@RequestMapping("/notice")
	@ResponseBody
	public Map<String, Object> notice(NoticeVO noticeVO) throws Exception {

		Timestamp timestamp = noticeVO.getNoticeDate();

		Map<String, Object> map = new HashMap<String, Object>();

		Date date = new Date(timestamp.getTime());

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");

		String datee = sdf.format(date);

		map.put("notice", noticeVO);
		map.put("date", datee);

		return map;
	}

	@RequestMapping("/noticee")
	public String notice() throws Exception {

		return "/admin/Notice";
	}

	// 신고상품 관리
	@RequestMapping(value = "/admin/declProductManage")
	public ModelAndView declProductManage(@RequestParam(required = false) String declReason,
			@RequestParam(required = false) String search, int page) {

		DeclProductVO declProductVO = new DeclProductVO();

		declProductVO.setDeclReason(declReason);
		declProductVO.setSearch(search);

		List<DeclProductVO> declList = adminService.selectDeclProduct(declProductVO);

		int totCnt = declList.size();

		if (page == 1) {
			declProductVO.setStartNum(1);
			declProductVO.setEndNum(20);
		} else {
			declProductVO.setStartNum(page + (19 * (page - 1)));
			declProductVO.setEndNum(page * 20);
			if (declProductVO.getEndNum() < totCnt) {
				declProductVO.setEndNum(totCnt);
			}
		}

		List<DeclProductVO> declList2 = adminService.selectDeclProductPaging(declProductVO);

		List<ProductVO> productList = new ArrayList<ProductVO>();

		for (int i = 0; i < declList2.size(); i++) {
			productList.add(productService.selectProduct(declList2.get(i).getProductNum()));
		}

		ModelAndView mv = new ModelAndView();

		mv.setViewName("/admin/DeclProductManage");

		mv.addObject("declList", declList2);

		mv.addObject("productList", productList);

		mv.addObject("totCnt", totCnt);

		mv.addObject("startNum", declProductVO.getStartNum());

		mv.addObject("currentReason", declReason);

		mv.addObject("search", search);

		return mv;
	}

	// 신고상품 관리(페이징)
	@RequestMapping(value = "/admin/declProductManagePaging")
	@ResponseBody
	public Map<String, Object> declProductManagePaging(@RequestParam(required = false) String declReason,
			@RequestParam(required = false) String search, int page) {

		DeclProductVO declProductVO = new DeclProductVO();

		declProductVO.setDeclReason(declReason);
		declProductVO.setSearch(search);

		List<DeclProductVO> declList = adminService.selectDeclProduct(declProductVO);

		int totCnt = declList.size();

		if (page == 1) {
			declProductVO.setStartNum(1);
			declProductVO.setEndNum(20);
		} else {
			declProductVO.setStartNum(page + (19 * (page - 1)));
			declProductVO.setEndNum(page * 20);
			if (declProductVO.getEndNum() < totCnt) {
				declProductVO.setEndNum(totCnt);
			}
		}

		List<DeclProductVO> declList2 = adminService.selectDeclProductPaging(declProductVO);

		List<ProductVO> productList = new ArrayList<ProductVO>();

		for (int i = 0; i < declList2.size(); i++) {
			productList.add(productService.selectProduct(declList2.get(i).getProductNum()));
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("declList", declList2);

		map.put("productList", productList);

		map.put("totCnt", totCnt);

		map.put("startNum", declProductVO.getStartNum());

		map.put("currentReason", declReason);

		map.put("search", search);

		return map;
	}

	// 신고 내용 확인
	@RequestMapping(value = "/admin/declText")
	@ResponseBody
	public ModelAndView declText(int declNum) {

		DeclProductVO decl = adminService.selectDeclProductByDeclNum(declNum);

		ProductVO product = productService.selectProduct(decl.getProductNum());

		ModelAndView mv = new ModelAndView();

		mv.setViewName("admin/DeclContent");

		mv.addObject("decl", decl);

		mv.addObject("product", product);

		return mv;
	}

	// 신고 상품 관리 (상품 선택 삭제)
	@RequestMapping(value = "deleteSelectDeclProductByProductNum")
	@ResponseBody
	public void deleteSelectDeclProductByProductNum(@RequestParam(value = "chk[]") List<String> selArr,
			ProductVO productVO) {

		int productNum = 0;

		for (String i : selArr) {
			productNum = Integer.parseInt(i);
			productVO.setProductNum(productNum);
			productService.deleteProductByProductNum(productVO);
		}
	}

	// 신고 상품 관리 (신고 선택 삭제)
	@RequestMapping(value = "deleteSelectDeclProductByDeclNum")
	@ResponseBody
	public void deleteSelectDeclProductByDeclNum(@RequestParam(value = "chk[]") List<String> selArr,
			DeclProductVO declProductVO) {

		int declNum = 0;

		for (String i : selArr) {
			declNum = Integer.parseInt(i);
			declProductVO.setDeclNum(declNum);
			adminService.deleteDeclProductByDeclNum(declProductVO);
		}
	}

}
