package controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;

public class AdminController {

	// 관리자 메인
	@RequestMapping("/admin")
	public String admin() {
		return "admin/AdminPage";
	}

	
}
