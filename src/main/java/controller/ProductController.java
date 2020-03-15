package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import service.ProductService;
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

	//상품 페이지
	@RequestMapping("/product")
	public ModelAndView product(int productNum) {
		ProductVO productVO = productService.selectProduct(productNum);
		SellerVO sellerVO = memberService.searchSellerById(productVO.getId());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/Product");
		mv.addObject("product", productVO);
		mv.addObject("seller", sellerVO);

		return mv;
	}
	
}
