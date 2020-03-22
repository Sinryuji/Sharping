package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import service.OrderService;
import service.ProductService;
import vo.AuthInfo;
import vo.MemberVO;
import vo.OptionVO;
import vo.ProductVO;
import vo.SellerVO;

@Controller
public class OrderController {

	private OrderService orderService;
	private ProductService productService;
	private MemberService memberService;

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
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

	// 주문 페이지
	@RequestMapping("/orderPage")
	public ModelAndView orderPage(HttpServletRequest req, OptionVO optionVO, @RequestParam int cnt, @RequestParam int payPrice) {
		ModelAndView mv = new ModelAndView();
		
		
		HttpSession session = req.getSession();
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		
		// authInfo가 null일 경우 비회원 주문조회 추가

		int optionNum = productService.selectOptionNum(optionVO);

		OptionVO option = productService.selectOptionByOptionNum(optionNum);
		

		ProductVO product = productService.selectProduct(option.getProductNum());
		
		MemberVO member = memberService.searchMemberById(authInfo.getId());
		

		SellerVO seller = memberService.searchSellerById(product.getId());

		mv.setViewName("order/OrderPage");

		mv.addObject("optionNum", optionNum);

		mv.addObject("option", option);

		mv.addObject("product", product);

		mv.addObject("cnt", cnt);
		
		mv.addObject("payPrice", payPrice);

		mv.addObject("seller", seller);
		
		mv.addObject("member", member);
		
		mv.addObject("authInfo", authInfo);

		return mv;
	}

	// 주문 완료 버튼
	@RequestMapping("/orderResult")
	public ModelAndView orderResult() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("order/OrderResult");

		return mv;
	}
	
	// 카드 결제 팝업 창
	@RequestMapping("/payingCare")
	public ModelAndView payingCard() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("order/PayingCard");
		
		return mv;
	}
}
