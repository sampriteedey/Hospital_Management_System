<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-medical"></i> PROhealth</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
       
      
        <c:if test="${empty userObj }">
<li class="nav-item">
          <a class="nav-link active" aria-current="page" href="admin_login.jsp"><i class ="fas fa-sign-in-alt" ></i> ADMIN</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="doctor_login.jsp">DOCTOR</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_login.jsp">USER</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_appointment.jsp">APPOINTMENT</a>
        </li>
        </c:if>
        
        <c:if test="${not empty userObj }">
        <li class ="nav-item"><a class="nav-link active" aria-current ="page" href="user_appointment.jsp">Appointment</a></li>
        <li class ="nav-item"><a class="nav-link active" aria-current ="page" href="view_appointment.jsp">View Appointment</a></li>
        <div class="dropdown">
   <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    <i class="fas fa-user-circle"></i>${userObj.fullName }
  </button>
            
            
          
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><a class="dropdown-item" href="change_password.jsp">change password</a></li>
    <li><a class="dropdown-item" href="userLogout">logout</a></li>
    
  </ul>
</div>
</c:if>
        
        
        
 
        <!--<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>-->
        </ul>
    </div>
  </div>
</nav>