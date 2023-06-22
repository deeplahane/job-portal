package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connect.Connector;
import com.dao.JobDAO;
import com.entities.Jobs;
import com.entities.Message;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String description = req.getParameter("description");
			String location = req.getParameter("location");
			String category = req.getParameter("category");
			String status = req.getParameter("status");

			Jobs job = new Jobs();
			job.setId(id);
			job.setTitle(title);
			job.setDescription(description);
			job.setLocation(location);
			job.setCategory(category);
			job.setStatus(status);
			

			JobDAO dao = new JobDAO(Connector.getCon());
			boolean i = dao.updateJob(job);

			HttpSession session = req.getSession();
			i=false;
			if (i) {
				Message msg = new Message("Congrats! Job updated Successfully...", "alert-success");
				session.setAttribute("msg", msg);
				res.sendRedirect("view_jobs.jsp");
			} else {
				Message msg = new Message("Oops! Something went wrong...", "alert-danger");
				session.setAttribute("msg", msg);
				res.sendRedirect("view_jobs.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
