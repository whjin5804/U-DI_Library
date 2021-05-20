package Audi_Lib.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import Audi_Lib.member.vo.MemberVO;


public class LoginInterceptor extends HandlerInterceptorAdapter{

   //컨트롤러로 이동전에 login을 체크해서 로그인 유무를 체크하여 페이지 이동 컨트롤
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      HttpSession session = request.getSession();
      MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
      
      if(loginInfo == null) {
    	 response.setContentType("text/html; charset=utf-8");
         PrintWriter out = response.getWriter();
         out.print("<script>alert('로그인이 필요한 서비스입니다.'); location.href='/home/first'; </script>");
         out.flush();
         out.close();
         return false;
      }
      
      return true;
   }
   
}