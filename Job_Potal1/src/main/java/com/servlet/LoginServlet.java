package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connect.Connector;
import com.dao.UserDAO;
import com.entities.Message;
import com.entities.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			HttpSession session=req.getSession();
			User u=new User();
			
			if("admin@gmail.com".equals(email) && "admin@123".equals(password)) {
				session.setAttribute("userobj",u);
				u.setRole("admin");
				res.sendRedirect("admin.jsp");
			}else {
				
				UserDAO dao=new UserDAO( Connector.getCon());
				User user=dao.login(email, password);
				 
				
				if(user!=null) {
					Message m=new Message("Congrats! Login successfull...","alert-success");
					session.setAttribute("msg", m);
					session.setAttribute("userobj",user);
					u.setRole("user");
					res.sendRedirect("home.jsp");
				}else {
					Message m=new Message("Oops! Something went wrong...","alert-danger");
					session.setAttribute("msg", m);
					res.sendRedirect("login_page.jsp");
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
