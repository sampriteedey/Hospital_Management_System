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

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

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
            String password = req.getParameter("password");

            int id = Integer.parseInt(req.getParameter("id"));

            Doctor d = new Doctor(id, fullName, dob, qualification, specialist, email, mobno, password);
            DoctorDao dao = new DoctorDao(DBconnect.getConn());

            if (dao.updateDoctor(d)) {
                session.setAttribute("succMsg", "Doctor updated successfully.");
            } else {
                session.setAttribute("errorMsg", "Something went wrong.");
            }
            resp.sendRedirect("admin/doctor.jsp");

        } catch (NumberFormatException e) {
            session.setAttribute("errorMsg", "Invalid ID format.");
            resp.sendRedirect("admin/view_doctor.jsp");
            e.printStackTrace();
        } catch (Exception e) {
            session.setAttribute("errorMsg", "Something went wrong.");
            resp.sendRedirect("admin/view_doctor.jsp");
            e.printStackTrace();
        }
    }
}
