package controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.UUID;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import net.coobird.thumbnailator.Thumbnails;
import service.MemberService;
import service.ProductService;
import vo.AuthInfo;

import vo.DetailOptionVO;

import vo.BasketListVO;
import vo.BasketVO;

import vo.OptionVO;

import vo.ProductVO;
import vo.SearchVO;
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


	// 상품 업로드 완료
	@RequestMapping(value = "/uploadCompleteProduct")
//	public String uploadCompleteProduct(@Valid ProductVO productVO , MultipartFile file) {
	public String uploadCompleteProduct(MultipartHttpServletRequest mtfRequest) {
		ProductVO productVO = new ProductVO();
		String uploadPath = "d:\\dev\\upload\\";
		String ThumUploadPath = "d:\\dev\\upload\\thum";
		File dir = new File(uploadPath);
		if(!dir.exists()) {
			dir.mkdir();
		}
		UUID uid = UUID.randomUUID();
		MultipartFile mf = mtfRequest.getFile("productImage");
		MultipartFile mft = mtfRequest.getFile("productThumb");
		String fileName = mf.getOriginalFilename();
		String saveName = uid.toString() + "_" + fileName;
		File target = new File(uploadPath, saveName);
		String thumFileName = mft.getOriginalFilename();
		String thumSaveName = uid.toString() + "_" + thumFileName;
		String thumbFileName = "s_" + thumSaveName;
		File Thum = new File(ThumUploadPath, thumSaveName );
		try {
			FileCopyUtils.copy(mf.getBytes(), target);
			FileCopyUtils.copy(mft.getBytes(), Thum);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		productVO.setId(mtfRequest.getParameter("id"));
		productVO.setCategoryNum(Integer.parseInt(mtfRequest.getParameter("categoryNum")));
		productVO.setProductName(mtfRequest.getParameter("productName"));
		productVO.setStock(Integer.parseInt(mtfRequest.getParameter("stock")));
		productVO.setProductPrice(Integer.parseInt(mtfRequest.getParameter("productPrice")));
		productVO.setProductImage(uploadPath + saveName);
		productVO.setProductText(mtfRequest.getParameter("productText"));
		
		if(mtfRequest.getParameter("productDisplay") == null) {
			productVO.setProductDisplay("FALSE");
		} else {
		productVO.setProductDisplay(mtfRequest.getParameter("productDisplay"));
		}
		
		productVO.setProductThumb(ThumUploadPath + thumbFileName);
		
		if(mtfRequest.getParameter("productMeterial") == null) {
			productVO.setProductMeterial("-");
		} else {
			productVO.setProductMeterial(mtfRequest.getParameter("productMeterial"));
		}
		
		if(mtfRequest.getParameter("manufacturer") == null) {
			productVO.setManufacturer("-");
		} else {
			productVO.setManufacturer(mtfRequest.getParameter("manufacturer"));
		}
				
		if(mtfRequest.getParameter("origin") == null) {
			productVO.setOrigin("-");
		} else {
			productVO.setOrigin(mtfRequest.getParameter("origin"));
		}
		
		productVO.setDeliveryPrice(Integer.parseInt(mtfRequest.getParameter("deliveryPrice")));
		productVO.setOptionOneName(mtfRequest.getParameter("optionOneName"));
		productVO.setOptionTwoName(mtfRequest.getParameter("optionTwoName"));
		productVO.setOptionThreeName(mtfRequest.getParameter("optionThreeName"));
	
		String d = mtfRequest.getParameter("mfDate");

		if(mtfRequest.getParameter("hidden").equals("n")) {
			productService.uploadProductDateIsNull(productVO);
		} else {
			productVO.setMfDate(Date.valueOf(d));
			productService.uploadProduct(productVO);
		}
		
		int THUMB_WIDTH = 300;
		int THUMB_HEIGHT = 300;
		
		  File thumbnail = new File(ThumUploadPath, thumbFileName);

		  if (target.exists()) {
		   thumbnail.getParentFile().mkdirs();
		   try {
			Thumbnails.of(Thum).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
			if(thumbnail.exists()) {
				Thum.delete();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  }
		  
		
		
		return "seller/UploadResult";
	}
	
	//상품 페이지

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
	@RequestMapping(value= "/searchProduct")
	public String SearchProduct() {
		return "MainPage";
	}
	
	// 상품 리스트 페이지
	@RequestMapping(value ="/productList", method = RequestMethod.GET)
	public String getProductList(Model model,
								@RequestParam(required=false, defaultValue = "productName") String searchType,
								@RequestParam(required=false) String keyword, @RequestParam(required=false) String keyword2,
								@RequestParam(required=false) String minPrice, @RequestParam(required=false) String maxPrice,
								@RequestParam(required=false) String checkDelivery,
								@RequestParam(required=false, defaultValue = "productDate") String sortType,
								@RequestParam(required=false) String highPrice, @RequestParam(required=false) String lowPrice,
								@RequestParam(required=false) String productDate
								) throws Exception{
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
		
		model.addAttribute("productList", productService.getProductList(search));
		model.addAttribute("keyword", keyword);
		model.addAttribute("keyword2",keyword2);
		model.addAttribute("minPrice", minPrice);
		model.addAttribute("maxPrice", maxPrice);
		return "product/SearchResult";
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
