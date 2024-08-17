package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBconnect;


@WebServlet("/doctChangePassword")
public class DoctorPasswordChange extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int uid = Integer.parseInt(req.getParameter("uid"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		
		DoctorDao dao = new DoctorDao(DBconnect.getConn());
		HttpSession session = req.getSession();
		
		if(dao.checkOldPassword(uid, oldPassword)) {
			if(dao.changePassword(uid, newPassword)) {
				session.setAttribute("succMsg", "Password Changed Sucessfully");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}else {
				session.setAttribute("errorMsg", "Something went wrong");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
		}else {
			session.setAttribute("errorMsg", "old password incorrect");
			resp.sendRedirect("cdoctor/edit_profile.jsp");
		}
	}

}
