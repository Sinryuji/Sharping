package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.UUID;


import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.coobird.thumbnailator.Thumbnails;
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
