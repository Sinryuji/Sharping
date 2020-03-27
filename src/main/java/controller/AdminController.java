package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	// 관리자 메인
	@RequestMapping("/admin")
	public String admin() {
		return "admin/AdminPage";
	}
}
