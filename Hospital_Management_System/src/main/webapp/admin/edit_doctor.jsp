<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.dao.DoctorDao, com.db.DBconnect, com.entity.Doctor, java.util.List" %>
<%@ page import="com.dao.SpecialistDao, com.db.DBconnect, com.entity.Specialist, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor Details</title>
<%@include file = "../component/allcss.jsp" %>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
<%@include file = "navbar.jsp" %>
<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-3 text-center text-danger">Edit Doctor Details</p>
                    <c:if test="${not empty errorMsg}">
                        <p class="fs-3 text-center text-danger">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>
                    <c:if test="${not empty succMsg}">
                        <p class="fs-3 text-center text-success" role="alert">${succMsg}</p>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>
                    <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    DoctorDao dao2 = new DoctorDao(DBconnect.getConn());
                    Doctor d = dao2.getDoctorById(id);
                    %>
                    <form action="../updateDoctor" method="post">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" required name="fullname" class="form-control"  value="<%= d.getFullName() %>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">DOB</label>
                            <input type="text" required name="dob" class="form-control" value="<%= d.getDob() %>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Qualification</label>
                            <input type="text" required name="qualification" class="form-control" value="<%= d.getQualification() %>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Specialist</label>
                            <select name="specialist" required class="form-control">
                                <option selected><%= d.getSpecialist() %></option>
                                <%
                                SpecialistDao dao = new SpecialistDao(DBconnect.getConn());
                                List<Specialist> list = dao.getAllSpecialist();
                                for (Specialist s : list) {
                                %>
                                    <option><%= s.getSpecialistName() %></option>
                                <%
                                }
                                %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" required name="email" class="form-control" value="<%= d.getEmail() %>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">MOB NO</label>
                            <input type="text" required name="mobno" class="form-control" value="<%= d.getMobno() %>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" required name="password" class="form-control" value="<%= d.getPassword() %>">
                        </div>
                        <input type="hidden" name="id" value="<%= d.getId() %>">
                        <button type="submit" class="btn btn-primary col-md-12">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
