package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import service.ProductService;
import vo.AuthInfo;
import vo.BasketListVO;
import vo.BasketVO;
import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductVO;
import vo.SellerVO;

@Controller
public class ProductController {

	private ProductService productService;
	private MemberService memberService;

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
		System.out.println(productVO.getId());
		SellerVO sellerVO = memberService.searchSellerById(productVO.getId());
		System.out.println(sellerVO.getId());
		List<DetailOptionVO> detailOptionList = productService.selectDetailOption(productNum);
		System.out.println(detailOptionList.get(productNum));
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/Product");
		mv.addObject("product", productVO);
		mv.addObject("seller", sellerVO);
		mv.addObject("detailOptionList", detailOptionList);
		System.out.println(mv.toString());
		return mv;
	}

	// 장바구니 담기
	@ResponseBody
	@RequestMapping("/basketInsert")
	public int addBasket(OptionVO optionVO, HttpServletRequest req, @RequestParam int cnt) {
		int result = 0;
		HttpSession session = req.getSession();
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		int optionNum = productService.selectOptionNum(optionVO);
		System.out.println(optionNum);
		BasketVO basketVO = new BasketVO();
		if (authinfo != null) {
			basketVO.setId(authinfo.getId());
			basketVO.setOptionNum(optionNum);
			basketVO.setCnt(cnt);
			System.out.println(basketVO.toString());
			productService.insertBasket(basketVO);
			result = 1;
		}
		return result;
	}

	// 장바구니 목록보기
	@ResponseBody
	@RequestMapping("/basket")
	public ModelAndView getBasketList(String id, HttpServletRequest req) {
		HttpSession session = req.getSession();
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		session.getAttribute("authInfo");
		authinfo.getId();
		System.out.println(authinfo.getId() + "들어가?");
		List<BasketListVO> basketList = productService.selectBasketList(authinfo.getId());
		int productCnt = basketList.size();
		int a = 0;
		int c = 0;
		for (int i = 0; i < productCnt; i++) {
			int b = basketList.get(i).getProductPrice() * basketList.get(i).getCnt();
			int d = basketList.get(i).getDeliveryPrice();
			System.out.println(basketList.get(i).getStock());
			a += b;
			c += d;
		}
		System.out.println(basketList.toString());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/Basket");
		mv.addObject("basketList", basketList);
		mv.addObject("productCnt", productCnt);
		mv.addObject("totalPrice", a);
		mv.addObject("totalDeliveryPrice", c);
		System.out.println(mv.toString());
		return mv;
	}

	@RequestMapping("/updateBasketCnt")
	public String updateBasket(@RequestParam int cnt, @RequestParam int optionNum, HttpServletRequest req) {
		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		
			System.out.println(cnt);
			System.out.println(optionNum);
			System.out.println(authInfo.getId());
		
			BasketVO basket = new BasketVO();
			basket.setId(authInfo.getId());
			basket.setCnt(cnt);
			basket.setOptionNum(optionNum);
			productService.updateCnt(basket);
			System.out.println("등러감?");
		return "redirect:/basket";
	}

	// 장바구니 체크 정보

	@RequestMapping("/checkBoxBtn")
	@ResponseBody
	public Object selectCheckBox(HttpServletRequest req, @RequestParam(required = false) int[] basketNums) {
		HttpSession session = req.getSession();
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authinfo");
		session.getAttribute("authinfo");
//		HashMap<Integer, BasketListVO> basketSelect = productService.selectBasket(optionNum);\
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (basketNums != null) {
			System.out.println("널아님");
			List<BasketListVO> basketSelect = productService.selectBasket(basketNums);
			int productCnt = basketSelect.size();
			int a = 0;
			int c = 0;
			for (int i = 0; i < productCnt; i++) {
				int b = basketSelect.get(i).getProductPrice() * basketSelect.get(i).getCnt();
				int d = basketSelect.get(i).getDeliveryPrice();
				a += b;
				c += d;
			}
			map.put("totalPrice", a);
			map.put("basketSelect", basketSelect);
			map.put("totalDeliveryPrice", c);
		} else {
			map.put("totalPrice", 0);
			map.put("basketSelect", null);
			map.put("totalDeliveryPrice", 0);
		}
		return map;
	}
	
	//장바구니 선텍 삭제
	@ResponseBody
	@RequestMapping(value="/deleteBasket")
	public ModelAndView deleteBasket(@RequestParam int basketNum,HttpServletRequest req) {
		HttpSession session = req.getSession();
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authinfo");
		session.getAttribute("authinfo");
		int result = productService.deleteBasket(basketNum);
//		List<BasketListVO> basketList = productService.selectBasketList(authinfo.getId());
//		System.out.println(basketList.toString());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/basket");
		
		return mv;
	}

}
