package com.semi.main.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;
import com.semi.partner.model.service.PartnerService;
import com.semi.partner.model.vo.PartnerMember;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String saveId = request.getParameter("saveId");
		

		if(saveId!=null) {
			Cookie c = new Cookie("saveId",id);
			c.setMaxAge(3*24*60*60);
			response.addCookie(c);//쿠키저장메소드
		}else {
			Cookie c = new Cookie("saveId","");
			c.setMaxAge(0);
			response.addCookie(c);
		}
		
		//로그인로직  서비스요청
		System.out.println("servlet login: " + id + " : " + pw);
		Member m = new MemberService().loginMember(id,pw);
		System.out.println("서블릿 출력: " + m);
		
		if(m!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("Memberloggined", m);//session객체에 데이터 보관
			response.sendRedirect(request.getContextPath());
		}else {
			request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다!");
			request.setAttribute("loc", "/");//전송할페이지
			RequestDispatcher rd= request.getRequestDispatcher("/views/common/msg.jsp");
			rd.forward(request, response);
		}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
