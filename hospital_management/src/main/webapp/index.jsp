<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index page</title>
<%@include file="component/allcss.jsp" %>

<style type="text/css">
/* Custom CSS for Hospital Management System */
:root {
    --primary-color: #3498db;
    --secondary-color: #2ecc71;
    --dark-color: #2c3e50;
    --light-color: #ecf0f1;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: var(--light-color);
    color: var(--dark-color);
    line-height: 1.6;
}

/* Key Features Section */
.container .row .col-md-3 .card {
    transition: all 0.3s ease;
    margin-bottom: 30px;
}

.container .row .col-md-3 .card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 30px rgba(0,0,0,0.1) !important;
}

.card-body i {
    margin-bottom: 15px;
    transition: color 0.3s ease;
}

.card-body i:hover {
    color: var(--primary-color) !important;
}

/* Team Section */
.container .row .col-md-3 .card {
    border: none;
    border-radius: 10px;
    overflow: hidden;
}

.card img {
    height: 250px;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.card:hover img {
    transform: scale(1.1);
}

/* Footer Modifications */
footer {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color)) !important;
    color: white !important;
    padding: 50px 0;
}

footer h5 {
    text-transform: uppercase;
    letter-spacing: 2px;
    margin-bottom: 20px;
}

footer .social-icons a {
    color: white;
    margin: 0 10px;
    font-size: 24px;
    transition: transform 0.3s ease;
}

footer .social-icons a:hover {
    transform: scale(1.2);
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    .container .row .col-md-3 {
        margin-bottom: 20px;
    }
}

/* Bootstrap Enhancements */
.shadow-lg {
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
}

.btn-primary {
    background-color: var(--primary-color);
    border-color: var(--primary-color);
}

.btn-secondary {
    background-color: var(--secondary-color);
    border-color: var(--secondary-color);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp" %>
	

	
	
	<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/a6.jpg" class="d-block w-100" alt="..." height= "590px">
    </div>
    <div class="carousel-item">
      <img src="img/a2.jpg" class="d-block w-100" alt="..." height="590px">
    </div>
    <div class="carousel-item">
      <img src="img/f.jpg" class="d-block w-100" alt="..." height="590px">
    </div>
      <div class="carousel-item">
      <img src="img/a5.jpg" class="d-block w-100" alt="..." height="590px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


<div class="container my-5">
    <h2 class="text-center mb-4">Our Key Features</h2>
    <div class="row">
        <div class="col-md-3">
            <div class="card text-center shadow-lg p-3 mb-5 bg-body rounded">
                <div class="card-body">
                    <i class="fas fa-notes-medical fa-3x text-primary mb-3"></i>
                    <h5 class="card-title">Advanced Diagnostics</h5>
                    <p class="card-text">State-of-the-art medical diagnostic technologies</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center shadow-lg p-3 mb-5 bg-body rounded">
                <div class="card-body">
                    <i class="fas fa-user-md fa-3x text-success mb-3"></i>
                    <h5 class="card-title">Expert Doctors</h5>
                    <p class="card-text">Highly qualified and experienced medical professionals</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center shadow-lg p-3 mb-5 bg-body rounded">
                <div class="card-body">
                    <i class="fas fa-heartbeat fa-3x text-danger mb-3"></i>
                    <h5 class="card-title">24/7 Emergency</h5>
                    <p class="card-text">Emergency services typically have advanced medical technology</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center shadow-lg p-3 mb-5 bg-body rounded">
                <div class="card-body">
                    <i class="fas fa-procedures fa-3x text-info mb-3"></i>
                    <h5 class="card-title">Patient Care</h5>
                    <p class="card-text">Comprehensive and compassionate patient management</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Our Team Section -->
<div class="container my-5">
    <h2 class="text-center mb-4">Our Medical Team</h2>
    <div class="row">
        <div class="col-md-3">
            <div class="card text-center">
                <img src="img/doctor1.jpg" class="card-img-top" alt="Doctor 1">
                <div class="card-body">
                    <h5 class="card-title">Dr. John Smith</h5>
                    <p class="card-text">Cardiology Specialist</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <img src="img/doctor22.jpg" class="card-img-top" alt="Doctor 2">
                <div class="card-body">
                    <h5 class="card-title">Dr. Emily Johnson</h5>
                    <p class="card-text">Neurology Expert</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <img src="img/doctor3.jpg" class="card-img-top" alt="Doctor 3">
                <div class="card-body">
                    <h5 class="card-title">Dr. Michael Lee</h5>
                    <p class="card-text">Orthopedic Surgeon</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <img src="img/dcotor4.jpg" class="card-img-top" alt="Doctor 4">
                <div class="card-body">
                    <h5 class="card-title">Dr. Sarahi Williams</h5>
                    <p class="card-text">Pediatric Specialist</p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="component/footer.jsp" %>

</body>
</html>