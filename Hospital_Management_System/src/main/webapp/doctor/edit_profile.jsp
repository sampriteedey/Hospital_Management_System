<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page import="com.dao.DoctorDao, com.db.DBconnect, com.entity.Doctor, java.util.List" %>

<%@ page import="com.dao.SpecialistDao, com.db.DBconnect, com.entity.Specialist, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type = "text/css">
.paint-card{
box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="../component/allcss.jsp" %>

</head>
<body>
<c:if test ="${empty doctObj }">
<c:redirect url="../doctor_login.jsp">
</c:redirect>


</c:if>
<%@include file="navbar.jsp" %>
<div class ="container p-4">
<div class="row">
<div class="col-md-4 ">
<div class="card ">

<p class ="fs-4 text-center">Change Password</p>
<c:if test ="${not empty errorMsg}">
<p class ="fs-5 text-center text-danger">${errorMsg}</p>
<c:remove var= "errorMsg" scope = "session" />
</c:if>

<c:if test ="${not empty succMsg}">
<p class ="fs-5 text-center text-success ">${succMsg}</p>
<c:remove var= "succMsg" scope = "session" />
</c:if>
<div class = "card-body">
<form action = "../doctChangePassword" method="post">


<div class="mb-3">
<label class ="form-Label" >Enter new password</label>
<input required name ="newPassword" type="text" class="form-control">
</div>

<div class="mb-3">
<label class ="form-Label" >Enter old Password</label>
<input required name ="oldPassword" type="text" class="form-control">
</div>

<input type="hidden" value="${userObj.id }" name="uid">

<button type="submit" class="btn bg-success text-white col-md-12">Change Password</button>


</form>
</div>
</div></div>
<div class="col-md-5 offset-md-2">
<div class ="card paint-card">
<p class ="text-center fs-3">Edit Profile</p>
<div class="card-body">
<form action="../doctorUpdateProfile" method="post">
      <div class="mb-3">
      <label class="form-Label">Full Name</label>
      <input type="text" required name="fullname" class="form-control" values ="${doctObj.fullName }">
      
      </div>
      <div class="mb-3">
      <label class="form-Label">DOB</label>
      <input type="text" required name="dob" class="form-control" values ="${doctObj.dob }">
      
      </div>
      <div class="mb-3">
      <label class="form-Label">Qualification</label>
      <input type="text" required name="qualification" class="form-control" values ="${doctObj.qualification }">
      
      </div>
      <div class="mb-3">
      <label class="form-Label">Specialist</label>
      <select name="specialist" required class="form-control" >
      <option>${doctObj.specialist }</option>
      
      <%
                                SpecialistDao dao = new SpecialistDao(DBconnect.getConn());
                                List<Specialist> list = dao.getAllSpecialist();
                                for(Specialist s : list) {
                                %>
                                    <option><%=s.getSpecialistName() %></option>
                                <%
                                }
                                %>
      
      
      
      </select>
      </div>
      <div class="mb-3">
      <label class="form-Label">Email</label>
      <input type="text" required name="email" class="form-control" values ="${doctObj.email }">
      
      </div>
      <div class="mb-3">
      <label class="form-Label">MOB NO</label>
      <input type="text" required name="mobno" class="form-control" values ="${doctObj.mobno }">
      
      </div>
      <input type ="hidden" name ="id" value="${doctObj.id }"
      >
      <button type="submit" class="btn btn-primary">Update</button>
      </form>
             
</div>
</div>
</div>


</div></div>
</body>
</html>