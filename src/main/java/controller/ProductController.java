package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import service.ProductService;
import vo.AuthInfo;
import vo.DetailOptionVO;
import vo.OptionVO;
import vo.OrderVO;
import vo.ProductVO;
import vo.SellerVO;

@Controller
public class ProductController {

	private ProductService productService;
	private MemberService memberService;

	public ProductController() {
		super();
	}

	public ProductController(ProductService productService, MemberService memberService) {
		super();
		this.productService = productService;
		this.memberService = memberService;
	}

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

	// 상품 페이지
	@RequestMapping("/product")
	public ModelAndView product(int productNum) {
		ProductVO productVO = productService.selectProduct(productNum);
		SellerVO sellerVO = memberService.searchSellerById(productVO.getId());
		List<DetailOptionVO> detailOptionList = productService.selectDetailOption(productNum);
		
		int maxOptionLevel = 0;
		
		if(detailOptionList.size() != 0) {
		maxOptionLevel = productService.selectOptionLevelMaxByProductNum(productNum);
		
		} else if(detailOptionList.size() == 0 ) {
			maxOptionLevel = 0;
		}
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/Product");
		mv.addObject("product", productVO);
		mv.addObject("seller", sellerVO);
		mv.addObject("detailOptionList", detailOptionList);
		mv.addObject("maxOptionLevel", maxOptionLevel);
		

		return mv;
	}

	// 상품 업로드 페이지
	@RequestMapping("/uploadProduct")
	public ModelAndView uploadProduct() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("seller/UploadProduct");

		return mv;
	}

	// 판매자 페이지
	@RequestMapping("/sellerPage")
	public ModelAndView sellerPage() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("seller/SellerPage");

		return mv;
	}

	// 상품 관리 탭
	@RequestMapping("/productManage")
	public ModelAndView productManage(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		
		List<ProductVO> productList = productService.productListById(authInfo.getId());
		
		ModelAndView mv = new ModelAndView();

		mv.setViewName("seller/ProductManage");
		mv.addObject("productList", productList);

		return mv;
	}

	// 주문 관리 탭
	@RequestMapping("/orderManage")
	public ModelAndView orderManage() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("seller/OrderManage");

		return mv;
	}
	
//	// 주문 페이지
//	@RequestMapping("/orderPage")
//	public ModelAndView orderPage(OptionVO optionVO) {
//		ModelAndView mv = new ModelAndView();
//	
//		int optionNum = productService.selectOptionNum(optionVO);
//		
//		mv.setViewName("order/OrderPage");
//		
//		mv.addObject("optionNum", optionNum);
//		
//		return mv;
//	}

}
