package com.admin.servlet;

import java.io.IOException;


import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBconnect;
import com.entity.Doctor;

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6075525339377486626L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
	try {
		String fullName = req.getParameter("fullname");
		String dob = req.getParameter("dob");
		String qualification = req.getParameter("qualification");
		String specialist = req.getParameter("specialist");
		String email = req.getParameter("email");
		String mobno = req.getParameter("mobno");
		String password = req.getParameter("password");
        
		
		
		Doctor d = new Doctor(fullName, dob, qualification, specialist, email, mobno, password);
		DoctorDao dao = new DoctorDao(DBconnect.getConn());
		
		HttpSession session = req.getSession();
		if(dao.registerDoc(d)) {
			session.setAttribute("succMsg", "Doctor Added Successfully..");
			resp.sendRedirect("admin/doctor.jsp");
		}else {
			session.setAttribute("errorMsg", "Something went wrong");
			resp.sendRedirect("admin/doctor.jsp");
		}
	
	
	
	}catch(Exception e ) {
		e.printStackTrace();
	}
	}
}
