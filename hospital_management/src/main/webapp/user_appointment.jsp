<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
/* Background Styling */
.backImg {
    background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)), url("img/kk.jpg");
    height: 20vh;
    width: 100%;
    background-size: cover;
    background-repeat: no-repeat;
}

/* Light Blue Glassmorphic Card Styling */
.paint-card {
    width: 100%;
    background: rgba(230, 240, 250, 0.6); /* Soft faint blue */
    padding: 30px;
    border-radius: 15px;
    border: 1px solid rgba(100, 149, 237, 0.3); /* Light blue border */
    box-shadow: 
        0 15px 35px rgba(100, 149, 237, 0.2), 
        0 5px 15px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(15px);
    transition: all 0.3s ease;
}

.paint-card:hover {
    transform: translateY(-10px);
    box-shadow: 
        0 20px 40px rgba(100, 149, 237, 0.3), 
        0 7px 20px rgba(0, 0, 0, 0.15);
}

/* Card Header */
.card-header {
    background: rgba(173, 216, 230, 0.6); /* Very light blue */
    color: #2C3E50; /* Darker text for contrast */
    font-size: 1.4rem;
    text-align: center;
    font-weight: bold;
    padding: 15px;
    border-radius: 10px;
}

/* Form Styling */
.form-control {
    background: rgba(255, 255, 255, 0.7);
    border: 1px solid #B0E0E6; /* Pale blue */
    color: #4682B4;
    border-radius: 8px;
}

.form-control:focus {
    border-color: #5DADE2;
    box-shadow: 0 0 8px rgba(100, 149, 237, 0.5);
}

/* Button Styling */
.btn-primary {
    background: #5DADE2;
    border: none;
    color: white;
    border-radius: 8px;
    font-size: 1.1rem;
    transition: all 0.3s;
}

.btn-primary:hover {
    background: #4682B4;
    transform: translateY(-3px);
}

/* Title Styling */
h2 {
    color: #2C3E50;
    text-align: center;
    margin-bottom: 20px;
    position: relative;
}

h2::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 3px;
    background: linear-gradient(to right, #5DADE2, #4682B4);
}
</style>

</head>

<body>
    <%@include file="component/navbar.jsp"%>

    <div class="container-fulid backImg p-5">
        <p class="text-center fs-2 text-white"></p>
    </div>

    <div class="container p-3">
        <div class="row">
            <!-- Image Column -->
            <div class="col-md-6 p-5 d-flex align-items-center justify-content-center">
                <img src="img/ll.jpg" class="img-fluid rounded shadow-lg" alt="Appointment Image">
            </div>

            <!-- Appointment Form Column -->
            <div class="col-md-6">
                <div class="card paint-card">
                    <div class="card-header">User Appointment</div>
                    <div class="card-body">
                        
                        <c:if test="${not empty errorMsg}">
                            <p class="fs-4 text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <p class="fs-4 text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <form class="row g-3" action="appAppointment" method="post">
                            <input type="hidden" name="userid" value="${userObj.id }">

                            <div class="col-md-6">
                                <label class="form-label">Full Name</label>
                                <input required type="text" class="form-control" name="fullname">
                            </div>

                            <div class="col-md-6">
                                <label>Gender</label>
                                <select class="form-control" name="gender" required>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Age</label>
                                <input required type="number" class="form-control" name="age">
                            </div>

                        <div class="col-md-6">
    <label class="form-label">Appointment Date</label>
    <input type="date" class="form-control" required name="appoint_date" id="appoint_date" pattern="\d{4}-\d{2}-\d{2}">
</div>

<div class="col-md-6">
    <label class="form-label">Email</label>
    <input required type="email" class="form-control" name="email">
</div>

<div class="col-md-6">
    <label class="form-label">Phone No</label>
    <input maxlength="10" minlength="10" required type="text" class="form-control" name="phno" id="phno" pattern="\d{10}" title="Phone number must be exactly 10 digits">
</div>

<script>
    // Ensure valid phone number (10 digits only)
    document.getElementById('phno').addEventListener('input', function() {
        this.value = this.value.replace(/[^0-9]/g, '').slice(0, 10);
    });

    // Validate date format (YYYY-MM-DD)
    document.getElementById('appoint_date').addEventListener('input', function() {
        const datePattern = /^\d{4}-\d{2}-\d{2}$/;
        if (!datePattern.test(this.value)) {
            this.setCustomValidity('Date must be in YYYY-MM-DD format');
        } else {
            this.setCustomValidity('');
        }
    });
</script>


                            <div class="col-md-6">
                                <label class="form-label">Diseases</label>
                                <input required type="text" class="form-control" name="diseases">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Doctor</label>
                                <select required class="form-control" name="doct">
                                    <option value="">--select--</option>
                                    <%
                                    DoctorDao dao = new DoctorDao(DBConnect.getConn());
                                    List<Doctor> list = dao.getAllDoctor();
                                    for (Doctor d : list) {
                                    %>
                                    <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>

                            <div class="col-md-12">
                                <label>Full Address</label>
                                <textarea required name="address" class="form-control" rows="3"></textarea>
                            </div>

                            <c:if test="${empty userObj }">
                                <a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-primary">Submit</a>
                            </c:if>

                            <c:if test="${not empty userObj }">
                                <button class="col-md-6 offset-md-3 btn btn-primary">Submit</button>
                            </c:if>                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>  
    <%@include file="component/footer.jsp" %>
      
</body>
