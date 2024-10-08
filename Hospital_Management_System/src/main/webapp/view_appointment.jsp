
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page import="com.dao.DoctorDao, com.db.DBconnect, com.entity.Doctor, java.util.List" %>
<%@ page import="com.dao.AppointmentDao, com.db.DBconnect, com.entity.Doctor, java.util.List" %>
<%@ page import="com.entity.User" %> <!-- Adjust the package name -->
<%@ page import="com.entity.Appointment" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file = "../component/allcss.jsp" %>
<style type = "text/css">
.paint-card{
box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
.backImg{
background: Linear-gradient(rgba(0, 0, 0, .4), rgba(0,0,0, .4)),
url("image/doc2.jpg");
height: 20vh;
width: 100%;
background-size: cover;
background-repeat: no-repeat;
}

</style>

</head>
<body>
<%@include file = "component/navbar.jsp" %>
<c:if test="${empty userObj }">
<c:redirect url ="user_login.jsp"></c:redirect>
</c:if>

<div class ="container-fluid backImg p-5">
<p class ="text-center fs-2 text-white"></p></div>
<div class="container p-3">
<div class = "row">
<div class ="col-md-9">
<div class ="card paint-card">
<div class = "card-body">
<p class = "text-center fs-3">Appointment List</p>

<table class="table">
<thead>
<tr>
<th scope="col"> Full Name </th>
<th scope="col">Gender</th>
<th scope="col">Age</th>
<th scope="col">Appoint Date</th>
<th scope="col">Diseases</th>
<th scope="col">Doctor Name</th>
<th scope="col">Status</th>
</tr>
</thead>
<tbody>
<%
    User user = (User) session.getAttribute("userObj");
    AppointmentDao dao = new AppointmentDao(DBconnect.getConn());
    DoctorDao dao2 = new DoctorDao(DBconnect.getConn());
    List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());

    for (Appointment ap : list) {
        Doctor d = dao2.getDoctorById(ap.getDoctorId());
%>
        <tr>
            <th><%= ap.getFullName() %></th>
            <td><%= ap.getGender() %></td>
            <td><%= ap.getAge() %></td>
            <td><%= ap.getAppoinDate() %></td>
            <td><%= ap.getDiseases() %></td>
            <td><%= d.getFullName() %></td> <!-- Use doctor's full name -->
            <td>
                <%
                    if ("pending".equals(ap.getStatus())) {
                %>
                    <a href="#" class="btn btn-sm btn-warning">Pending</a>
                <%
                    } else {
                %>
                    <%= ap.getStatus() %>
                <%
                    }
                %>
            </td>
        </tr>
<%
    }
%>

</tbody>
</table>
</div>
</div>
</div>

<div class ="col-md-3 p-3">
<img alt ="" src="image/doc2.jpg">

</div>
</div>
</div>

</body>
</html>