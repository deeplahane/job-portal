package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobDAO;
import com.entities.Message;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		JobDAO dao=new JobDAO(com.connect.Connector.getCon());
		boolean v=dao.deleteTask(id);
		
		HttpSession session=req.getSession();

		if(v) {
			Message msg=new Message("Post Deleted successfully...","alert-success");
			session.setAttribute("msg", msg);
			res.sendRedirect("view_jobs.jsp");
		}else {
			Message msg=new Message("Oops! Something went wrong...","alert-danger");
			session.setAttribute("msg", msg);
			res.sendRedirect("view_jobs.jsp");
		}
		
	}

}
