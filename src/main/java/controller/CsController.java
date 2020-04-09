package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.AdminService;
import service.MemberService;
import service.OrderService;
import service.ProductService;

@Controller
public class CsController {
	private AdminService adminService;
	private MemberService memberService;
	private ProductService productService;
	private OrderService orderService;
	
	
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
	public MemberService getMemberService() {
		return memberService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	@RequestMapping(value = "/cs/buyer")
	public String csBuyer() {
		
		return "cs/Buyer";
	}
	
	// 고객센터
	@RequestMapping(value = "/csqa")
	public String caqa() {
		return "cs/Csqa";
	}
	
}
