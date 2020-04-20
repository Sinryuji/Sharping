package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.coobird.thumbnailator.Thumbnails;
import service.AdminService;
import service.MemberService;
import service.OrderService;
import service.ProductService;
import vo.AuthInfo;
import vo.BasketListVO;
import vo.BasketVO;
import vo.CategoryVO;
import vo.DeclProductVO;
import vo.DetailOptionVO;
import vo.MemberVO;
import vo.OptionVO;
import vo.OrderListVO;
import vo.OrderProductVO;
import vo.OrderVO;
import vo.ProductVO;
import vo.ReviewVO;
import vo.SearchVO;
import vo.SellerVO;
import vo.WishListVO;

@Controller
public class ProductController {

	private ProductService productService;
	private MemberService memberService;
	private AdminService adminService;
	private OrderService orderService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@Resource(name = "ThumUploadPath")
	private String ThumUploadPath;

	public ProductController() {
		super();
	}

	public ProductController(ProductService productService, MemberService memberService) {
		super();
		this.productService = productService;
		this.memberService = memberService;
	}
	
	
	
	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
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

	// 상품 업로드 완료
	@RequestMapping(value = "/uploadCompleteProduct")
//	public String uploadCompleteProduct(@Valid ProductVO productVO , MultipartFile file) {
	public String uploadCompleteProduct(MultipartHttpServletRequest mtfRequest) {
		ProductVO productVO = new ProductVO();
		


		String uploadPath = "d:\\dev\\opload\\";
		String ThumUploadPath = "d:\\dev\\opload\\thum";
		File dir = new File(uploadPath);
		if (!dir.exists()) {
			dir.mkdir();
		}
		UUID uid = UUID.randomUUID();
		MultipartFile mf = mtfRequest.getFile("productImage");
		MultipartFile mft = mtfRequest.getFile("productThumb");
		System.out.println("\n\nㅎㅇ\n\n");
		String fileName = mf.getOriginalFilename();
		System.out.println("\n\nㅎㅇ\n\n");
		String saveName = uid.toString() + "_" + fileName;
		File target = new File(uploadPath, saveName);
		String thumFileName = mft.getOriginalFilename();
		String thumSaveName = uid.toString() + "_" + thumFileName;
		String thumbFileName = "s_" + thumSaveName;
		File Thum = new File(ThumUploadPath, thumSaveName);
		File thumbnail = new File(ThumUploadPath, thumbFileName);
		try {
			FileCopyUtils.copy(mf.getBytes(), target);
			if(target.exists()) {
				thumbnail.getParentFile().mkdirs();
			}
			FileCopyUtils.copy(mft.getBytes(), thumbnail);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int THUMB_WIDTH = 300;
		int THUMB_HEIGHT = 300;

		

			try {
				Thumbnails.of(Thum).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
				if (thumbnail.exists()) {
					Thum.delete();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		productVO.setId(mtfRequest.getParameter("id"));
		productVO.setCategoryNum(Integer.parseInt(mtfRequest.getParameter("categoryNum")));
		productVO.setProductName(mtfRequest.getParameter("productName"));
		productVO.setStock(Integer.parseInt(mtfRequest.getParameter("stock")));
		productVO.setProductPrice(Integer.parseInt(mtfRequest.getParameter("productPrice")));
		productVO.setProductImage(File.separator + "opload" + File.separator + saveName);
		productVO.setProductText(mtfRequest.getParameter("productText"));

		if (mtfRequest.getParameter("productDisplay") == null) {
			productVO.setProductDisplay("FALSE");
		} else {
			productVO.setProductDisplay(mtfRequest.getParameter("productDisplay"));
		}

		productVO.setProductThumb(File.separator + "opload" + File.separator + "thum" + File.separator + thumbFileName);

		if (mtfRequest.getParameter("productMeterial") == null) {
			productVO.setProductMeterial("-");
		} else {
			productVO.setProductMeterial(mtfRequest.getParameter("productMeterial"));
		}

		if (mtfRequest.getParameter("manufacturer") == null) {
			productVO.setManufacturer("-");
		} else {
			productVO.setManufacturer(mtfRequest.getParameter("manufacturer"));
		}

		if (mtfRequest.getParameter("origin") == null) {
			productVO.setOrigin("-");
		} else {
			productVO.setOrigin(mtfRequest.getParameter("origin"));
		}

		if (mtfRequest.getParameter("deliveryPrice").equals("")) {
			productVO.setDeliveryPrice(0);
		} else {
			productVO.setDeliveryPrice(Integer.parseInt(mtfRequest.getParameter("deliveryPrice")));
		}
		productVO.setOptionOneName(mtfRequest.getParameter("optionOneName"));
		productVO.setOptionTwoName(mtfRequest.getParameter("optionTwoName"));
		productVO.setOptionThreeName(mtfRequest.getParameter("optionThreeName"));

		String d = mtfRequest.getParameter("mfDate");
		
		productVO.setProductSale("YES");
		

		if (mtfRequest.getParameter("hidden").equals("n")) {
			productService.uploadProductDateIsNull(productVO);
		} else {
			productVO.setMfDate(Date.valueOf(d));
			productService.uploadProduct(productVO);
		}
		
		if(mtfRequest.getParameter("optionOneName").equals("") && mtfRequest.getParameter("optionTwoName").equals("") && mtfRequest.getParameter("optionThreeName").equals("")) {
			System.out.println("우아아아아아아아아아아아아아아아아아앙!");
			int latelyProductNum = productService.selectLatelyProductNum(mtfRequest.getParameter("id"));
			ProductVO latelyProduct = productService.selectProduct(latelyProductNum);
			productService.insertOption(new OptionVO(latelyProduct.getProductNum(), latelyProduct.getStock(), 0, 0, 0));
		}

		
		return "redirect:/productManage?page=1";
	}
 
	
	// 상품 페이지
	@RequestMapping("/product")
	public ModelAndView product(int productNum, HttpServletResponse resp, HttpServletRequest req) {
		Cookie cookie = null;
		try {
			cookie = new Cookie("latelyViewProduct"+productNum, URLEncoder.encode(String.valueOf(productNum), "UTF-8"));
			cookie.setMaxAge(60 * 60 * 72);
			System.out.println(URLEncoder.encode(String.valueOf(productNum), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		resp.addCookie(cookie);
		
		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		
		WishListVO wishListVO = new WishListVO();
		
		int result = 0;
		
		if(authInfo != null) {
			wishListVO.setId(authInfo.getId());
			wishListVO.setProductNum(productNum);
			
			List<WishListVO> list = memberService.selectWishListByIdProductNum(wishListVO);
			if(list != null) {
				result = list.size();
			}
		}
		int sum = 0;
		int all = 0;
		List<ReviewVO> reviewList = productService.selectReviewByProductNum(productNum);
		if(reviewList != null) {
			for(int i = 0 ; i < reviewList.size() ; i++) {
				sum += reviewList.get(i).getScore();
			}
			all = reviewList.size();
		}
	
		ProductVO productVO = productService.selectProduct(productNum);
		SellerVO sellerVO = memberService.searchSellerById(productVO.getId());

		List<DetailOptionVO> detailOptionList = productService.selectDetailOption(productNum);
		
		List<OptionVO> optionList = productService.selectOptionByProduct(productNum);
		
		ProductVO product = productService.selectProduct(productNum);

		int maxOptionLevel = 0;
		
		if(product.getOptionOneName() != null) {
			if(!product.getOptionOneName().equals("")) {
				maxOptionLevel++;
				if(product.getOptionTwoName() != null) {
					if(!product.getOptionTwoName().equals("")) {
						maxOptionLevel++;
						if(product.getOptionThreeName() != null) {
							if(!product.getOptionThreeName().equals("")) {
								maxOptionLevel++;
							}
						}
					}
				}
			}
		}
//		if (detailOptionList.size() != 0) {
//			maxOptionLevel = productService.selectOptionLevelMaxByProductNum(productNum);
//
//		} else if (detailOptionList.size() == 0) {
//			if(optionList.size() != 0) {
//				maxOptionLevel = 0;
//			}
//		}

		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/Product");
		mv.addObject("product", productVO);
		mv.addObject("seller", sellerVO);
		mv.addObject("detailOptionList", detailOptionList);

		mv.addObject("maxOptionLevel", maxOptionLevel);
		
		mv.addObject("result", result);
		
		mv.addObject("reviewList", reviewList);
		
		mv.addObject("sum", sum);
		mv.addObject("all", all);

		return mv;
	}

	// 상품 업로드 페이지
	@RequestMapping("/uploadProduct")
	public ModelAndView uploadProduct() {
		ModelAndView mv = new ModelAndView();
		
		List<CategoryVO> categorys = adminService.selectCategoryByCategoryDepth(1);

		mv.setViewName("seller/UploadProduct");
		
		mv.addObject("cetegorys", categorys);

		return mv;
	}
	
	// 카테고리 선택
		@RequestMapping("/selectCategory")
		@ResponseBody
		public List<CategoryVO> selectCategory(int categoryNum) {
			
			System.out.println("@@@@@@@@@@@@@@@@");
			
			System.out.println(categoryNum);

			List<CategoryVO> categorys = adminService.selectCategoryByPcNum(categoryNum);
			
			System.out.println(categorys);

			return categorys;
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
	public ModelAndView productManage(HttpServletRequest req, int page) {

		HttpSession session = req.getSession();

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");

		ProductVO productVO = new ProductVO();
		productVO.setId(authInfo.getId());
		
		List<ProductVO> productList = productService.productListById(authInfo.getId());
		
		int totCnt = productList.size();
		
		if(page == 1) {
			productVO.setStartNum(1);
			productVO.setEndNum(20);
		} else {
			productVO.setStartNum(page+(19*(page-1)));
			productVO.setEndNum(page*20);
			if(productVO.getEndNum() < totCnt) {
				productVO.setEndNum(totCnt);
			}
		}
		
		List<ProductVO> productList2 = productService.selectProductByIdPaging(productVO);
		System.out.println(productList2);

		JSONArray productListt = new JSONArray();
		
		for(int i = 0 ; i < productList2.size() ; i++) {
			if(productList2.get(i).getProductSale().equals("YES")) {
			JSONObject product = new JSONObject();
			product.put("productNum", productList2.get(i).getProductNum());
			product.put("productThumb", productList2.get(i).getProductThumb());
			product.put("productName", productList2.get(i).getProductName());
			product.put("productPrice", productList2.get(i).getProductPrice());
			product.put("deliveryPrice", productList2.get(i).getDeliveryPrice());
			product.put("productDisplay", productList2.get(i).getProductDisplay());
			List<OptionVO> options = productService.selectOptionByProduct(productList2.get(i).getProductNum());
			int[] optionNums = new int[options.size()];
			int count = 0;
			int sales = 0;
			for(int j = 0 ; j < options.size() ; j++) {
				optionNums[j] = options.get(j).getOptionNum();
			}
			if(optionNums.length > 0) {
			List<OrderListVO> list = orderService.selectBuyCount(optionNums);
			for(int k = 0 ; k < list.size() ; k++) {
				OrderVO order = orderService.selectOrderByorderNum(list.get(k).getOrderNum());
				if(order.getState().equals("구매 확정")) {
					count++;
					sales += order.getPayPrice();
				}
			}
			}
			product.put("buyCount", count);
			product.put("sales", sales);
			productListt.add(product);
		}
		}

		ModelAndView mv = new ModelAndView();

		mv.setViewName("seller/ProductManage");
		mv.addObject("productList", productListt);
		mv.addObject("totCnt", totCnt);
		mv.addObject("startNum", productVO.getStartNum());

		return mv;
	}
	
	// 상품 관리 탭 스크롤
		@RequestMapping("/productManageScroll")
		@ResponseBody
		public Map<String, Object> productManageScroll(HttpServletRequest req, int page) {

			HttpSession session = req.getSession();

			AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
			
			ProductVO productVO = new ProductVO();
			productVO.setId(authInfo.getId());
			
			List<ProductVO> productList = productService.productListById(authInfo.getId());
			
			int totCnt = productList.size();
			
			if(page == 1) {
				productVO.setStartNum(1);
				productVO.setEndNum(20);
			} else {
				productVO.setStartNum(page+(19*(page-1)));
				productVO.setEndNum(page*20);
				if(productVO.getEndNum() < totCnt) {
					productVO.setEndNum(totCnt);
				}
			}
			
			List<ProductVO> productList2 = productService.selectProductByIdPaging(productVO);

			JSONArray productListt = new JSONArray();
			
			for(int i = 0 ; i < productList2.size() ; i++) {
				if(productList2.get(i).getProductSale().equals("YES")) {
				JSONObject product = new JSONObject();
				product.put("productNum", productList2.get(i).getProductNum());
				product.put("productThumb", productList2.get(i).getProductThumb());
				product.put("productName", productList2.get(i).getProductName());
				product.put("productPrice", productList2.get(i).getProductPrice());
				product.put("deliveryPrice", productList2.get(i).getDeliveryPrice());
				product.put("productDisplay", productList2.get(i).getProductDisplay());
				List<OptionVO> options = productService.selectOptionByProduct(productList2.get(i).getProductNum());
				int[] optionNums = new int[options.size()];
				int count = 0;
				int sales = 0;
				for(int j = 0 ; j < options.size() ; j++) {
					optionNums[j] = options.get(j).getOptionNum();
				}
				if(optionNums.length > 0) {
				List<OrderListVO> list = orderService.selectBuyCount(optionNums);
				for(int k = 0 ; k < list.size() ; k++) {
					OrderVO order = orderService.selectOrderByorderNum(list.get(k).getOrderNum());
					if(order.getState().equals("구매 확정")) {
						count++;
						sales += order.getPayPrice();
					}
				}
				}
				product.put("buyCount", count);
				System.out.println(sales);
				product.put("sales", sales);
				productListt.add(product);
			}
			}

			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("productList", productListt);
			map.put("totCnt", totCnt);
			map.put("startNum", productVO.getStartNum());

			return map;
		}

	// 상품 관리 탭 (진열여부)
	@RequestMapping("/updateProductDisplay")
	@ResponseBody
	public String updateProductDisplay(@RequestParam int productNum, @RequestParam String productDisplay) {
		ProductVO productVO = new ProductVO();

		productVO.setProductNum(productNum);
		productVO.setProductDisplay(productDisplay);
		productService.updateProductDisplayByProductNum(productVO);

		return "complete";
	}

	// 상품 관리 탭 상품 선택 삭제
	@RequestMapping(value = "deleteSelectProductByProductNum")
	@ResponseBody
	public ModelAndView deleteSelectProductByProductNum(HttpServletRequest req,
			@RequestParam(value = "chk[]") List<String> selArr, ProductVO productVO) {
		HttpSession session = req.getSession();

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");

		int productNum = 0;

		if (authInfo != null) {
			for (String i : selArr) {
				productNum = Integer.parseInt(i);
				productVO.setProductNum(productNum);
				productService.deleteProductByProductNum(productVO);
			}
		}
		ModelAndView mv = new ModelAndView();

		List<ProductVO> productList = productService.productListById(authInfo.getId());

		mv.setViewName("seller/ProductManage");

		mv.addObject("productList", productList);

		return mv;
	}

	// 주문 관리 탭
	@RequestMapping("/orderManage")
	public ModelAndView orderManage(HttpServletRequest req, String id, @RequestParam(required=false) String search, @RequestParam(required=false) String dSearch, int page) {

		HttpSession session = req.getSession();

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");

		id = authInfo.getId();
		
		OrderProductVO orderProduct = new OrderProductVO();
		
		orderProduct.setId(id);
		orderProduct.setSearch(search);
		orderProduct.setState(dSearch);
		
		List<OrderProductVO> orderList2 = productService.selectOrderBySellerIdTotal(orderProduct);
		int totCnt = orderList2.size();
		
		
		
		if(page == 1) {
			orderProduct.setStartNum(1);
			orderProduct.setEndNum(20);
		} else {
			orderProduct.setStartNum(page+(19*(page-1)));
			orderProduct.setEndNum(page*20);
			if(orderProduct.getEndNum() < totCnt) {
				orderProduct.setEndNum(totCnt);
			}
		}
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@" + orderProduct);
		
		List<OrderProductVO> orderList1 = productService.selectOrderBySellerId(orderProduct);
		
		System.out.println(orderList1);

		ModelAndView mv = new ModelAndView();

		mv.setViewName("seller/OrderManage");

		mv.addObject("orderList", orderList1);
		
		mv.addObject("currentState", dSearch);
		
		mv.addObject("search", search);
		
		mv.addObject("totCnt", totCnt);
		
		mv.addObject("startNum", orderProduct.getStartNum());

		return mv;
	}
	
	// 주문 관리 탭 스크롤
		@RequestMapping("/orderManageScroll")
		@ResponseBody
		public Map<String, Object> orderManageScroll(HttpServletRequest req, String id, @RequestParam(required=false) String search, @RequestParam(required=false) String dSearch, int page) {

			HttpSession session = req.getSession();

			AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");

			id = authInfo.getId();
			
			OrderProductVO orderProduct = new OrderProductVO();
			
			orderProduct.setId(id);
			orderProduct.setSearch(search);
			orderProduct.setState(dSearch);
			
			List<OrderProductVO> orderList2 = productService.selectOrderBySellerIdTotal(orderProduct);
			int totCnt = orderList2.size();
			
			
			
			if(page == 1) {
				orderProduct.setStartNum(1);
				orderProduct.setEndNum(20);
			} else {
				orderProduct.setStartNum(page+(19*(page-1)));
				orderProduct.setEndNum(page*20);
				if(orderProduct.getEndNum() < totCnt) {
					orderProduct.setEndNum(totCnt);
				}
			}
			
			List<OrderProductVO> orderList1 = productService.selectOrderBySellerId(orderProduct);

			Map<String, Object> map = new HashMap<String, Object>();


		    map.put("orderList", orderList1);
			
		    map.put("currentState", dSearch);
			
		    map.put("search", search);
		    
		    map.put("totCnt", totCnt);
		    
		    map.put("startNum", orderProduct.getStartNum());

			return map;
		}

	// 구매자 정보 조회
	@RequestMapping("/buyerInfo")
	public ModelAndView buyerInfo(String id) {

		MemberVO memberVO = memberService.searchMemberById(id);

		ModelAndView mv = new ModelAndView();

		mv.setViewName("seller/BuyerInfoDetail");

		mv.addObject("member", memberVO);

		return mv;
	}

	// 배송 정보 조회
	@RequestMapping(value = "/selectDeliveryInfoById")
	@ResponseBody
	public Map<String, Object> selectDeliveryInfoById(@RequestParam String id, int orderNum) {

		OrderVO order = new OrderVO();
		
		OrderVO orderVO = new OrderVO();
		
		orderVO.setId(id);
		orderVO.setOrderNum(orderNum);

		order = productService.selectDeliveryInfoById(orderVO);

		ModelAndView mv = new ModelAndView();

		mv.setViewName("seller/DeliveryInfo");

		mv.addObject("order", order);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("order", order);

		return map;
	}

	// 배송정보
	@RequestMapping("/deliveryInfo")
	public String deliveryInfo() {
		return "seller/DeliveryInfo";
	}

	// 장바구니 담기
	@ResponseBody
	@RequestMapping("/basketInsert")
	public int addBasket( OptionVO optionVO, HttpServletRequest req, @RequestParam int cnt) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		HttpSession session = req.getSession();
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		
		System.out.println(optionVO);
		
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
		System.out.println(basketList + "머야머야");

//		JSONObject TotalstoreNameJson = new JSONObject(); 			
//		JSONArray storeNameListJsonArray = new JSONArray();
		int a = 0;
		int c = 0;

		int[] optionNums = new int[productCnt];
		String storeName = null;
		for (int i = 0; i < productCnt; i++) {
			JSONObject storeNameListJson = new JSONObject();
			int b = basketList.get(i).getProductPrice() * basketList.get(i).getCnt();
			int d = basketList.get(i).getDeliveryPrice();
			optionNums[i] = basketList.get(i).getOptionNum();

//			storeNameListJson.put("storeName", basketList.get(i).getstoreName()); 
//			storeNameListJsonArray.add(storeNameListJson);
			a += b;
			c += d;
		}
		System.out.println(basketList + "머지머지");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/Basket");
		mv.addObject("basketList", basketList);
		mv.addObject("productCnt", productCnt);
		mv.addObject("totalPrice", a);
		mv.addObject("totalDeliveryPrice", c);
		mv.addObject("optionNums", optionNums);
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

			System.out.println(basketSelect.toString());
//			int[] optionNum = productService.selectOptionByBasketNum(basketNums);
//			System.out.println(optionNum+"?????"); 
//			List<OptionVO> optionVO = productService.selectOptionBybasketNums(optionNum);
			int productCnt = basketSelect.size();
			System.out.println(productCnt);
			int[] optionNums = new int[productCnt];
			int a = 0;
			int c = 0;
			for (int i = 0; i < productCnt; i++) {
				int b = basketSelect.get(i).getProductPrice() * basketSelect.get(i).getCnt();
				int d = basketSelect.get(i).getDeliveryPrice();
				optionNums[i] = basketSelect.get(i).getOptionNum();
				System.out.println(basketSelect.get(i).getOptionNum());
//				int[] optionNum = basketSelect.get(i).getOptionNum(); 
//				String li = (String) map.get("list");

				a += b;
				c += d;
			}
//			map.put("option", optionVO);
			map.put("totalPrice", a);
			map.put("basketSelect", basketSelect);
			map.put("totalDeliveryPrice", c);
			map.put("optionNums", optionNums);
		} else {
			map.put("optionNums", null);
			map.put("totalPrice", 0);
			map.put("basketSelect", null);
			map.put("totalDeliveryPrice", 0);
		}
		return map;
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

	// 상품 검색 페이지
	@RequestMapping(value = "/searchProduct")
	public String SearchProduct() {
		return "MainPage";
	}

	// 상품 리스트 페이지
	@RequestMapping(value = "/productList")
	public String getProductList(Model model,
			@RequestParam(required = false, defaultValue = "productName") String searchType,
			@RequestParam(required = false) String keyword, @RequestParam(required = false) String keyword2,
			@RequestParam(required = false) String minPrice, @RequestParam(required = false) String maxPrice,
			@RequestParam(required = false) String checkDelivery,
			@RequestParam(required = false, defaultValue = "productDate") String sortType,
			@RequestParam(required = false) String highPrice, @RequestParam(required = false) String lowPrice,
			@RequestParam(required = false) String productDate,
			@RequestParam(required = false) Integer categoryNum,
			@RequestParam(required = false) int page) throws Exception {
		SearchVO search = new SearchVO();
		search.setSearchType(searchType);
		search.setSortType(sortType);
		search.setKeyword(keyword);
		search.setKeyword2(keyword2);
		search.setMinPrice(minPrice);
		search.setMaxPrice(maxPrice);
		search.setCheckDelivery(checkDelivery);
		search.setHighPrice(highPrice);
		search.setLowPrice(lowPrice);
		search.setProductDate(productDate);
		search.setCategoryNum(categoryNum);
		
		System.out.println("@@@@@@@@@@" + categoryNum);
		
		int totCnt = productService.getProductListTotal(search).size();
		
		if(page == 1) {
			search.setStartNum(1);
			search.setEndNum(20);
		} else {
			search.setStartNum(page+(19*(page-1)));
			search.setEndNum(page*20);
			if(search.getEndNum() < totCnt) {
				search.setEndNum(totCnt);
			}
		}
		
		System.out.println(search);

		model.addAttribute("productList", productService.getProductList(search));
		model.addAttribute("totCnt", productService.getProductListTotal(search).size());
		model.addAttribute("startNum", search.getStartNum());
		model.addAttribute("keyword", keyword);
		model.addAttribute("keyword2", keyword2);
		model.addAttribute("minPrice", minPrice);
		model.addAttribute("maxPrice", maxPrice);
		model.addAttribute("categoryNum", categoryNum);
		return "product/SearchResult";
	}
	
	// 상품 리스트 페이지
		@RequestMapping(value = "/productListPaging")
		@ResponseBody
		public Map<String, Object> getProductListPaging(Model model,
				@RequestParam(required = false, defaultValue = "productName") String searchType,
				@RequestParam(required = false) String keyword, @RequestParam(required = false) String keyword2,
				@RequestParam(required = false) String minPrice, @RequestParam(required = false) String maxPrice,
				@RequestParam(required = false) String checkDelivery,
				@RequestParam(required = false, defaultValue = "productDate") String sortType,
				@RequestParam(required = false) String highPrice, @RequestParam(required = false) String lowPrice,
				@RequestParam(required = false) String productDate,
				@RequestParam(required = false) Integer categoryNum,
				@RequestParam(required = false) int page) throws Exception {
			SearchVO search = new SearchVO();
			search.setSearchType(searchType);
			search.setSortType(sortType);
			search.setKeyword(keyword);
			search.setKeyword2(keyword2);
			search.setMinPrice(minPrice);
			search.setMaxPrice(maxPrice);
			search.setCheckDelivery(checkDelivery);
			search.setHighPrice(highPrice);
			search.setLowPrice(lowPrice);
			search.setProductDate(productDate);
			search.setCategoryNum(categoryNum);
			
			int totCnt = productService.getProductListTotal(search).size();
			
			if(page == 1) {
				search.setStartNum(1);
				search.setEndNum(20);
			} else {
				search.setStartNum(page+(19*(page-1)));
				search.setEndNum(page*20);
				if(search.getEndNum() > totCnt) {
					search.setEndNum(totCnt);
				}
			}
			
			System.out.println(search); 
			
			Map<String, Object> map = new HashMap<String, Object>();
			

			map.put("productList", productService.getProductList(search));
			map.put("totCnt", productService.getProductListTotal(search).size());
			map.put("startNum", search.getStartNum());
			map.put("keyword", keyword);
			map.put("keyword2", keyword2);
			map.put("minPrice", minPrice);
			map.put("maxPrice", maxPrice);
			map.put("categoryNum", categoryNum);
			return map;
		}
	
	// 장바구니 선텍 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteBasket")
	public ModelAndView deleteBasket(@RequestParam int basketNum, HttpServletRequest req) {
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

	// 상품 수정 페이지
	@RequestMapping(value = "/updateProduct")
	public ModelAndView updatedProduct(@RequestParam int productNum) {
		ModelAndView mv = new ModelAndView();

		ProductVO productVO = new ProductVO();

		productVO.setProductNum(productNum);

		productVO = productService.selectProduct(productNum);

		List<DetailOptionVO> alldo = productService.selectDetailOption(productNum);

		List<DetailOptionVO> onedo = new ArrayList<DetailOptionVO>();
		List<DetailOptionVO> twodo = new ArrayList<DetailOptionVO>();
		List<DetailOptionVO> threedo = new ArrayList<DetailOptionVO>();

		for (int i = 0; i < alldo.size(); i++) {
			if (alldo.get(i).getOptionLevel() == 1) {
				onedo.add(alldo.get(i));
			}
			if (alldo.get(i).getOptionLevel() == 2) {
				twodo.add(alldo.get(i));
			}
			if (alldo.get(i).getOptionLevel() == 3) {
				threedo.add(alldo.get(i));
			}
		}
		
		List<CategoryVO> categorys = adminService.selectCategoryByCategoryDepth(1);
		
		CategoryVO category = adminService.selectCategoryByCategoryNum(productVO.getCategoryNum());


		mv.setViewName("seller/UpdateProduct");
		mv.addObject("onedo", onedo);
		mv.addObject("twodo", twodo);
		mv.addObject("threedo", threedo);
		mv.addObject("product", productVO);
		mv.addObject("cetegorys", categorys);
		mv.addObject("category", category);

		return mv;
	}

	// 상품 수정 완료 페이지
	@RequestMapping(value = "/updateProductResult")
	public ModelAndView updateProductResult(MultipartHttpServletRequest mtfRequest) {
		ModelAndView mv = new ModelAndView();
		ProductVO productVO = new ProductVO();
		MultipartFile mf = mtfRequest.getFile("productImage");
		MultipartFile mft = mtfRequest.getFile("productThumb");
		// 새로운 파일이 등록되었는지 확인
		if (mf.getOriginalFilename() != null && mf.getOriginalFilename() != "") {
			// 기존 파일 삭제
			new File(uploadPath + mf).delete();
			new File(ThumUploadPath + mft).delete();

			// 새로 업로드한 파일 등록
			UUID uid = UUID.randomUUID();
			String fileName = mf.getOriginalFilename();
			String saveName = uid.toString() + "_" + fileName;
			File target = new File(uploadPath, saveName);
			String thumFileName = mft.getOriginalFilename();
			String thumSaveName = uid.toString() + "_" + thumFileName;
			String thumbFileName = "s_" + thumSaveName;
			File Thum = new File(ThumUploadPath, thumbFileName);
			try {
				FileCopyUtils.copy(mf.getBytes(), target);
				FileCopyUtils.copy(mft.getBytes(), Thum);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			productVO.setProductNum(Integer.parseInt(mtfRequest.getParameter("productNum")));
			productVO.setCategoryNum(Integer.parseInt(mtfRequest.getParameter("categoryNum")));
			productVO.setProductName(mtfRequest.getParameter("productName"));
			productVO.setStock(Integer.parseInt(mtfRequest.getParameter("stock")));
			productVO.setProductPrice(Integer.parseInt(mtfRequest.getParameter("productPrice")));
			productVO.setProductImage(File.separator + "upload" + File.separator + saveName);
			productVO.setProductText(mtfRequest.getParameter("productText"));

			if (mtfRequest.getParameter("productDisplay") == null) {
				productVO.setProductDisplay("FALSE");
			} else {
				productVO.setProductDisplay(mtfRequest.getParameter("productDisplay"));
			}

			productVO.setProductThumb(
					File.separator + "upload" + File.separator + "thum" + File.separator + thumbFileName);

			if (mtfRequest.getParameter("productMeterial") == null) {
				productVO.setProductMeterial("-");
			} else {
				productVO.setProductMeterial(mtfRequest.getParameter("productMeterial"));
			}

			if (mtfRequest.getParameter("manufacturer") == null) {
				productVO.setManufacturer("-");
			} else {
				productVO.setManufacturer(mtfRequest.getParameter("manufacturer"));
			}

			if (mtfRequest.getParameter("origin") == null) {
				productVO.setOrigin("-");
			} else {
				productVO.setOrigin(mtfRequest.getParameter("origin"));
			}

			if (mtfRequest.getParameter("deliveryPrice") == null) {
				productVO.setDeliveryPrice(0);
			} else {
				productVO.setDeliveryPrice(Integer.parseInt(mtfRequest.getParameter("deliveryPrice")));
			}
			productVO.setOptionOneName(mtfRequest.getParameter("optionOneName"));
			productVO.setOptionTwoName(mtfRequest.getParameter("optionTwoName"));
			productVO.setOptionThreeName(mtfRequest.getParameter("optionThreeName"));

			String d = mtfRequest.getParameter("mfDate");
			
			productVO.setId(mtfRequest.getParameter("id"));

			if (mtfRequest.getParameter("hidden").equals("n")) {
				System.out.println("1 : " + productVO.toString());
				productService.updateProductByProductNumDateIsNull(productVO);
			} else {
				productVO.setMfDate(Date.valueOf(d));
				System.out.println("2 : " + productVO.toString());
				productService.updateProductByProductNum(productVO);
			}

			int THUMB_WIDTH = 300;
			int THUMB_HEIGHT = 300;

			File thumbnail = new File(ThumUploadPath, thumbFileName);

			if (target.exists()) {
				thumbnail.getParentFile().mkdirs();
				try {
					Thumbnails.of(Thum).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
					if (thumbnail.exists()) {
						Thum.delete();
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			mv.setViewName("redirect:/productManage?page=1");
		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			productVO.setProductNum(Integer.parseInt(mtfRequest.getParameter("productNum")));
			productVO.setCategoryNum(Integer.parseInt(mtfRequest.getParameter("categoryNum")));
			productVO.setProductName(mtfRequest.getParameter("productName"));
			productVO.setStock(Integer.parseInt(mtfRequest.getParameter("stock")));
			productVO.setProductPrice(Integer.parseInt(mtfRequest.getParameter("productPrice")));
			productVO.setProductImage(mtfRequest.getParameter("oriProductImage"));
			productVO.setProductText(mtfRequest.getParameter("productText"));

			if (mtfRequest.getParameter("productDisplay") == null) {
				productVO.setProductDisplay("FALSE");
			} else {
				productVO.setProductDisplay(mtfRequest.getParameter("productDisplay"));
			}

			productVO.setProductThumb(mtfRequest.getParameter("oriProductThumb"));

			if (mtfRequest.getParameter("productMeterial") == null) {
				productVO.setProductMeterial("-");
			} else {
				productVO.setProductMeterial(mtfRequest.getParameter("productMeterial"));
			}

			if (mtfRequest.getParameter("manufacturer") == null) {
				productVO.setManufacturer("-");
			} else {
				productVO.setManufacturer(mtfRequest.getParameter("manufacturer"));
			}

			if (mtfRequest.getParameter("origin") == null) {
				productVO.setOrigin("-");
			} else {
				productVO.setOrigin(mtfRequest.getParameter("origin"));
			}

			productVO.setDeliveryPrice(Integer.parseInt(mtfRequest.getParameter("deliveryPrice")));
			productVO.setOptionOneName(mtfRequest.getParameter("optionOneName"));
			productVO.setOptionTwoName(mtfRequest.getParameter("optionTwoName"));
			productVO.setOptionThreeName(mtfRequest.getParameter("optionThreeName"));

			String d = mtfRequest.getParameter("mfDate");
			
			productVO.setId(mtfRequest.getParameter("id"));
			
			System.out.println(productVO);
			

			if (mtfRequest.getParameter("hidden").equals("n")) {
				productService.updateProductByProductNumDateIsNull(productVO);
			} else {
				productVO.setMfDate(Date.valueOf(d));
				productService.updateProductByProductNum(productVO);
			}

		}
		mv.setViewName("redirect:/productManage?page=1");
		return mv;
	}

	// 상품 삭제
	@RequestMapping(value = "deleteProduct")
	public ModelAndView deleteProduct(HttpServletRequest req, @RequestParam int productNum) {
		ModelAndView mv = new ModelAndView();

		ProductVO productVO = new ProductVO();

		productVO.setProductNum(productNum);
		productVO.setProductSale("NO");

		productService.deleteProductByProductNum(productVO);
		
		productService.updateProductByCategoryNumZero(productVO.getProductNum());

		HttpSession session = req.getSession();

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");

		List<ProductVO> productList = productService.productListById(authInfo.getId());

		mv.setViewName("redirect:seller/ProductManage");

		mv.addObject("productList", productList);

		return mv;
	}

	// 디테일 옵션 저장
	@RequestMapping(value = "insertDetailOption")
	@ResponseBody
	public Map<String, Object> insertDetailOption(DetailOptionVO detailOptionVO) {

		productService.insertDetailOption(detailOptionVO);

		int productNum = detailOptionVO.getProductNum();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("optionName", detailOptionVO.getOptionName());
		map.put("doNum", productService.selectMaxDoNumByProductNum(productNum));

		return map;
	}

	// 옵션 저장
	@RequestMapping(value = "insertOption", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String insertOption(OptionVO optionVO) {

		int optionNum;

		String optionNumm = null;

		try {

			optionNum = productService.selectOptionNum(optionVO);

			System.out.println(optionNum);

			optionNumm = Integer.toString(optionNum);

			System.out.println(optionNumm);

		} catch (NullPointerException e) {

		}

		if (optionNumm == null) {
			productService.insertOption(optionVO);
			return "success";
		}
		return "null";

	}

	// 디테일 옵션 삭제
	@RequestMapping(value = "deleteDetailOption")
	@ResponseBody
	public Map<String, Object> deleteDetailOption(int doNum) {
		productService.deleteDetailOption(doNum);

		productService.deleteOptionByDoNum(doNum);

//			productService.deleteOptionOneByDoNum(doNum);
//			productService.deleteOptionTwoByDoNum(doNum);
//			productService.deleteOptionThreeByDoNum(doNum);

		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(doNum);
		map.put("doNum", doNum);

		return map;
	}

	// 디테일 옵션 선택 수량 번경
	@RequestMapping(value = "selectDetailOption")
	@ResponseBody
	public Map<String, Object> selectDetailOption(OptionVO optionVO) {
		int optionNum = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			optionNum = productService.selectOptionNum(optionVO);

			OptionVO option = productService.selectOptionByOptionNum(optionNum);
			int stock = option.getStock();

			map.put("stock", stock);
		} catch (NullPointerException e) {

		}

		return map;
	}

	// 옵션 삭제
	@RequestMapping(value = "deleteOption", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String deleteOption(OptionVO optionVO) {

		int optionNum = productService.selectOptionNum(optionVO);

		productService.deleteOptionByOptionNum(optionNum);

		return "success";

	}

	// 1차 상세 옵션 고름
	@RequestMapping(value = "selectOptionOne")
	@ResponseBody
	public Map<String, Object> selectOptionOne(OptionVO optionVO) {

		System.out.println(optionVO);

		Map<String, Object> map = new HashMap<String, Object>();

		List<OptionVO> list = productService.selectOptionByOptionOneNum(optionVO);

		List<DetailOptionVO> list2 = new ArrayList<DetailOptionVO>();

		boolean flag = true;
		
		for (int i = 0; i < list.size(); i++) {
			flag = true;
			int doNum = list.get(i).getOptionTwoNum();
			for(int j = 0 ; j < list2.size() ; j++) {
				if(list2.get(j).getDoNum() == doNum) {
					flag = false;
				}
			}
			if(flag == true) {
				list2.add(productService.selectDetailOptionByDoNum(doNum));
			}
		}

		map.put("list", list2);

		return map;

	}

	// 2차 상세 옵션 고름
	@RequestMapping(value = "selectOptionTwo")
	@ResponseBody
	public Map<String, Object> selectOptionTwo(OptionVO optionVO) {

		System.out.println(optionVO);

		Map<String, Object> map = new HashMap<String, Object>();

		List<OptionVO> list = productService.selectOptionByOptionTwoNum(optionVO);
		
		System.out.println(list);

		List<DetailOptionVO> list2 = new ArrayList<DetailOptionVO>();
		
		boolean flag = true;
		
		for (int i = 0; i < list.size(); i++) {
			flag = true;
			int  doNum = list.get(i).getOptionThreeNum();
			for(int j = 0 ; j < list2.size() ; j++) {
				if(list2.get(j).getDoNum() == doNum) {
					flag = false;
				}
			}
			if(flag == true) {
				list2.add(productService.selectDetailOptionByOptionTwoNum(list.get(i)));
			}
		}
		

		map.put("list", list2);

		return map;

	}
	
	// 최근 본 상품
	@RequestMapping(value = "latelyViewProduct")
	public ModelAndView latelyViewProduct(HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/LatelyViewProduct");
		
		Cookie[] cookies = req.getCookies();
		
		List<ProductVO> products = new ArrayList<ProductVO>();
		
		
		
		for(Cookie cookie : cookies) {
			
			
			try {
				
				if(cookie.getName().contains("latelyViewProduct")) {
				System.out.println(Integer.parseInt(URLDecoder.decode(cookie.getValue(), "UTF-8")));
				ProductVO product = productService.selectProduct(Integer.parseInt(URLDecoder.decode(cookie.getValue(), "UTF-8")));
				if(product != null) {
				product.setStoreName(memberService.searchSellerById(product.getId()).getStoreName());
				products.add(product);
				}
				}
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		mv.addObject("products", products);
		
		return mv;
	}
	
	// 상품 신고 페이지
	@RequestMapping(value = "/decl")
	public String decl() {
		return "product/Decl";
	}
	
	// 상품 신고 
	@RequestMapping(value = "/insertDeclProduct")
	public void insertDeclProduct( HttpServletRequest req, @Valid DeclProductVO declProductVO) {
		HttpSession session = req.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		
		declProductVO.setDeclId(authInfo.getId());
		
		productService.insertDeclProduct(declProductVO);
		
	}

}
