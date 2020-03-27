package controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import service.MemberService;
import service.OrderService;
import service.ProductService;
import vo.AuthInfo;
import vo.BankVO;
import vo.BasketListVO;
import vo.MemberVO;
import vo.OptionVO;
import vo.OrderListVO;
import vo.OrderVO;

import vo.PayBankVO;
import vo.PayMoneyVO;

import vo.PayingCardVO;
import vo.ProductVO;
import vo.SellerVO;
import vo.VirtualAccountVO;

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

	public ModelAndView orderPage(HttpServletRequest req, OptionVO optionVO, @RequestParam int cnt,
			@RequestParam int payPrice, @RequestParam(required = false) int[] basketNums, int deliveryPrice) {

		ModelAndView mv = new ModelAndView();

		HttpSession session = req.getSession();

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");

		// authInfo가 null일 경우 비회원 주문조회 추가
		
		payPrice += deliveryPrice;

		List<BankVO> bankVO = orderService.selectBankCodeList();

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

		mv.addObject("payPrice", payPrice + deliveryPrice);

		mv.addObject("seller", seller);

		mv.addObject("member", member);

		mv.addObject("authInfo", authInfo);

		mv.addObject("bankInfo", bankVO);

		return mv;
	}

	// 장바구니에서 들어간 주문페이지
	@RequestMapping("/orderPageByBasket")
	public ModelAndView orderPageBybasket(HttpServletRequest req, @RequestParam(required = false) int[] optionNums,
			@RequestParam int cnt, @RequestParam int totalPrice, @RequestParam(required = false) int[] basketNums,
			@RequestParam int payPrice, @RequestParam int totalDeliveryPrice) {

		System.out.println("어서오소");
		ModelAndView mv = new ModelAndView();

		HttpSession session = req.getSession();
		System.out.println(optionNums + "머가들어갔니");
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		List<BankVO> bankVO = orderService.selectBankCodeList();
		List<BasketListVO> basketSelect = productService.selectBasket(basketNums);
		List<OptionVO> option = productService.selectOptionByOptionNumList(optionNums);

		int options = option.size();
		int[] productNum = new int[options];
		for (int i = 0; i < options; i++) {
			productNum[i] = option.get(i).getProductNum();
		}

		List<ProductVO> product = productService.selectProducts(productNum);
		int products = product.size();
		String[] proId = new String[products];
		for (int i = 0; i < products; i++) {
			proId[i] = product.get(i).getId();
		}

		MemberVO member = memberService.searchMemberById(authInfo.getId());

		List<SellerVO> seller = memberService.searchSellerByIds(proId);
		int idSize = seller.size();
		String[] sellerId = new String[idSize];
		for (int i = 0; i < idSize; i++) {
			sellerId[i] = seller.get(i).getId();
		}

		mv.setViewName("order/OrderPageByBasket");

		mv.addObject("option", option);

		mv.addObject("product", product);

		mv.addObject("cnt", cnt);

		mv.addObject("payPrice", payPrice);

		// 주문 총 가격

		mv.addObject("seller", seller);

		mv.addObject("member", member);

		mv.addObject("authInfo", authInfo);

		mv.addObject("bankInfo", bankVO);

		mv.addObject("basketSelect", basketSelect);

		System.out.println("basketSelectSize : " + basketSelect.size());
		System.out.println("optionListSize : " + option.size());
		System.out.println("productListSize : " + product.size());
		System.out.println("sellerListSize : " + seller.size());

		System.out.println("basketSelect : " + basketSelect);
		System.out.println("optionList : " + option);
		System.out.println("productList : " + product);
		System.out.println("sellerList : " + seller);

		JSONObject TotalJson = new JSONObject();
		JSONObject orderJson = new JSONObject();
		JSONArray orderListJsonArray = new JSONArray();

		int a = 0;

		for (int i = 0; i < basketSelect.size(); i++) {
			JSONObject orderListJson = new JSONObject();
			orderListJson.put("productName", basketSelect.get(i).getProductName());
			orderListJson.put("productThumb", basketSelect.get(i).getProductThumb());
			orderListJson.put("optionOneNum", option.get(i).getOptionOneNum());
			orderListJson.put("optionTwoNum", option.get(i).getOptionTwoNum());
			orderListJson.put("optionThreeNum", option.get(i).getOptionThreeNum());
			orderListJson.put("productPrice", basketSelect.get(i).getProductPrice());
			orderListJson.put("cnt", basketSelect.get(i).getCnt());
			orderListJson.put("optionNum", option.get(i).getOptionNum());
			orderListJson.put("productNum", basketSelect.get(i).getProductNum());
			orderListJsonArray.add(orderListJson);
			a += (basketSelect.get(i).getProductPrice() * basketSelect.get(i).getCnt())
					+ basketSelect.get(i).getDeliveryPrice();
		}

		TotalJson.put("orderListJsonArray", orderListJsonArray);
		TotalJson.put("orderJson", orderJson);

		String orderJsonString = orderJson.toString();
		String orderListJsonListString = orderListJsonArray.toString();

		mv.addObject("orderListJsonArray", orderListJsonListString);
		mv.addObject("totalPrice", a);

		return mv;
	}
	

	// 상품 페이지에서 들어간 주문 페이지의 무통장 입금 주문 완료 버튼
	@RequestMapping("/orderResult")
	public ModelAndView orderResult(HttpServletRequest req, OrderVO orderVO, OrderListVO orderListVO,
			@RequestParam int bankCode) {
		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		orderVO.setState("입금 대기");
		orderVO.setPayCase("무통장 입금");
		orderVO.setTrackingNum("");
		
		String address = orderVO.getToAddress();
		String addressEtc = orderVO.getToAddressEtc();

		String result = "";

		if (addressEtc != null) {
			result = address + " " + addressEtc;
		} else {
			result = address;
		}
		
		orderVO.setToAddress(result);

	
		// 주문 인설트하고
		orderService.insertOrder(orderVO);

		OrderVO order = new OrderVO();
		// 주문자 아이디 이용해서 오더정보 받아오고
		order = orderService.selectLatelyOrderNum(orderVO.getId());
		// 오더에 오더넘버 셋하고
		orderVO.setOrderNum(order.getOrderNum());
		// 오더리스트에 주문번호 셋하고
		orderListVO.setOrderNum(order.getOrderNum());
		// 오더리스트 인설트 성공여부 받아오고
		int insertOrderResult = orderService.insertOrderList(orderListVO);
		// 오더리스트에 해당 옵션상품번호 받아오고
		int productNum = orderService.selectProductNumByOptionNum(orderListVO.getOptionNum());
		// 인설트 성공하고 0보다 크면 스탁량 -
		if (insertOrderResult > 0) {
			orderService.decrementStockOption(orderListVO);
			orderService.decrementStockProduct(orderListVO);
		}
		VirtualAccountVO virtualAccountVO = new VirtualAccountVO();
		// 주문번호 셀렉트
		orderVO = orderService.selectOrderByorderNum(order.getOrderNum());
		// 가상계좌번호 만들기 구현해야해
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String ranNum = "";

		for (int i = 1; i <= 6; i++) {
			ranNum += (int) (Math.random() * 10);
		}
		String vaNum = ranNum + "-" + bankCode + "-" + ymd;
		virtualAccountVO.setVaNum(vaNum);
		virtualAccountVO.setOrderNum(orderVO.getOrderNum());
		virtualAccountVO.setBankCode(bankCode);
		virtualAccountVO.setPayPrice(orderVO.getPayPrice());
		virtualAccountVO.setRespCode("NO");
		// 입금 마감일자 구현해야해야
//			virtualAccountVO.setDepositDate(depositDate);
//			그걸로 가상계좌 인설트 하고 
		orderService.insertByvirtualAccount(virtualAccountVO);
//			무통장 입금이 가상계좌랑 주문번호 셀렉트 해와서 
		PayBankVO payBankVO = new PayBankVO();
		payBankVO = orderService.selectVirtualAccountByorderNum(orderVO.getOrderNum());
//			payBankVO.setOrderNum(payBankVO.getOrderNum());
//			payBankVO.setBankCode(payBankVO.getBankCode());
//			payBankVO.setVaNum(payBankVO.getVaNum());

//			무통장입금을 인설트 한다. 
		System.out.println(orderVO);
		System.out.println(payBankVO);
		orderService.insertPayBank(payBankVO);
//			무통장 입금 셀렉트 해와서 
		payBankVO = orderService.selectPayBank(orderVO.getOrderNum());
//			모델에 담아주면 끄읕

		ModelAndView mv = new ModelAndView();
		mv.setViewName("order/OrderResult");
		mv.addObject("payBank", payBankVO);

		return mv;
	}

	// 장바구니에서 들어간 주문 페이지의 무통장 입금 주문 완료 버튼
	@RequestMapping(value = "/orderResultByBasket")
	public ModelAndView orderResult(HttpServletRequest req, int payPrice, String orderListJsonArray, OrderVO orderVO,
			@RequestParam int bankCode) {
		
		JSONArray orderListJsonListt = null;
		JSONParser parser = new JSONParser();
		try {
			orderListJsonListt = (JSONArray) parser.parse(orderListJsonArray);
		} catch (ParseException e) {
			e.printStackTrace();
		}


		String address = orderVO.getToAddress();
		String addressEtc = orderVO.getToAddressEtc();

		String result = "";

		if (addressEtc != null) {
			result = address + " " + addressEtc;
		} else {
			result = address;
		}

		orderVO.setToAddress(result);

		orderVO.setPayPrice(payPrice);

		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		orderVO.setState("입금 대기");
		orderVO.setPayCase("무통장 입금");
		orderVO.setTrackingNum("");

		// 주문 인설트하고
		orderVO.setId(authInfo.getId());
		System.out.println(orderVO);
		orderService.insertOrder(orderVO);

		OrderVO order = new OrderVO();
		// 주문자 아이디 이용해서 오더정보 받아오고
		order = orderService.selectLatelyOrderNum(orderVO.getId());
		// 오더에 오더넘버 셋하고
		orderVO.setOrderNum(order.getOrderNum());

		Gson gson = new Gson();

		for (int i = 0; i < orderListJsonListt.size(); i++) {
			System.out.println(orderListJsonListt.get(i).toString());
			OrderListVO orderListVO = new OrderListVO();
			orderListVO = gson.fromJson(orderListJsonListt.get(i).toString(), OrderListVO.class);
			orderListVO.setOrderNum(orderVO.getOrderNum());
			System.out.println(orderListVO);
			int insertOrderResult = orderService.insertOrderList(orderListVO);
			int productNum = orderService.selectProductNumByOptionNum(orderListVO.getOptionNum());
			if (insertOrderResult > 0) {
				orderService.decrementStockOption(orderListVO);
				orderService.decrementStockProduct(orderListVO);
			}
		}

//		//오더리스트에 주문번호 셋하고
//		orderListVO.setOrderNum(order.getOrderNum());
//		//오더리스트 인설트 성공여부 받아오고
//		int insertOrderResult = orderService.insertOrderList(orderListVO);
//		//오더리스트에 해당 옵션상품번호 받아오고
//		int productNum = orderService.selectProductNumByOptionNum(orderListVO.getOptionNum());
//		//인설트 성공하고 0보다 크면 스탁량 -
//		if (insertOrderResult > 0) {
//			orderService.decrementStockOption(orderListVO.getOptionNum());
//		}
		VirtualAccountVO virtualAccountVO = new VirtualAccountVO();
		// 주문번호 셀렉트
		orderVO = orderService.selectOrderByorderNum(order.getOrderNum());
		// 가상계좌번호 만들기 구현해야해
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String ranNum = "";

		for (int i = 1; i <= 6; i++) {
			ranNum += (int) (Math.random() * 10);
		}
		String vaNum = ranNum + "-" + bankCode + "-" + ymd;

		virtualAccountVO.setVaNum(vaNum);
		virtualAccountVO.setOrderNum(orderVO.getOrderNum());
		virtualAccountVO.setBankCode(bankCode);
		virtualAccountVO.setPayPrice(orderVO.getPayPrice());
		virtualAccountVO.setRespCode("NO");
		// 입금 마감일자 구현해야해야
//		virtualAccountVO.setDepositDate(depositDate);
//		그걸로 가상계좌 인설트 하고 
		orderService.insertByvirtualAccount(virtualAccountVO);
//		무통장 입금이 가상계좌랑 주문번호 셀렉트 해와서 
		PayBankVO payBankVO = new PayBankVO();
		System.out.println("orerVO : " + orderVO);
		payBankVO = orderService.selectVirtualAccountByorderNum(orderVO.getOrderNum());
//		payBankVO.setOrderNum(payBankVO.getOrderNum());
//		payBankVO.setBankCode(payBankVO.getBankCode());
//		payBankVO.setVaNum(payBankVO.getVaNum());

//		무통장입금을 인설트 한다. 
		System.out.println(payBankVO);
		orderService.insertPayBank(payBankVO);
//		무통장 입금 셀렉트 해와서 
		payBankVO = orderService.selectPayBank(orderVO.getOrderNum());
//		모델에 담아주면 끄읕

		ModelAndView mv = new ModelAndView();
		mv.setViewName("order/OrderResult");
		mv.addObject("payBank", payBankVO);

		return mv;
	}

	// 입금하러가기
	@RequestMapping("/insertMoney")
	public ModelAndView insertMoney() {

		ModelAndView mv = new ModelAndView();
		List<BankVO> bankVO = orderService.selectBankCodeList();
		mv.setViewName("order/InsertMoney");
		mv.addObject("bankInfo", bankVO);
		return mv;
	}

	// 입금
	@RequestMapping("/payMoney")
	public ModelAndView pay(@RequestParam int payPrice, @RequestParam int bankCode, @RequestParam String vaNum) {

//		돈을 입금할때 은행코드와 주문번호 가상계좌 3개가 일치해야하고 
//		가상계좌에 payPrice랑 값이 같은지 비교하고 respCode를 "YES"로 업데이트 해준다.
		PayMoneyVO payMoney = new PayMoneyVO();
		payMoney.setBankCode(bankCode);
		payMoney.setVaNum(vaNum);
		payMoney.setPayPrice(payPrice);
		int result = orderService.updateRespCode(payMoney);
//		payPrice랑 값이 같으면(if) 주문에 주문상태를 "결제 완료"로 업데이트 해주고. PayBank에 결제완료일을 업데이트 해준다.
//		그 외에는 입금실패 
		if (result == 1) {
			ModelAndView mv = new ModelAndView();
			orderService.updatePaydateByPaybank(result);
			orderService.updateStateByOrder(result);
		} else {
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("order/InsertMoney");
		return mv;
	}

	// 상품페이지에서 누룬 주문페이지의 카드 결제 팝업 창
	@RequestMapping("/payingCard")
	public ModelAndView payingCard(PayingCardVO payingCardVO, OrderVO orderVO, OrderListVO orderListVO, int payPrice) {
		ModelAndView mv = new ModelAndView();

		String address = orderVO.getToAddress();
		String addressEtc = orderVO.getToAddressEtc();

		String result = "";

		if (addressEtc != null) {
			result = address + " " + addressEtc;
		} else {
			result = address;
		}

		orderVO.setToAddress(result);

		mv.setViewName("order/PayingCard");
		mv.addObject("payingCard", payingCardVO);
		mv.addObject("order", orderVO);
		mv.addObject("orderList", orderListVO);
		mv.addObject("payPrice", payPrice);

		return mv;
	}

	// 상품페이지에서 누른 주문 페이지의 카드 결제 완료 및 주문 완료
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

	// 장바구니에서 누른 주문페이지의 카드 결제 팝업 창
	@RequestMapping("/payingCardByBasket")
	public ModelAndView payingCardByBasket(PayingCardVO payingCardVO, OrderVO orderVO, OrderListVO orderListVO, int payPrice, String orderListJsonArray) {
		ModelAndView mv = new ModelAndView();

		String address = orderVO.getToAddress();
		String addressEtc = orderVO.getToAddressEtc();

		String result = "";

		if (addressEtc != null) {
			result = address + " " + addressEtc;
		} else {
			result = address;
		}

		orderVO.setToAddress(result);

		mv.setViewName("order/PayingCardByBasket");
		mv.addObject("payingCard", payingCardVO);
		mv.addObject("order", orderVO);
		mv.addObject("orderList", orderListVO);
		mv.addObject("orderListJsonArray", orderListJsonArray);
		mv.addObject("payPrice", payPrice);

		return mv;
	}
	
	// 장바구니에서 누른 주문 페이지의 카드 결제 완료 및 주문 완료
	@RequestMapping("/orderCardResultByBasket")
	public ModelAndView orderResult(OrderVO orderVO, int payPrice, String orderListJsonArray) {
		ModelAndView mv = new ModelAndView();
		
		JSONArray orderListJsonListt = null;
		JSONParser parser = new JSONParser();
		try {
			orderListJsonListt = (JSONArray) parser.parse(orderListJsonArray);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		orderVO.setPayPrice(payPrice);

		orderVO.setState("결제 완료");
		orderVO.setPayCase("카드");
		orderVO.setTrackingNum("");

		orderService.insertOrder(orderVO);
		
		OrderVO order = new OrderVO();
		// 주문자 아이디 이용해서 오더정보 받아오고
		order = orderService.selectLatelyOrderNum(orderVO.getId());
		// 오더에 오더넘버 셋하고
		orderVO.setOrderNum(order.getOrderNum());

		Gson gson = new Gson();

		for (int i = 0; i < orderListJsonListt.size(); i++) {
			System.out.println(orderListJsonListt.get(i).toString());
			OrderListVO orderListVO = new OrderListVO();
			orderListVO = gson.fromJson(orderListJsonListt.get(i).toString(), OrderListVO.class);
			orderListVO.setOrderNum(orderVO.getOrderNum());
			System.out.println(orderListVO);
			int insertOrderResult = orderService.insertOrderList(orderListVO);
			int productNum = orderService.selectProductNumByOptionNum(orderListVO.getOptionNum());
			if (insertOrderResult > 0) {
				orderService.decrementStockOption(orderListVO);
				orderService.decrementStockProduct(orderListVO);
			}
		}

		int insertPayCardResult = orderService.insertPayCard(orderVO);

		mv.setViewName("order/OrderResult");

		return mv;
	}


}
