<%@page import ="com.db.DBconnect" %>
<%@page import ="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index page</title>
<style type = "text/css">
.paint-card{
box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}


</style>
<%@include file = "component/allcss.jsp" %>

</head>
<body>
<%@include file = "component/navbar.jsp" %>
<% Connection conn = DBconnect.getConn();

%>


<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="image/medical.jpg" class="d-block w-100" alt="..." height = "500px">
    </div>
    <div class="carousel-item">
      <img src="image/beds.jpg" class="d-block w-100" alt="..." height = "500px">
    </div>
    <div class="carousel-item">
      <img src="image/surgery.jpg" class="d-block w-100" alt="..." height = "500px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<div class="container p-3">
  <p class="text-center fs-2">Key Features of Our Hospital</p>

  <div class="row justify-content-center">
    <!-- Cards Column -->
    <div class="col-md-8">
      <div class="row gy-3">
        <div class="col-md-6">
          <div class="card paint-card h-100">
            <div class="card-body">
              <p class="fs-5">Cutting-Edge Diagnostic and Treatment Facilities:</p>
              <p>Utilization of the latest technology for accurate diagnostics and effective treatment plans.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card paint-card h-100">
            <div class="card-body">
              <p class="fs-5">Advanced Inpatient Care:</p>
              <p>Comfortable general and private rooms equipped with modern amenities and round-the-clock medical attention.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card paint-card h-100">
            <div class="card-body">
              <p class="fs-5">Comprehensive Emergency Services:</p>
              <p>24/7 emergency care with state-of-the-art trauma rooms and rapid response teams.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card paint-card h-100">
            <div class="card-body">
              <p class="fs-5">Specialized Outpatient Clinics:</p>
              <p>Access to expert consultations and treatments across various specialties without the need for an overnight stay.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Image Column -->
    <div class="col-md-4 d-flex align-items-center">
      <img class="img-fluid rounded" alt="" src="image/hospital.jpg">
    </div>
  </div>
  <hr>
</div>




<div class ="container p-2">
<p class ="text-center fs-2">Our Team</p>


<div class="row">
<div class= "col-md-3 ">

<div class ="card paint-card">
<div class = "card body text-center">
<img src = "image/doc1.png" width ="250px" height ="300px">
<p class="fw-bold fs-5">Samuani Simi</p>
<p class ="fs-7"> CEO and CHAIRMAN</p>
</div>
</div>
</div>

<div class= "col-md-3 ">

<div class ="card paint-card">
<div class = "card body text-center">
<img src = "image/doc4.jpeg" width ="250px" height ="300px">
<p class="fw-bold fs-5">Samuani Simi</p>
<p class ="fs-7"> CEO and CHAIRMAN</p>
</div>
</div>
</div>

<div class= "col-md-3 ">

<div class ="card paint-card">
<div class = "card body text-center">
<img src = "image/doc3.jpeg" width ="250px" height ="300px">
<p class="fw-bold fs-5">Samuani Simi</p>
<p class ="fs-7"> CEO and CHAIRMAN</p>
</div>
</div>
</div>

<div class= "col-md-3 ">

<div class ="card paint-card">
<div class = "card body text-center">
<img src = "image/doc2.jpeg" width ="250px" height ="300px">
<p class="fw-bold fs-5">Samuani Simi</p>
<p class ="fs-7"> CEO and CHAIRMAN </p>
</div>
</div>
</div>

</div>
</div>

<%@include file="component/footer.jsp" %>


</body>
</html>