package com.admin.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DBconnect;

@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specName = req.getParameter("specName");
		
		SpecialistDao dao = new SpecialistDao(DBconnect.getConn());
		
		boolean f=dao.addSpecialist(specName);
		HttpSession session = req.getSession();
		try {
		if(f)
		{
			session.setAttribute("succMsg", "Specialist Added");
			resp.sendRedirect("admin/index.jsp");
		}else {
			session.setAttribute("errorMsg", "something went wrong");
			resp.sendRedirect("admin/index.jsp");
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
		
	}
	
	}
	
	

}
