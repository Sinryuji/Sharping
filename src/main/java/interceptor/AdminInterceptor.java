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
	  

	  HttpSession session = request.getSession(false);
	  if(session != null) {
		 Object adminVO = session.getAttribute("adminVO");
		 if(adminVO != null) {
			 return true;
		 }
	  }
	  response.sendRedirect(request.getContextPath() + "/login");
	  return false;	 
		 
	 }
	
}
