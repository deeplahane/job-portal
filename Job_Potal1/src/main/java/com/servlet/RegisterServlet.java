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

@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String qualification = req.getParameter("qualification");

			UserDAO dao = new UserDAO(Connector.getCon());
			User u = new User(name, email, password, qualification, "user");

			boolean f = dao.addUser(u);

			HttpSession session = req.getSession();

			if (f) {
				Message m = new Message("Congrats! Registration Successful...", "alert-success");
				session.setAttribute("msg", m);
				res.sendRedirect("index.jsp");
			} else {
				Message m = new Message("Oops! Something went wrong", "alert-danger");
				session.setAttribute("msg", m);
				res.sendRedirect("signup_page.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
