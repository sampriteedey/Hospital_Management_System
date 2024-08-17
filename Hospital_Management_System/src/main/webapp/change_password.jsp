<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
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
<%@include file = "component/navbar.jsp" %>
<c:if test="${empty userObj }">
<c:redirect url ="user_login.jsp"></c:redirect>
</c:if>


<div class ="container p-4">
<div class="row">
<div class="col-md-4 offset-md-4">
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
<form action = "UserChangePassword" method="post">


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
</div></div></div></div>
</body>
</html>