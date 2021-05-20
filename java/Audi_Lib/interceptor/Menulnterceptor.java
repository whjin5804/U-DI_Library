package Audi_Lib.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import Audi_Lib.admin.service.AdminService;


//HandlerInterceptorAdapter클래스를 상속하여 만든 클래스는 인터셉터의 기능을 정의할 수 있다.
public class Menulnterceptor extends HandlerInterceptorAdapter{
	@Resource(name = "adminService")
	private AdminService adminService;
	
	@Override
	//컨트롤러로 진입하기 전 실행되는 메소드
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//return super.preHandle(request, response, handler);
		
		//리턴은 true, false로 준다.
		//true -> 인터셉터 실행 후 원래 요청 경로로 이동
		//false -> 인터셉터 실행 후 원래 요청 경로로 이동하지 않음
		return true;
	}

	@Override
	//컨트롤러의 메소드가 실행 후 jsp로 가기 전에 실행
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		//super.postHandle(request, response, handler, modelAndView);
		
	}
	//HandlerInterceptorAdapter에 정의된 메소드를 오버라이딩하여 필요한 기능을 구현
	
	
	
}
