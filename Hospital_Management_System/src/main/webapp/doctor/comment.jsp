<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.dao.DoctorDao, com.db.DBconnect, com.entity.Doctor, java.util.List" %>
<%@ page import="com.dao.AppointmentDao, com.db.DBconnect, com.entity.User, com.entity.Appointment" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
.backImg {
    background: linear-gradient(rgba(0, 0, 0, .4), rgba(0,0,0, .4)), url("image/doc2.jpg");
    height: 20vh;
    width: 100%;
    background-size: cover;
    background-repeat: no-repeat;
}
</style>

<%@include file="../component/allcss.jsp" %>
</head>
<body>
<c:if test="${empty doctObj}">
    <c:redirect url="../doctor_login.jsp" />
</c:if>

<%@include file="navbar.jsp" %>

<div class="container-fluid backImg p-5">
    <p class="text-center fs-2 text-white"></p>
</div>

<div class="container p-3">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="text-center fs-3">Patient Comment</p>

                    <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    AppointmentDao dao = new AppointmentDao(DBconnect.getConn());
                    Appointment ap = dao.getAppointmentById(id);
                    %>

                    <form class="row" action="../updateStatus" method="post">
                        <div class="col-md-6">
                            <label>Patient Name</label>
                            <input type="text" class="form-control" readonly value="<%= ap.getFullName() %>">
                        </div>
                        <div class="col-md-6">
                            <label>Age</label>
                            <input type="text" class="form-control" readonly value="<%= ap.getAge() %>">
                        </div>
                        <div class="col-md-6">
                            <br><label>Mob No</label>
                            <input type="text" class="form-control" readonly value="<%= ap.getPhNo() %>">
                        </div>
                        <div class="col-md-6">
                            <br><label>Diseases</label>
                            <input type="text" class="form-control" readonly value="<%= ap.getDiseases() %>">
                        </div>
                        <div class="col-md-6">
                            <br><label>Comment</label>
                            <textarea required name="comm" class="form-control" rows="3"></textarea>
                        </div>
                        <input type="hidden" name="id" value="<%= ap.getId() %>">
                        <input type="hidden" name="did" value="<%= ap.getDoctorId() %>">
                        <button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
