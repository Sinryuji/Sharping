package controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

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
import com.google.gson.JsonArray;

import service.MemberService;
import service.OrderService;
import service.ProductService;
import vo.AuthInfo;
import vo.BankVO;
import vo.BasketListVO;
import vo.GuestVO;
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
		int result = 0;

		HttpSession session = req.getSession();

		if (session != null && session.getAttribute("authInfo") != null) {
			AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");


			payPrice += deliveryPrice;

			List<BankVO> bankVO = orderService.selectBankCodeList();

			int optionNum = productService.selectOptionNum(optionVO);
		OptionVO option = productService.selectOptionByOptionNum(optionNum);




		mv.setViewName("order/OrderPage");

			mv.setViewName("order/OrderPage");
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

			mv.addObject("authInfo", authInfo);

			return mv;
			// 비회원 주문
		} else {
			// 비회원 정보 생성 \or 비회원 임시id 발급
			payPrice += deliveryPrice;

			List<BankVO> bankVO = orderService.selectBankCodeList();

			int optionNum = productService.selectOptionNum(optionVO);

			OptionVO option = productService.selectOptionByOptionNum(optionNum);

			ProductVO product = productService.selectProduct(option.getProductNum());

			// 비회원 임시 아이디 '
			MemberVO member = new MemberVO();
			member.setId("비회원");

			GuestVO guest = new GuestVO();

			SellerVO seller = memberService.searchSellerById(product.getId());

			mv.setViewName("order/OrderPage");

			mv.addObject("optionNum", optionNum);

			mv.addObject("option", option);

			mv.addObject("product", product);

			mv.addObject("cnt", cnt);

			mv.addObject("payPrice", payPrice + deliveryPrice);

			mv.addObject("seller", seller);

			mv.addObject("member", member);
			// 비회원 임시 회원 정보
			// 결제시 회원정보 생성
			mv.addObject("guest", guest);

			mv.addObject("bankInfo", bankVO);
			mv.setViewName("order/OrderPage");
			return mv;
		}
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
			orderListJson.put("deliveryPrice", basketSelect.get(i).getDeliveryPrice());
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
			@RequestParam int bankCode, GuestVO guestVO, MemberVO memberVO) {
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("authInfo") != null) {
			AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
			orderVO.setState("입금 대기");
			orderVO.setPayCase("무통장 입금");
			orderVO.setTrackingNum("");
			orderVO.setTrackingCode("");

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
			virtualAccountVO.setPayNum(orderVO.getPayNum());
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
			// 비회원시 결제
		} else {

			System.out.println(memberVO.getId());
			System.out.println(guestVO.toString());
//			orderVO.setId(memberVO.getId());
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
			orderVO.setId("");
			System.out.println(orderVO.toString());
			// 주문 인설트하고
			orderService.insertOrder(orderVO);

			OrderVO order = new OrderVO();
			// 주문자 아이디 이용해서 오더정보 받아오고
			order = orderService.selectTonameOrderNum(orderVO.getToName());
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
			// 비회원 인설트
			guestVO.setOrderNum(order.getOrderNum());
			orderService.insertGuest(guestVO);

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
			virtualAccountVO.setPayNum(orderVO.getPayNum());
			virtualAccountVO.setBankCode(bankCode);
			virtualAccountVO.setPayPrice(orderVO.getPayPrice());
			virtualAccountVO.setRespCode("NO");
			// 입금 마감일자 구현해야해야
//				virtualAccountVO.setDepositDate(depositDate);
//				그걸로 가상계좌 인설트 하고 
			orderService.insertByvirtualAccount(virtualAccountVO);
//				무통장 입금이 가상계좌랑 주문번호 셀렉트 해와서 
			PayBankVO payBankVO = new PayBankVO();
			payBankVO = orderService.selectVirtualAccountByorderNum(orderVO.getOrderNum());
//				payBankVO.setOrderNum(payBankVO.getOrderNum());
//				payBankVO.setBankCode(payBankVO.getBankCode());
//				payBankVO.setVaNum(payBankVO.getVaNum());

//				무통장입금을 인설트 한다. 
			System.out.println(orderVO);
			System.out.println(payBankVO);
			orderService.insertPayBank(payBankVO);
//				무통장 입금 셀렉트 해와서 
			payBankVO = orderService.selectPayBank(orderVO.getOrderNum());
//				모델에 담아주면 끄읕

			ModelAndView mv = new ModelAndView();
			mv.setViewName("order/OrderResult");
			mv.addObject("payBank", payBankVO);

			return mv;
		}
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

		

		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		orderVO.setState("입금 대기");
		orderVO.setPayCase("무통장 입금");
		orderVO.setTrackingNum("");
		orderVO.setTrackingCode("");

//		// 주문 인설트하고
		orderVO.setId(authInfo.getId());
		int payNum = new Random().nextInt(900000) + 100000;
		
//		orderService.insertOrder(orderVO);
//
//		OrderVO order = new OrderVO();
//		// 주문자 아이디 이용해서 오더정보 받아오고
//		order = orderService.selectLatelyOrderNum(orderVO.getId());
//		// 오더에 오더넘버 셋하고
//		orderVO.setOrderNum(order.getOrderNum());

		Gson gson = new Gson();
		
		orderVO.setPayNum(payNum);
		
		OrderVO order = null;

		for (int i = 0; i < orderListJsonListt.size(); i++) {
			OrderListVO orderListVO = new OrderListVO();
			orderListVO = gson.fromJson(orderListJsonListt.get(i).toString(), OrderListVO.class);
			OptionVO option = productService.selectOptionByOptionNum(orderListVO.getOptionNum());
			ProductVO product = productService.selectProduct(option.getProductNum());
			
			int orderPrice = orderListVO.getCnt() * orderListVO.getProductPrice() + product.getDeliveryPrice();
			// 주문 인설트하고
			orderVO.setPayPrice(orderPrice);
			orderService.insertOrder(orderVO);
			

			order = new OrderVO();
			// 주문자 아이디 이용해서 오더정보 받아오고
			order = orderService.selectLatelyOrderNum(orderVO.getId());
			// 오더에 오더넘버 셋하고
			orderVO.setOrderNum(order.getOrderNum());
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
		virtualAccountVO.setPayNum(orderVO.getPayNum());
		virtualAccountVO.setBankCode(bankCode);
		virtualAccountVO.setPayPrice(payPrice);
		virtualAccountVO.setRespCode("NO");
		// 입금 마감일자 구현해야해야
//		virtualAccountVO.setDepositDate(depositDate);
//		그걸로 가상계좌 인설트 하고 
		orderService.insertByvirtualAccount(virtualAccountVO);
//		무통장 입금이 가상계좌랑 주문번호 셀렉트 해와서 
		PayBankVO payBankVO = new PayBankVO();
		System.out.println("orerVO : " + orderVO);
		payBankVO = orderService.selectVirtualAccountByorderNum(orderVO.getPayNum());
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
	public ModelAndView insertMoney(int payNum) {

		ModelAndView mv = new ModelAndView();
		List<BankVO> bankVO = orderService.selectBankCodeList();
		mv.setViewName("order/InsertMoney");
		mv.addObject("bankInfo", bankVO);
		mv.addObject("payNum", payNum);
		return mv;
	}

	// 입금
	@RequestMapping("/payMoney")
	public ModelAndView pay(@RequestParam int payPrice, @RequestParam int bankCode, @RequestParam String vaNum, int payNum) {

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
			orderService.updatePaydateByPaybank(vaNum);
			orderService.updateStateByOrder(payNum);
		} else {
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("order/InsertMoney");
		return mv;
	}

	// 상품페이지에서 누룬 주문페이지의 카드 결제 팝업 창
	@RequestMapping("/payingCard")
	public ModelAndView payingCard(PayingCardVO payingCardVO, OrderVO orderVO, OrderListVO orderListVO, int payPrice,
			GuestVO guestVO) {
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
		System.out.println(guestVO.toString() + "paingcard");
		mv.setViewName("order/PayingCard");
		mv.addObject("guest", guestVO);
		mv.addObject("payingCard", payingCardVO);
		mv.addObject("order", orderVO);
		mv.addObject("orderList", orderListVO);
		mv.addObject("payPrice", payPrice);

		return mv;
	}

	// 상품페이지에서 누른 주문 페이지의 카드 결제 완료 및 주문 완료
	@RequestMapping("/orderCardResult")
	public ModelAndView orderResult(HttpServletRequest req, OrderVO orderVO, OrderListVO orderListVO, GuestVO guestVO) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("authInfo") != null) {
			orderVO.setState("결제 완료");
			orderVO.setPayCase("카드");
			orderVO.setTrackingNum("");
			orderVO.setTrackingCode("");
			orderService.insertOrder(orderVO);

			OrderVO order = new OrderVO();

			order = orderService.selectLatelyOrderNum(orderVO.getId());

			orderVO.setOrderNum(order.getOrderNum());

			orderListVO.setOrderNum(order.getOrderNum());

			int insertPayCardResult = orderService.insertPayCard(orderVO);

			int insertOrderResult = orderService.insertOrderList(orderListVO);

			int productNum = orderService.selectProductNumByOptionNum(orderListVO.getOptionNum());

			orderListVO.setProductNum(productNum);

			if (insertPayCardResult > 0) {
				orderService.decrementStockProduct(orderListVO);
			}

			if (insertOrderResult > 0) {
				orderService.decrementStockOption(orderListVO);
			}


			return mv;
		} else {

			orderVO.setState("결제 완료");
			orderVO.setPayCase("카드");
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
			orderVO.setId("");
			System.out.println(orderVO.toString());
			// 주문 인설트하고
			orderService.insertOrder(orderVO);

			OrderVO order = new OrderVO();
			// 주문자 아이디 이용해서 오더정보 받아오고
			order = orderService.selectTonameOrderNum(orderVO.getToName());
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
			// 주문번호 셀렉트
			orderVO = orderService.selectOrderByorderNum(order.getOrderNum());
			// 비회원 인설트
			System.out.println(guestVO.toString());
			guestVO.setOrderNum(order.getOrderNum());
			orderService.insertGuest(guestVO);

			mv.setViewName("order/OrderResult");
			return mv;
		}

	}

	// 장바구니에서 누른 주문페이지의 카드 결제 팝업 창
	@RequestMapping("/payingCardByBasket")
	public ModelAndView payingCardByBasket(PayingCardVO payingCardVO, OrderVO orderVO, OrderListVO orderListVO,
			int payPrice, String orderListJsonArray) {
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
		orderVO.setTrackingCode("");
		
		int payNum = new Random().nextInt(900000) + 100000;
		

//		orderService.insertOrder(orderVO);
		
		OrderVO order = null;
//		// 주문자 아이디 이용해서 오더정보 받아오고
//		order = orderService.selectLatelyOrderNum(orderVO.getId());
//		// 오더에 오더넘버 셋하고
//		orderVO.setOrderNum(order.getOrderNum());

		Gson gson = new Gson();
		orderVO.setPayNum(payNum);

		for (int i = 0; i < orderListJsonListt.size(); i++) {
			OrderListVO orderListVO = new OrderListVO();
			orderListVO = gson.fromJson(orderListJsonListt.get(i).toString(), OrderListVO.class);
			OptionVO option = productService.selectOptionByOptionNum(orderListVO.getOptionNum());
			ProductVO product = productService.selectProduct(option.getProductNum());
			
			int orderPrice = orderListVO.getCnt() * orderListVO.getProductPrice() + product.getDeliveryPrice();
			
			orderVO.setPayNum(payNum);
			
			orderService.insertOrder(orderVO);
			
			
			order = new OrderVO();
			// 주문자 아이디 이용해서 오더정보 받아오고
			order = orderService.selectLatelyOrderNum(orderVO.getId());
			// 오더에 오더넘버 셋하고
			orderVO.setOrderNum(order.getOrderNum());
			System.out.println(orderListJsonListt.get(i).toString());
			
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
	
	// 주문 취소
	@RequestMapping(value = "/orderCancle")
	public ModelAndView orderCancle(int orderNum) {
		ModelAndView mv = new ModelAndView();
		
		List<OrderListVO> orderList = orderService.selectOrderListByOrderNum(orderNum);
		OptionVO option = productService.selectOptionByOptionNum(orderList.get(0).getOptionNum());
		ProductVO product = productService.selectProduct(option.getProductNum());
		OrderVO order = orderService.selectOrderByorderNum(orderList.get(0).getOrderNum());
		SellerVO seller = memberService.searchSellerById(product.getId());
		
		
		mv.setViewName("order/OrderCancle");
		mv.addObject("orderList", orderList.get(0));
		mv.addObject("product", product);
		mv.addObject("order", order);
		mv.addObject("seller", seller);
		
		return mv;
	}
	
	// 주문 취소 안료
	@RequestMapping(value = "/orderCancleComplete")
	public ModelAndView orderCancleComplete(int orderNum) {
		ModelAndView mv = new ModelAndView();
		
		
		List<OrderListVO> orderList = orderService.selectOrderListByOrderNum(orderNum);
		OptionVO option = productService.selectOptionByOptionNum(orderList.get(0).getOptionNum());
		ProductVO product = productService.selectProduct(option.getProductNum());
		OrderVO order = orderService.selectOrderByorderNum(orderList.get(0).getOrderNum());
		SellerVO seller = memberService.searchSellerById(product.getId());
		int result = orderService.updateOrderByOrderNum(order.getOrderNum());
		PayBankVO payBank = orderService.selectPayBank(order.getPayNum());
		VirtualAccountVO virtualAccount = new VirtualAccountVO();
		virtualAccount.setVaNum(payBank.getVaNum());
		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<OrderVO> orders = orderService.selectOrderByPayNum(order.getPayNum());
		System.out.println(orders.size());
		int payPrice = 0;
		for(int i = 0 ; i < orders.size() ; i++) {
			payPrice += orders.get(i).getPayPrice();
		}
		virtualAccount.setPayPrice(payPrice);
		
		orderService.updatePayPriceVirtualAccount(virtualAccount);

		
		mv.setViewName("order/OrderCancleComplete");
		mv.addObject("result", result);
		mv.addObject("orderList", orderList.get(0));
		mv.addObject("product", product);
		mv.addObject("order", order);
		mv.addObject("seller", seller);
		
		return mv;
	}
	
	// 비회원 주문 조회
	@RequestMapping("/selectGuest")
	public ModelAndView selectGuest(@RequestParam String guestName, @RequestParam String guestPhone,
			@RequestParam String guestPassword) {
		GuestVO guest = new GuestVO();
		guest.setGuestName(guestName);
		guest.setGuestPassword(guestPassword);
		guest.setGuestPhone(guestPhone);
		List<GuestVO> guestVO = orderService.selectOrderByGuest(guest);
		int orderNum = guestVO.size();
		int[] orderNums = new int[orderNum];
		for (int i = 0; i < orderNum; i++) {
			orderNums[i] = guestVO.get(i).getOrderNum();
			System.out.println(orderNums[i]);
		}
		List<OrderListVO> orderList = orderService.selectOrderListByorderNum(orderNums);
		List<VirtualAccountVO> virt = orderService.selectVirtualAccountVO(orderNums);
		List<OrderVO> order = orderService.selectOrderByorderNums(orderNums);
		List<Integer> payBank = orderService.selectPayBankByOrderNum(orderNums);
		List<Integer> payCard = orderService.selectPayCardByOrderNum(orderNums);
		ModelAndView mv = new ModelAndView();
		JSONArray orderListBankJson = new JSONArray();
		JSONArray orderListCardJson = new JSONArray();
		JSONObject totalJson = new JSONObject();
		List<BankVO> bankName = new ArrayList<BankVO>();
		for (int i = 0; i < virt.size(); i++) {
			BankVO bank = new BankVO();
			bank = orderService.selectBankName(virt.get(i).getBankCode());
			bankName.add(bank);
		}

		int a = 0;

		for (int i = 0; i < payBank.size(); i++) {
			System.out.println(payBank.size());
			JSONObject orderJsonbank = new JSONObject();
			orderJsonbank.put("vaNum", virt.get(i).getVaNum());
			orderJsonbank.put("bankName", bankName.get(i).getBankName());
			orderJsonbank.put("depositDate", virt.get(i).getDepositDate());
			orderJsonbank.put("payPrice", order.get(i).getPayPrice());
			orderJsonbank.put("orderDate", order.get(i).getOrderDate());
			orderJsonbank.put("productName", orderList.get(i).getProductName());
			orderJsonbank.put("optionOneNum", orderList.get(i).getOptionOneNum());
			orderJsonbank.put("optionTwoNum", orderList.get(i).getOptionTwoNum());
			orderJsonbank.put("optionThreeNum", orderList.get(i).getOptionThreeNum());
			orderJsonbank.put("orderNum", order.get(i).getOrderNum());
			orderJsonbank.put("state", order.get(i).getState());
			orderJsonbank.put("payCase", order.get(i).getPayCase());
			orderListBankJson.add(orderJsonbank);
			a++;
		}
		for (int i = a; i < payCard.size() + a; i++) {
			JSONObject orderJsonCard = new JSONObject();
			orderJsonCard.put("payPrice", order.get(i).getPayPrice());
			orderJsonCard.put("orderDate", order.get(i).getOrderDate());
			orderJsonCard.put("productName", orderList.get(i).getProductName());
			orderJsonCard.put("optionOneNum", orderList.get(i).getOptionOneNum());
			orderJsonCard.put("optionTwoNum", orderList.get(i).getOptionTwoNum());
			orderJsonCard.put("optionThreeNum", orderList.get(i).getOptionThreeNum());
			orderJsonCard.put("orderNum", order.get(i).getOrderNum());
			orderJsonCard.put("state", order.get(i).getState());
			orderJsonCard.put("payCase", order.get(i).getPayCase());
			orderListCardJson.add(orderJsonCard);

		}

		mv.setViewName("mypage/GuestMyPage");
		mv.addObject("orderListCardJson", orderListCardJson);
		mv.addObject("orderListBankJson", orderListBankJson);
		return mv;

	}

}
