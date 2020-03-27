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
import vo.OrderListVO;
import vo.OrderVO;
import vo.PayingCardVO;
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
	public ModelAndView orderPage(HttpServletRequest req, OptionVO optionVO, @RequestParam int cnt, @RequestParam int payPrice, @RequestParam(required=false) int deliveryPrice) {
		ModelAndView mv = new ModelAndView();
		
		
		HttpSession session = req.getSession();
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		
		// authInfo가 null일 경우 비회원 주문조회 추가
		
		payPrice += deliveryPrice;

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
	
	

	// 카드 결제 완료 및 주문 완료
	@RequestMapping("/orderCardResult")
	public ModelAndView orderResult(OrderVO orderVO, OrderListVO orderListVO) {
		ModelAndView mv = new ModelAndView();
		
		orderVO.setState("결제 완료");
		orderVO.setPayCase("카드");
		orderVO.setTrackingNum("");
		
		orderService.insertOrder(orderVO);
		
		OrderVO order = new OrderVO();
		
		order = orderService.selectLatelyOrderNum(orderVO.getId());
		
		orderVO.setOrderNum(order.getOrderNum());
		
		orderListVO.setOrderNum(order.getOrderNum());
		
		int insertPayCardResult = orderService.insertPayCard(orderVO);
		
		int insertOrderResult = orderService.insertOrderList(orderListVO);
		
		int productNum = orderService.selectProductNumByOptionNum(orderListVO.getOptionNum());
		
		orderListVO.setProductNum(productNum);
		
		if(insertPayCardResult > 0) {
			orderService.decrementStockProduct(orderListVO);
		}
		
		if(insertOrderResult > 0) {
			orderService.decrementStockOption(orderListVO);
		}

		mv.setViewName("order/OrderResult");

		return mv;
	}
	
	// 카드 결제 팝업 창
	@RequestMapping("/payingCard")
	public ModelAndView payingCard(PayingCardVO payingCardVO, OrderVO orderVO, OrderListVO orderListVO) {
		ModelAndView mv = new ModelAndView();
		
		String address = orderVO.getToAddress();
		String addressEtc = orderVO.getToAddressEtc();
		
		String result = "";
		
		if(addressEtc != null) {
		result = address + " " + addressEtc;
		}
		else {
			result = address;
		}
		
		orderVO.setToAddress(result);

		
		mv.setViewName("order/PayingCard");
		mv.addObject("payingCard", payingCardVO);
		mv.addObject("order", orderVO);
		mv.addObject("orderList", orderListVO);
		
		
		return mv;
	}
}
