package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import vo.AdminVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	 @Override
	 public boolean preHandle(HttpServletRequest request,
	    HttpServletResponse response, Object handler) throws Exception {
	  
	  HttpSession session = request.getSession();
	  AdminVO adminVO = (AdminVO)session.getAttribute("admin");
	  
	  if(adminVO == null ) {
		  response.sendRedirect(request.getContextPath() + "/login");
	   return false;
	  }
	  
	  return true;
	 }
	
}
