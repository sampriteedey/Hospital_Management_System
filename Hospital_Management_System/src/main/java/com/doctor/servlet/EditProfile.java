package com.doctor.servlet;

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


@WebServlet("/doctorUpdateProfile")
public class EditProfile extends HttpServlet{
	
	 private static final long serialVersionUID = 1L;

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        HttpSession session = req.getSession();
	        try {
	            String fullName = req.getParameter("fullname");
	            String dob = req.getParameter("dob");
	            String qualification = req.getParameter("qualification");
	            String specialist = req.getParameter("specialist");
	            String email = req.getParameter("email");
	            String mobno = req.getParameter("mobno");
	           

	            int id = Integer.parseInt(req.getParameter("id"));

	            Doctor d = new Doctor(id, fullName, dob, qualification, specialist, email, mobno,"");
	            DoctorDao dao = new DoctorDao(DBconnect.getConn());

	            if (dao.editDoctorProfile(d)) {
	                session.setAttribute("succMsgd", "Doctor updated successfully.");
	                resp.sendRedirect("doctor/edit_profile.jsp");
	            } else {
	                session.setAttribute("errorMsgd", "Something went wrong.");
	                resp.sendRedirect("doctor/edit_profile.jsp");
	            }
	            resp.sendRedirect("admin/doctor.jsp");

	        }catch (Exception e) {
	            
	            e.printStackTrace();
	        }
	    }

}
